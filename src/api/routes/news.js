const Joi = require('joi');
const Boom = require('boom');

const newsService = require('../../services/news');

module.exports.getNewsArticles = {
  description: 'Get list of news',
  validate: {
    query: {
      page: Joi.number().integer().min(0),
    },
  },
  handler(request, reply) {
    return newsService.fetchNewsArticles(request.query.page)
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Fetching news failed', err)));
  },
};

module.exports.getNewsArticle = {
  description: 'Get list of news',
  validate: {
    params: {
      id: Joi.number().integer().min(0).required(),
    },
  },
  handler(request, reply) {
    return newsService.fetchNewsArticle(request.params.id)
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Fetching news failed', err)));
  },
};
