// const Joi = require('joi');
// const Boom = require('boom');

module.exports.hello = {
  description: 'Hello world',
  handler: (request, reply) => {
    reply('Hello world');
  },
};
