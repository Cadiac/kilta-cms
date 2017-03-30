const config = require('../config/config');
const directus = require('./client');
const R = require('ramda');

const { ACTIVE } = require('./constants');

const client = directus.getDirectusClient();

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

const createActiveItem = (dataType, data) => client.createItem(dataType, data);

const getActiveFile = (id, options) => {
  const defaultParams = {
    status: ACTIVE,
  };
  const params = R.merge(defaultParams, options);

  return client.getFile(id, params);
};

const createImageUrl = (image) => {
  const thumbnail = R.path(['data', 'thumbnail_url'], image);

  // Use thumbnail if available - svgs or other vector formats don't have one
  return config.directusFilesUrl + (thumbnail || R.path(['data', 'url'], image));
};

const updateItem = (dataType, id, data) => client.updateItem(dataType, id, data);

const deleteItem = (dataType, id) => client.deleteItem(dataType, id);

module.exports = {
  getActiveItem,
  getActiveItems,
  getActiveFile,
  createActiveItem,
  createImageUrl,
  updateItem,
  deleteItem,
};
