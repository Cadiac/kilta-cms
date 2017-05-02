const Joi = require('joi');
const Boom = require('boom');

const authService = require('../../services/auth');

module.exports.login = {
  description: 'Login with member credentials',
  validate: {
    payload: {
      username: Joi.string().required().min(2, 'utf8'),
      password: Joi.string().required().min(8, 'utf8'),
    },
  },
  handler(request, reply) {
    return authService.validatePassword(request.payload.username, request.payload.password)
      .then((member) => {
        if (!member) {
          return reply('Unauthorized').code(403);
        }
        return reply({ token: authService.getToken(member) });
      })
      .catch(err => reply(Boom.badImplementation('Login failed', err)));
  },
};
