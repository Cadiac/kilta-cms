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

const opts = {
  cache,
  callback: false,
};

const initCaches = (server, next) => {
  const generatePagedKey = (currentPage = 0, limit = perPage) =>
    `${currentPage},${limit}`;

  const pagedOpts = Object.assign({}, opts, { generateKey: generatePagedKey });

  const cachedMethods = [
    // Events
    ['fetchEvent', eventService.fetchEvent, opts],
    ['fetchEvents', eventService.fetchEvents, pagedOpts],
    ['fetchUpcomingEvents', eventService.fetchUpcomingEvents, pagedOpts],
    ['fetchPastEvents', eventService.fetchPastEvents, pagedOpts],
    // Common
    ['fetchSubPages', commonService.fetchSubPages, opts],
    ['fetchSubPageBySlug', commonService.fetchSubPageBySlug, opts],
    ['fetchFooter', commonService.fetchFooter, opts],
    ['fetchSponsors', commonService.fetchSponsors, opts],
    // News
    ['fetchNewsArticle', newsService.fetchNewsArticle, opts],
    ['fetchNewsArticles', newsService.fetchNewsArticles, pagedOpts],
    ['fetchNewsCategories', newsService.fetchNewsCategories, opts],
    // Guild
    ['fetchGuildInfo', guildService.fetchGuildInfo, opts],
    ['fetchGuildBoards', guildService.fetchGuildBoards, opts],
    ['fetchGuildBoardByYear', guildService.fetchGuildBoardByYear, opts],
  ];

  cachedMethods.forEach(method => server.method(...method));

  next();
};

module.exports = {
  initCaches,
};
