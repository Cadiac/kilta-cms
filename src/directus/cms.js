// const config = require('../config/config');
const dataTypes = require('./data-types');
const directus = require('./client');
const R = require('ramda');
const utils = require('./utils');

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

const fetchNews = currentPage => getActiveItems(dataTypes.news.table, {
  sort: 'created_on',
  sort_order: 'DESC',
  currentPage,
  perPage,
}).then(utils.mapNewsResults);

module.exports = {
  fetchNews,
};
