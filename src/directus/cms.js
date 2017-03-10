const config = require('../config/config');
const dataTypes = require('./data-types');
const directus = require('./client');
const R = require('ramda');
const utils = require('./utils');
const BPromise = require('bluebird');

const client = directus.getDirectusClient();

const ACTIVE = 1;
const perPage = 25;

const getActiveItems = (dataType, options) => {
  const defaultParams = {
    status: ACTIVE,
  };
  const params = R.merge(defaultParams, options);

  return client.getItems(dataType, params);
};

const getActiveItem = (dataType, id, options) => {
  const defaultParams = {
    status: ACTIVE,
  };
  const params = R.merge(defaultParams, options);

  return client.getItem(dataType, id, params);
};

const getActiveFile = (id, options) => {
  const defaultParams = {
    status: ACTIVE,
  };
  const params = R.merge(defaultParams, options);

  return client.getFile(id, params);
};

const fetchNews = (currentPage) => {
  const options = {
    sort: 'created_on',
    sort_order: 'DESC',
    currentPage,
    perPage,
  };

  return getActiveItems(dataTypes.news.table, options)
    .then(utils.mapNewsResults);
};

const fetchUpcomingEvents = (currentPage) => {
  const options = {
    sort: 'event_start_time',
    sort_order: 'ASC',
    currentPage,
    perPage,
    filters: {
      event_end_time: {
        '>=': new Date().toISOString(),
      },
    },
  };

  return getActiveItems(dataTypes.events.table, options)
    .then(utils.mapEventsResults);
};

const fetchPastEvents = (currentPage) => {
  const options = {
    sort: 'event_start_time',
    sort_order: 'ASC',
    currentPage,
    perPage,
    filters: {
      event_end_time: {
        '<': new Date().toISOString(),
      },
    },
  };

  return getActiveItems(dataTypes.events.table, options)
    .then(utils.mapEventsResults);
};

const fetchBoardMember = memberId => getActiveItem(dataTypes.boardMembers.table, memberId);

const fetchBoardMemberImage = member => BPromise.props(
  R.merge(member, {
    image: getActiveFile(R.prop(['image'], member))
      .then(image => config.directusFilesUrl + R.path(['data', 'thumbnail_url'], image)),
  }));

const fetchGuildBoards = () => {
  const options = {
    sort: 'year',
    sort_order: 'DESC',
  };

  return getActiveItems(dataTypes.guildBoard.table, options)
    .then(utils.mapGuildBoardsResult);
};

const fetchGuildBoardByYear = (year) => {
  const options = {
    sort: 'year',
    sort_order: 'ASC',
    filters: {
      year: {
        '=': year,
      },
    },
  };

  return getActiveItems(dataTypes.guildBoard.table, options)
    .then(R.compose(R.head, R.prop('data')))
    .then(data => BPromise.props({
      meta: R.pick(['text', 'title', 'year', 'slug', 'board_members_title', 'board_officials_title'], data),
      chairman: fetchBoardMember(data.chairman)
        .then(R.prop('data'))
        .then(fetchBoardMemberImage),
      board_members: BPromise.map(R.path(['board_members', 'data'], data), fetchBoardMemberImage),
      board_officials: BPromise.map(R.path(['board_officials', 'data'], data), fetchBoardMemberImage),
    }));
};

module.exports = {
  fetchNews,
  fetchUpcomingEvents,
  fetchPastEvents,
  fetchGuildBoards,
  fetchGuildBoardByYear,
};
