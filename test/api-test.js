const Hapi = require('hapi');
const Lab = require('lab');
const { expect } = require('code');

const authPlugin = require('hapi-auth-jwt2');
const apiPlugin = require('../src/api');

const cacheService = require('../src/services/cache');

const lab = exports.lab = Lab.script();
const { describe, it, before } = lab;

const config = require('../src/config/config');

describe('API', () => {
  let server;

  before((done) => {
    server = new Hapi.Server({
      cache: [
        {
          name: 'redisCache',
          engine: require('catbox-redis'),
          url: config.redisUrl,
          partition: 'cache'
        }
      ]
    });

    server.connection({ port: 8000 });

    cacheService.initCaches(server, () => {
      console.log('Cache initialized successfully');
    });

    server.register(authPlugin);

    server.auth.strategy('jwt', 'jwt', {
      key: 'testsecretkey',
      validateFunc: token => token === 'testtoken',
      verifyOptions: { algorithms: ['HS256'] },
    });

    server.register({
      register: apiPlugin,
      options: {},
      routes: {
        prefix: '/api/v1',
      },
    }, (err) => {
      if (err) {
        return done(err);
      }

      return server.initialize(done);
    });
  });

  it('should return http status 200 for known route', (done) => {
    server.inject('/api/v1/info', (response) => {
      expect(response.statusCode).to.equal(200);
      done();
    });
  });
});
