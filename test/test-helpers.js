const Hapi = require('hapi');
const authPlugin = require('hapi-auth-jwt2');
const cacheService = require('../src/services/cache');

const config = require('../src/config/config');

const apiPlugin = require('../src/api');

const nock = require('nock');

const setupCachedServer = (done) => {
  const server = new Hapi.Server({
    cache: [
      {
        name: 'redisCache',
        engine: require('catbox-redis'),
        url: config.redisUrl,
        partition: `tests${Math.ceil(Math.random() * 100000000)}`,
      }
    ]
  });

  server.connection({ port: config.port });

  cacheService.initCaches(server, () => {
    console.log('Cache initialized successfully');
  });

  server.register(authPlugin);

  server.auth.strategy('jwt', 'jwt', {
    key: config.API_SECRET_KEY,
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

    return server.initialize(() => {
      done(null, server);
    });
  });
};

const mockDirectusEvents = () =>
  nock(config.directusApiUrl)
    .get('/1.1/tables/events/rows')
    .query(true)
    .reply(200, require('./mocks/events'));

module.exports = {
  setupCachedServer,
  mockDirectusEvents,
};
