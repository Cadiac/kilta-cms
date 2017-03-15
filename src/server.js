/* eslint-disable global-require */

const config = require('./config/config');
const Hapi = require('hapi');

const server = new Hapi.Server();

// allow port configuration through argv
server.connection({
  host: 'localhost',
  port: config.port,
});

const validate = (decoded, request, callback) => {
  return callback(null, false);
};

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
  key: 'NeverShareYourSecret',
  validateFunc: validate,
  verifyOptions: { algorithms: ['HS256'] },
});

// server.auth.default('jwt');

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
