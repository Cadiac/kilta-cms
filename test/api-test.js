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
    it('should be able to participate event as authenticated user', (done) => {
      const options = {
        method: 'POST',
        url: '/api/v1/events/123',
        headers: {
          Authorization: 'Bearer testtoken', // TODO
        },
      };

      mockExistingDirectusEntry(123, dataTypes.events.table, 'event.json');
      mockCreateDirectusEntry(dataTypes.eventParticipants.table, 'events.json', {
        active: 1,
        member_id: 321,
        event_id: 123,
      });

      server.inject(options, (response) => {
        expect(response.statusCode).to.equal(200);
        expect(response.result).to.not.be.empty();
        done();
      });
    });

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
  });
});
