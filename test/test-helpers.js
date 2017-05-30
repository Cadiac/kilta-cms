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

const mockMissingDirectusEntry = (id, table, mock = 'missing', query = true) =>
  nock(config.directusApiUrl)
    .get(`/1.1/tables/${table}/rows/${id}`)
    .query(query)
    .reply(200, require(`./mocks/${mock}`));

const mockMissingDirectusEntries = (table, mock = 'missing', query = true) =>
  nock(config.directusApiUrl)
    .get(`/1.1/tables/${table}/rows`)
    .query(query)
    .reply(200, require(`./mocks/${mock}`));

const mockExistingDirectusEntry = (id, table, mock, query = true) =>
  nock(config.directusApiUrl)
    .get(`/1.1/tables/${table}/rows/${id}`)
    .query(query)
    .reply(200, require(`./mocks/${mock}`));

const mockExistingDirectusEntries = (table, mock, query = true) =>
  nock(config.directusApiUrl)
    .get(`/1.1/tables/${table}/rows`)
    .query(query)
    .reply(200, require(`./mocks/${mock}`));

const mockCreateDirectusEntry = (table, mock, data) =>
  nock(config.directusApiUrl)
    .post(`/1.1/tables/${table}/rows`, data)
    .reply(201, require(`./mocks/${mock}`));

module.exports = {
  setupCachedServer,
  mockMissingDirectusEntry,
  mockMissingDirectusEntries,
  mockExistingDirectusEntry,
  mockExistingDirectusEntries,
  mockCreateDirectusEntry
};
