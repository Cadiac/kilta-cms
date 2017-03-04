// const Joi = require('joi');
const Boom = require('boom');

const cms = require('../../directus/cms');

module.exports.getNews = {
  description: 'Get list of news',
  handler: (request, reply) => {
    return cms.fetchNews()
      .then(news => reply(news))
      .catch(err => reply(Boom.badImplementation('Fetching news failed', err)));
  },
};
