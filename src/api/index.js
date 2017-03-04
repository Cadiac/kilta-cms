const Hello = require('./routes/hello');
const News = require('./routes/news');

exports.register = (plugin, options, next) => {
  plugin.route([
    { method: 'GET', path: '/hello', config: Hello.hello },
    { method: 'GET', path: '/news', config: News.getNews },
  ]);

  next();
};

exports.register.attributes = {
  name: 'api',
};
