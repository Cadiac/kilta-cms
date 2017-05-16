const config = require('../config/config');

const eventService = require('./events');
const commonService = require('./common');
const newsService = require('./news');
const guildService = require('./guild');

const { constants } = require('../directus');

const { perPage } = constants;

const cache = {
  cache: 'redisCache',
  expiresIn: config.cacheDuration, // 10 minutes
  generateTimeout: config.cacheGenerateTimeout,
};

const initEventCache = (server) => {
  const {
    fetchEvent,
    fetchEvents,
    fetchUpcomingEvents,
    fetchPastEvents } = eventService;

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

const initCommonCache = (server) => {
  const {
    fetchSubPages,
    fetchSubPageBySlug,
    fetchFooter,
    fetchSponsors } = commonService;

  server.method('fetchSubPages', fetchSubPages, {
    cache,
    callback: false,
  });

  server.method('fetchSubPageBySlug', fetchSubPageBySlug, {
    cache,
    callback: false,
  });

  server.method('fetchFooter', fetchFooter, {
    cache,
    callback: false,
  });

  server.method('fetchSponsors', fetchSponsors, {
    cache,
    callback: false,
  });
};

const initNewsCache = (server) => {
  const {
    fetchNewsArticle,
    fetchNewsArticles,
    fetchNewsCategories,
  } = newsService;

  const generateNewsKey = (currentPage = 0) =>
    `${currentPage}`;

  server.method('fetchNewsArticle', fetchNewsArticle, {
    cache,
    callback: false,
  });

  server.method('fetchNewsArticles', fetchNewsArticles, {
    cache,
    callback: false,
    generateKey: generateNewsKey,
  });

  server.method('fetchNewsCategories', fetchNewsCategories, {
    cache,
    callback: false,
  });
};

const initGuildCache = (server) => {
  const {
    fetchGuildBoards,
    fetchGuildBoardByYear,
    fetchGuildInfo,
  } = guildService;

  server.method('fetchGuildInfo', fetchGuildInfo, {
    cache,
    callback: false,
  });

  server.method('fetchGuildBoards', fetchGuildBoards, {
    cache,
    callback: false,
  });

  server.method('fetchGuildBoardByYear', fetchGuildBoardByYear, {
    cache,
    callback: false,
  });
};

const initCaches = (server, next) => {
  initEventCache(server);
  initCommonCache(server);
  initNewsCache(server);
  initGuildCache(server);

  next();
};

module.exports = {
  initCaches,
};
