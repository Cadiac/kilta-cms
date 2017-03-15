const Joi = require('joi');
const Boom = require('boom');
const R = require('ramda');

const cms = require('../../directus/cms');

module.exports.getEvents = {
  description: 'Get list of all events, latest first',
  validate: {
    query: {
      page: Joi.number().integer().min(0),
    },
  },
  handler(request, reply) {
    return cms.fetchEvents(request.query.page)
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Fetching events failed', err)));
  },
};

module.exports.getEvent = {
  description: 'Get data for single event',
  validate: {
    params: {
      id: Joi.number().integer().min(0).required(),
    },
  },
  handler(request, reply) {
    return cms.fetchEvent(request.params.id)
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Fetching events failed', err)));
  },
};

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

module.exports.participateEvent = {
  auth: 'jwt',
  description: 'Participate event as current user',
  validate: {
    params: {
      id: Joi.number().integer().min(0).required(),
    },
  },
  handler(request, reply) {
    return cms.fetchEventParticipants(request.params.id)
      .then((participants) => {
        // TODO: Fetch current member
        const memberId = 4;
        if (R.contains(memberId, participants)) {
          return reply('You have already registered for this event!').code(400);
        }
        return cms.participateEvent(request.params.id, 4);
      })
      .then(() => reply('Registration successful').code(201))
      .catch(err => reply(Boom.badImplementation('Fetching events failed', err)));
  },
};
