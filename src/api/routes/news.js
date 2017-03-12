const Joi = require('joi');
const Boom = require('boom');

const cms = require('../../directus/cms');

module.exports.getNewsArticles = {
  description: 'Get list of news',
  validate: {
    query: {
      page: Joi.number().integer().min(0),
    },
  },
  handler(request, reply) {
    return cms.fetchNewsArticles(request.query.page)
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
    return cms.fetchNewsArticle(request.params.id)
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Fetching news failed', err)));
  },
};
