const News = require('./routes/news');
const Events = require('./routes/events');

exports.register = (plugin, options, next) => {
  plugin.route([
    { method: 'GET', path: '/news', config: News.getNews },
    { method: 'GET', path: '/events/past', config: Events.getPastEvents },
    { method: 'GET', path: '/events/upcoming', config: Events.getUpcomingEvents },
  ]);

  next();
};

exports.register.attributes = {
  name: 'api',
};
