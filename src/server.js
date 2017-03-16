/* eslint-disable global-require */

const config = require('./config/config');
const auth = require('./services/auth');
const Hapi = require('hapi');

const server = new Hapi.Server();

// allow port configuration through argv
server.connection({
  host: config.host,
  port: config.port,
});

// Register api and plugins
server.register([
  {
    // logging
    register: require('good'),
    options: require('./config/logging'),
  }, {
    // prints routes on startup
    register: require('blipp'),
    options: {},
  },
  // needed by lout
  require('vision'),
  require('inert'),
  {
    // api documentation
    register: require('lout'),
    options: {},
  }, {
    // JWT authentication
    register: require('hapi-auth-jwt2'),
    options: {},
  }], {}, (err) => {
    if (err) {
      throw err;
    }
  });

server.auth.strategy('jwt', 'jwt', {
  key: config.apiSecretKey,
  validateFunc: auth.validateToken,
  verifyOptions: { algorithms: ['HS256'] },
});

server.register({
  // api
  register: require('./api'),
  options: {},
  routes: {
    prefix: '/api/v1',
  },
});

server.start(() => {
  console.log('Server running at:', server.info.uri);
});
