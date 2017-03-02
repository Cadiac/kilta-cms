const Hello = require('./routes/hello');

exports.register = (plugin, options, next) => {
  plugin.route([
    { method: 'GET', path: '/hello', config: Hello.hello },
  ]);

  next();
};

exports.register.attributes = {
  name: 'api',
};
