const SDK = require('directus-sdk-javascript');
const config = require('../config/config');

function getDirectusClient() {
  return new SDK(
    config.directusApiKey,
    config.directusApiUrl,
    1.1);
}

module.exports = {
  getDirectusClient,
};
