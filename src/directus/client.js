const SDK = require('directus-sdk-javascript');
const config = require('../config/config');

function getDirectusClient() {
  const directusClient = new SDK(
    config.directusApiKey,
    config.directusApiUrl,
    1.1,
  );
  return directusClient;
}

module.exports = {
  getDirectusClient,
};
