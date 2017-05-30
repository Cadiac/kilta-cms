const Lab = require('lab');
const { expect } = require('code');
const nock = require('nock');

const lab = exports.lab = Lab.script();
const { describe, it, before, afterEach } = lab;

const { dataTypes } = require('../src/directus');

const {
  setupCachedServer,
  mockMissingDirectusEntry,
  mockMissingDirectusEntries,
  mockExistingDirectusEntry,
  mockExistingDirectusEntries,
  mockCreateDirectusEntry } = require('./test-helpers');

describe('API', () => {
  let server;
  let userToken1 = null;
  let userToken2 = null;

  before((done) => {
    setupCachedServer((err, newServer) => {
      if (err) {
        return done(err);
      }
      server = newServer;
      return done();
    });
  });

  afterEach((done) => {
    nock.cleanAll();
    done();
  });

  describe('POST /api/v1/auth/login', () => {
    it('should return Forbidden for invalid password', (done) => {
      const options = {
        method: 'POST',
        url: '/api/v1/auth/login',
        payload: {
          username: 'testuser',
          password: 'wrongpassword',
        },
      };

      mockMissingDirectusEntries(dataTypes.members.table, 'missing.json');
      server.inject(options, (response) => {
        expect(response.statusCode).to.equal(403);
        done();
      });
    });

    it('should return Authorization token for valid login', (done) => {
      const options = {
        method: 'POST',
        url: '/api/v1/auth/login',
        payload: {
          username: 'testuser',
          password: 'testpassword',
        },
      };

      mockExistingDirectusEntries(dataTypes.members.table, 'auth.json');
      server.inject(options, (response) => {
        expect(response.statusCode).to.equal(200);
        expect(response.result.token).to.not.be.empty();

        // Store token for usage in later tests
        userToken1 = response.result.token;
        done();
      });
    });

    it('should return different token for another user', (done) => {
      const options = {
        method: 'POST',
        url: '/api/v1/auth/login',
        payload: {
          username: 'testuser',
          password: 'testpassword',
        },
      };

      mockExistingDirectusEntries(dataTypes.members.table, 'auth2.json');
      server.inject(options, (response) => {
        expect(response.statusCode).to.equal(200);
        expect(response.result.token).to.not.be.empty();
        expect(userToken1).to.not.equal(response.result.token);

        // Store token for usage in later tests
        userToken2 = response.result.token;
        done();
      });
    });
  });

  describe('GET /api/v1/events', () => {
    it('should return list of events', (done) => {
      mockExistingDirectusEntries(dataTypes.events.table, 'events.json');
      server.inject('/api/v1/events', (response) => {
        expect(response.statusCode).to.equal(200);
        expect(response.result).to.not.be.empty();
        done();
      });
    });
    it('should work when no events exist', (done) => {
      mockMissingDirectusEntries(dataTypes.events.table);
      server.inject('/api/v1/events', (response) => {
        expect(response.statusCode).to.equal(200);
        expect(response.result).to.be.empty();
        done();
      });
    });
  });

  describe('GET /api/v1/events/{id}', () => {
    it('should return single event by id', (done) => {
      mockExistingDirectusEntry(123, dataTypes.events.table, 'event.json');
      server.inject('/api/v1/events/123', (response) => {
        expect(response.statusCode).to.equal(200);
        expect(response.result).to.not.be.empty();
        expect(response.result.id).to.equal(123);
        done();
      });
    });
    it('should not find nonexisting event', (done) => {
      mockMissingDirectusEntry(124, dataTypes.events.table);
      server.inject('/api/v1/events/124', (response) => {
        expect(response.statusCode).to.equal(404);
        done();
      });
    });
  });

  describe('GET /api/v1/events/past', () => {
    it('should return list of past events', (done) => {
      mockExistingDirectusEntries(dataTypes.events.table, 'events.json');
      server.inject('/api/v1/events/past', (response) => {
        expect(response.statusCode).to.equal(200);
        expect(response.result).to.not.be.empty();
        done();
      });
    });
    it('should work when no past events exist', (done) => {
      mockMissingDirectusEntries(dataTypes.events.table);
      server.inject('/api/v1/events/past', (response) => {
        expect(response.statusCode).to.equal(200);
        expect(response.result).to.be.empty();
        done();
      });
    });
  });

  describe('GET /api/v1/events/upcoming', () => {
    it('should return list of upcoming events', (done) => {
      mockExistingDirectusEntries(dataTypes.events.table, 'events.json');
      server.inject('/api/v1/events/upcoming', (response) => {
        expect(response.statusCode).to.equal(200);
        expect(response.result).to.not.be.empty();
        done();
      });
    });
    it('should work when no upcoming events exist', (done) => {
      mockMissingDirectusEntries(dataTypes.events.table);
      server.inject('/api/v1/events/upcoming', (response) => {
        expect(response.statusCode).to.equal(200);
        expect(response.result).to.be.empty();
        done();
      });
    });
  });

  describe('POST /api/v1/events/{id}', () => {
    it('should return Unauthorized when user is not logged in', (done) => {
      const options = {
        method: 'POST',
        url: '/api/v1/events/123',
      };

      server.inject(options, (response) => {
        expect(response.statusCode).to.equal(401);
        done();
      });
    });

    it('should return 400 already registered when already participating event', (done) => {
      const options = {
        method: 'POST',
        url: '/api/v1/events/123',
        headers: {
          Authorization: `Bearer ${userToken2}`,
        },
      };

      mockExistingDirectusEntry(4, dataTypes.members.table, 'member.json');
      mockExistingDirectusEntry(123, dataTypes.events.table, 'event.json'); // this fails
      mockCreateDirectusEntry(dataTypes.eventParticipants.table, 'events.json', {
        active: 1,
        member_id: 321,
        event_id: 123,
      });

      server.inject(options, (response) => {
        expect(response.statusCode).to.equal(400);
        expect(response.result).to.not.be.empty();
        expect(response.result.message).to.equal('You have already registered for this event!');
        done();
      });
    });

    it('should let user successfully register to event', (done) => {
      const options = {
        method: 'POST',
        url: '/api/v1/events/123',
        headers: {
          Authorization: `Bearer ${userToken1}`,
        },
      };

      mockExistingDirectusEntry(6, dataTypes.members.table, 'member.json');
      mockExistingDirectusEntry(123, dataTypes.events.table, 'event.json'); // this fails
      mockCreateDirectusEntry(dataTypes.eventParticipants.table, 'events.json', {
        active: 1,
        member_id: 6,
        event_id: 123,
      });

      server.inject(options, (response) => {
        expect(response.statusCode).to.equal(201);
        done();
      });
    });
  });
});
