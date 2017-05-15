const eventService = require('./events');
// const commonService = require('./common');
// const guildService = require('./guild');
// const newsService = require('./news');

const initCaches = (server, next) => {
  eventService.initCache(server);
  // commonService.initCache(server);
  // guildService.initCache(server);
  // newsService.initCache(server);

  next();
};

module.exports = {
  initCaches,
};
