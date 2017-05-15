const Auth = require('./routes/auth');
const News = require('./routes/news');
const Events = require('./routes/events');
const Pages = require('./routes/pages');
const Footer = require('./routes/footer');
const Sponsors = require('./routes/sponsors');
const Members = require('./routes/members');

exports.register = (plugin, options, next) => {
  const events = Events(plugin);

  plugin.route([
    { method: 'POST', path: '/auth/login', config: Auth.login },
    { method: 'GET', path: '/info', config: Pages.getGuildInformation },
    { method: 'GET', path: '/news', config: News.getNewsArticles },
    { method: 'GET', path: '/news/categories', config: News.getNewsCategories },
    { method: 'GET', path: '/news/{id}', config: News.getNewsArticle },
    { method: 'GET', path: '/events', config: events.getEvents },
    { method: 'GET', path: '/events/{id}', config: events.getEvent },
    { method: 'POST', path: '/events/{id}', config: events.participateEvent },
    { method: 'GET', path: '/events/past', config: events.getPastEvents },
    { method: 'GET', path: '/events/upcoming', config: events.getUpcomingEvents },
    { method: 'GET', path: '/footer', config: Footer.getFooter },
    { method: 'GET', path: '/sponsors', config: Sponsors.getSponsors },
    { method: 'GET', path: '/pages', config: Pages.getSubPages },
    { method: 'GET', path: '/pages/{slug}', config: Pages.getSubPageBySlug },
    { method: 'GET', path: '/pages/boards', config: Pages.getGuildBoards },
    { method: 'GET', path: '/pages/boards/{year}', config: Pages.getGuildBoardByYear },
    { method: 'GET', path: '/members/me', config: Members.getCurrentUser },
    { method: 'PUT', path: '/members/me', config: Members.updateCurrentUser },
    { method: 'DELETE', path: '/members/me', config: Members.deleteCurrentUser },
  ]);

  next();
};

exports.register.attributes = {
  name: 'api',
};
