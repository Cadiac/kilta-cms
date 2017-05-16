const Joi = require('joi');
const Boom = require('boom');
const R = require('ramda');

module.exports.getNewsArticles = {
  description: 'Get list of news',
  validate: {
    query: {
      page: Joi.number().integer().min(0),
    },
  },
  handler: (request, reply) =>
    request.server.methods.fetchNewsArticles(request.query.page, (err, news, cached) => {
      if (err) {
        return reply(Boom.badImplementation('Fetching news failed', err));
      }
      const lastModified = cached ? new Date(cached.stored) : new Date();
      return reply(news).header('Last-Modified', lastModified.toUTCString());
    })
};

module.exports.getNewsArticle = {
  description: 'Get list of news',
  validate: {
    params: {
      id: Joi.number().integer().min(0).required(),
    },
  },
  handler: (request, reply) =>
    request.server.methods.fetchNewsArticle(request.params.id, (err, newsArticle, cached) => {
      if (err) {
        return reply(Boom.badImplementation('Fetching news failed', err));
      }
      if (R.isEmpty(newsArticle)) {
        return reply(Boom.notFound(`News article ${request.params.id} was not found!`));
      }
      const lastModified = cached ? new Date(cached.stored) : new Date();
      return reply(newsArticle).header('Last-Modified', lastModified.toUTCString());
    })
};

module.exports.getNewsCategories = {
  description: 'Get list of news categories',
  handler: (request, reply) =>
    request.server.methods.fetchNewsCategories((err, news, cached) => {
      if (err) {
        return reply(Boom.badImplementation('Fetching news failed', err));
      }
      const lastModified = cached ? new Date(cached.stored) : new Date();
      return reply(news).header('Last-Modified', lastModified.toUTCString());
    })
};
