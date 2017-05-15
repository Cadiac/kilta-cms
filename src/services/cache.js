const config = require('../config/config');

const { fetchEvent, fetchEvents, fetchUpcomingEvents, fetchPastEvents }
  = require('./events');

// const commonService = require('./common');
// const guildService = require('./guild');
// const newsService = require('./news');

const { constants } = require('../directus');

const { perPage } = constants;

const cache = {
  cache: 'redisCache',
  expiresIn: config.cacheDuration, // 10 minutes
  generateTimeout: config.cacheGenerateTimeout,
};

const initEventCache = (server) => {
  const generateEventsKey = (currentPage = 0, limit = perPage) =>
    `${currentPage},${limit}`;

  server.method('fetchEvent', fetchEvent, {
    cache,
    callback: false,
  });

  server.method('fetchEvents', fetchEvents, {
    cache,
    callback: false,
    generateKey: generateEventsKey,
  });

  server.method('fetchUpcomingEvents', fetchUpcomingEvents, {
    cache,
    callback: false,
    generateKey: generateEventsKey,
  });

  server.method('fetchPastEvents', fetchPastEvents, {
    cache,
    callback: false,
    generateKey: generateEventsKey,
  });
};

const initCaches = (server, next) => {
  initEventCache(server);
  // commonService.initCache(server);
  // guildService.initCache(server);
  // newsService.initCache(server);

  next();
};

module.exports = {
  initCaches,
};
