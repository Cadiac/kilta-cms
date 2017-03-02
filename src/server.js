/* eslint-disable global-require */

const config = require('./config/config');
const Hapi = require('hapi');

const server = new Hapi.Server();

// allow port configuration through argv
server.connection({
  host: 'localhost',
  port: config.port,
});

// Register api and plugins
server.register([
  {
    // api
    register: require('./api'),
    options: {},
    routes: {
      prefix: '/api/v1',
    },
  }, {
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
  }], {}, (err) => {
    if (err) {
      throw err;
    }
  });

server.start(() => {
  console.log('Server running at:', server.info.uri);
});
