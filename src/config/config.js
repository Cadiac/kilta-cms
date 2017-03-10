// Set NODE_ENV to development if not set
process.env.NODE_ENV = process.env.NODE_ENV || 'development';

const config = {
  directusApiKey: process.env.DIRECTUS_API_KEY,
  directusApiUrl: process.env.DIRECTUS_API_URL,
  directusFilesUrl: process.env.DIRECTUS_FILES_URL,
  port: Number(process.env.PORT || 8080),
};

module.exports = config;
