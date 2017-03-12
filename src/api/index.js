const News = require('./routes/news');
const Events = require('./routes/events');
const Pages = require('./routes/pages');
const Footer = require('./routes/footer');
const Sponsors = require('./routes/sponsors');

exports.register = (plugin, options, next) => {
  plugin.route([
    { method: 'GET', path: '/news', config: News.getNews },
    { method: 'GET', path: '/events/past', config: Events.getPastEvents },
    { method: 'GET', path: '/events/upcoming', config: Events.getUpcomingEvents },
    { method: 'GET', path: '/pages', config: Pages.getSubPages },
    { method: 'GET', path: '/pages/{slug}', config: Pages.getSubPageBySlug },
    { method: 'GET', path: '/pages/boards', config: Pages.getGuildBoards },
    { method: 'GET', path: '/pages/boards/{year}', config: Pages.getGuildBoardByYear },
    { method: 'GET', path: '/footer', config: Footer.getFooter },
    { method: 'GET', path: '/sponsors', config: Sponsors.getSponsors },
  ]);

  next();
};

exports.register.attributes = {
  name: 'api',
};
