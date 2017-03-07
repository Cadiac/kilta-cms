const News = require('./routes/news');
const Events = require('./routes/events');
const Pages = require('./routes/pages');

exports.register = (plugin, options, next) => {
  plugin.route([
    { method: 'GET', path: '/news', config: News.getNews },
    { method: 'GET', path: '/events/past', config: Events.getPastEvents },
    { method: 'GET', path: '/events/upcoming', config: Events.getUpcomingEvents },
    { method: 'GET', path: '/pages/boards', config: Pages.getGuildBoards },
    { method: 'GET', path: '/pages/boards/{year}', config: Pages.getGuildBoardByYear },
  ]);

  next();
};

exports.register.attributes = {
  name: 'api',
};
