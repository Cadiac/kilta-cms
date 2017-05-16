const Joi = require('joi');
const Boom = require('boom');
const R = require('ramda');

const { cachedReply } = require('../utils');

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
      return cachedReply(reply, news, cached);
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
      return cachedReply(reply, newsArticle, cached);
    })
};

module.exports.getNewsCategories = {
  description: 'Get list of news categories',
  handler: (request, reply) =>
    request.server.methods.fetchNewsCategories((err, news, cached) => {
      if (err) {
        return reply(Boom.badImplementation('Fetching news failed', err));
      }
      return cachedReply(reply, news, cached);
    })
};
