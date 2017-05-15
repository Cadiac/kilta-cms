const Joi = require('joi');
const Boom = require('boom');
const R = require('ramda');

const eventService = require('../../services/events');

module.exports.getEvent = {
  description: 'Get data for single event',
  validate: {
    params: {
      id: Joi.number().integer().min(0).required(),
    },
  },
  handler: (request, reply) =>
    request.server.methods.fetchEvent(request.params.id, (err, event) => {
      if (err) {
        return reply(Boom.badImplementation('Fetching events failed', err));
      }
      if (R.isEmpty(event)) {
        return reply(Boom.notFound());
      }
      return reply(event);
    })
};

module.exports.getEvents = {
  description: 'Get list of all events, latest first',
  validate: {
    query: {
      page: Joi.number().integer().min(0),
      limit: Joi.number().integer().min(1).max(100),
    },
  },
  handler: (request, reply) =>
    request.server.methods.fetchEvents(request.query.page, request.query.limit,
      (err, events) => {
        if (err) {
          return reply(Boom.badImplementation('Fetching events failed', err));
        }
        return reply(events);
      })
};

module.exports.getUpcomingEvents = {
  description: 'Get list of upcoming events',
  validate: {
    query: {
      page: Joi.number().integer().min(0),
      limit: Joi.number().integer().min(1).max(100),
    },
  },
  handler: (request, reply) =>
    request.server.methods.fetchUpcomingEvents(request.query.page, request.query.limit,
      (err, events) => {
        if (err) {
          return reply(Boom.badImplementation('Fetching events failed', err));
        }
        return reply(events);
      })
};

module.exports.getPastEvents = {
  description: 'Get list of past events',
  validate: {
    query: {
      page: Joi.number().integer().min(0),
      limit: Joi.number().integer().min(1).max(100),
    },
  },
  handler: (request, reply) =>
    request.server.methods.fetchPastEvents(request.query.page, request.query.limit,
      (err, events) => {
        if (err) {
          return reply(Boom.badImplementation('Fetching events failed', err));
        }
        return reply(events);
      })
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
    return eventService.fetchEvent(request.params.id)
      .then((event) => {
        if (R.isEmpty(event)) {
          return reply(Boom.notFound(`Event ${request.params.id} was not found`));
        }
        return event;
      })
      .then(() => eventService.fetchEventParticipants(request.params.id))
      .then((participants) => {
        if (R.contains(request.auth.credentials.id, participants)) {
          return reply(Boom.badRequest('You have already registered for this event!'));
        }
        return eventService.participateEvent(request.params.id, request.auth.credentials.id);
      })
      .then(() => reply('Registration successful').code(201))
      .catch(err => reply(Boom.badImplementation('Event participation failed', err)));
  },
};
