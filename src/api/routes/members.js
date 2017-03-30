const Joi = require('joi');
const Boom = require('boom');

const membersService = require('../../services/members');

module.exports.getCurrentUser = {
  auth: 'jwt',
  description: 'Get data about authenticated user',
  handler(request, reply) {
    return membersService.fetchMemberWithoutSensitiveData(request.auth.credentials.id)
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Fetching member failed', err)));
  },
};

module.exports.updateCurrentUser = {
  auth: 'jwt',
  description: 'Update authenticated user',
  validate: {
    payload: {
      first_name: Joi.string().required().min(2, 'utf8'),
      last_name: Joi.string().required().min(2, 'utf8'),
      email: Joi.string().email().required(),
      phone: Joi.string().allow(''),
    },
  },
  handler(request, reply) {
    return membersService.updateMember(request.auth.credentials.id, request.payload)
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Updating member failed', err)));
  },
};

// @TODO: Remove this, this should not exist :D
module.exports.deleteCurrentUser = {
  auth: 'jwt',
  description: 'Delete authenticated user',
  handler(request, reply) {
    return membersService.deleteMember(request.auth.credentials.id)
      .then(() => reply().code(204))
      .catch(err => reply(Boom.badImplementation('Deleting member failed', err)));
  },
};
