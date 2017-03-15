const jwt = require('hapi-auth-jwt2');

const validate = (decoded, request, callback) => {
  return callback(null, false);
};

const register = (server, options, next) => {
  server.register(jwt, (err) => {
    if (err) {
      console.log('Auth registration failed!');
    }

    server.auth.strategy('jwt', 'jwt', {
      key: 'NeverShareYourSecret',
      validateFunc: validate,
      verifyOptions: { algorithms: ['HS256'] },
    });

    server.auth.default('jwt');
    next();
  });
};

register.attributes = {
  name: 'jwt-auth-wrapper',
  version: '0.0.1',
};

module.exports = register;
