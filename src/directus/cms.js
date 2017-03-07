// const config = require('../config/config');
const dataTypes = require('./data-types');
const directus = require('./client');
const R = require('ramda');
const utils = require('./utils');
const BPromise = require('bluebird');

const client = directus.getDirectusClient();

const ACTIVE = 1;
const perPage = 25;

function getActiveItems(dataType, options) {
  const defaultParams = {
    status: ACTIVE,
  };
  const params = R.merge(defaultParams, options);

  return client.getItems(dataType, params);
}

function getActiveItem(dataType, id, options) {
  const defaultParams = {
    status: ACTIVE,
  };
  const params = R.merge(defaultParams, options);

  return client.getItem(dataType, id, params);
}

function getActiveFile(id, options) {
  const defaultParams = {
    status: ACTIVE,
  };
  const params = R.merge(defaultParams, options);

  return client.getFile(id, params);
}

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
    .then(board => BPromise.props({
      meta: board,
      // TODO: assign or some shit here, also fetch images for ALL board members.
      chairman: fetchBoardMember(board.chairman).then(chairman => getActiveFile(chairman.image)),
    }))
    .then(utils.mapGuildBoard);
};

module.exports = {
  fetchNews,
  fetchUpcomingEvents,
  fetchPastEvents,
  fetchGuildBoards,
  fetchGuildBoardByYear,
};
