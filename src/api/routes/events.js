const Joi = require('joi');
const Boom = require('boom');

const cms = require('../../directus/cms');

module.exports.getUpcomingEvents = {
  description: 'Get list of upcoming events',
  validate: {
    query: {
      page: Joi.number().integer().min(0).required(),
    },
  },
  handler(request, reply) {
    return cms.fetchUpcomingEvents(request.query.page)
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Fetching events failed', err)));
  },
};

module.exports.getPastEvents = {
  description: 'Get list of past events',
  validate: {
    query: {
      page: Joi.number().integer().min(0).required(),
    },
  },
  handler(request, reply) {
    return cms.fetchPastEvents(request.query.page)
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Fetching events failed', err)));
  },
};
