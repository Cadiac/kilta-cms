const Joi = require('joi');
const Boom = require('boom');

const membersService = require('../../services/members');

module.exports.getCurrentUser = {
  auth: 'jwt',
  description: 'Get data about authenticated user',
  handler(request, reply) {
    return membersService.fetchMemberWithoutSensitiveData(request.auth.credentials.id)
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Fetching events failed', err)));
  },
};

module.exports.updateCurrentUser = {
  auth: 'jwt',
  description: 'Get data about authenticated user',
  validate: {
    payload: {
      first_name: Joi.string().required().min(2, 'utf8'),
      last_name: Joi.string().required().min(2, 'utf8'),
      email: Joi.string().email().required(),
      phone: Joi.string(),
    },
  },
  handler(request, reply) {
    return membersService.fetchMemberWithoutSensitiveData(request.auth.credentials.id)
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Fetching events failed', err)));
  },
};
