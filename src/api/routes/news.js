const Joi = require('joi');
const Boom = require('boom');

const cms = require('../../directus/cms');

module.exports.getNews = {
  description: 'Get list of news',
  validate: {
    query: {
      page: Joi.number().integer().min(0).required(),
    },
  },
  handler(request, reply) {
    return cms.fetchNews(request.query.page)
      .then(news => reply(news))
      .catch(err => reply(Boom.badImplementation('Fetching news failed', err)));
  },
};
