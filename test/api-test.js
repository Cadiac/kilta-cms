const Lab = require('lab');
const { expect } = require('code');
const nock = require('nock');

const lab = exports.lab = Lab.script();
const { describe, it, before, afterEach } = lab;

const { setupCachedServer, mockDirectusEvents } = require('./test-helpers');

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

  describe('/api/v1/events', () => {
    it('should return list of events', (done) => {
      mockDirectusEvents();
      server.inject('/api/v1/events', (response) => {
        expect(response.statusCode).to.equal(200);
        done();
      });
    });
  });
});
