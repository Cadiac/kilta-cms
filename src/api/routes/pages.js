const Joi = require('joi');
const Boom = require('boom');

const cms = require('../../directus/cms');

module.exports.getGuildBoardByYear = {
  description: 'Get guild board page by year',
  validate: {
    params: {
      year: Joi.number().integer().min(0).required(),
    },
  },
  handler(request, reply) {
    return cms.fetchGuildBoardByYear(request.params.year)
      .then(board => reply(board))
      .catch(err => reply(Boom.badImplementation(err)));
  },
};

module.exports.getGuildBoards = {
  description: 'Get available guild board pages',
  handler(request, reply) {
    return cms.fetchGuildBoards()
      .then(board => reply(board))
      .catch(err => reply(Boom.badImplementation(err)));
  },
};
