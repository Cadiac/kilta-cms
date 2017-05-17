// Set NODE_ENV to development if not set
process.env.NODE_ENV = process.env.NODE_ENV || 'development';

const config = {
  directusApiKey: process.env.DIRECTUS_API_KEY,
  directusApiUrl: process.env.DIRECTUS_API_URL,
  directusFilesUrl: process.env.DIRECTUS_FILES_URL,

  port: Number(process.env.PORT || 8080),
  host: process.env.HOST || 'localhost',

  apiSecretKey: process.env.API_SECRET_KEY,

  redisUrl: process.env.REDIS_URL,

  cacheDuration: Number(process.env.CACHE_DURATION) || 600000,
  cacheGenerateTimeout: Number(process.env.CACHE_GENERATE_TIMEOUT) || 1000,
};

module.exports = config;
