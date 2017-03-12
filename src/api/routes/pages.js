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
      .then(reply)
      .catch(err => reply(Boom.badImplementation(err)));
  },
};

module.exports.getGuildBoards = {
  description: 'Get available guild board pages',
  handler(request, reply) {
    return cms.fetchGuildBoards()
      .then(reply)
      .catch(err => reply(Boom.badImplementation(err)));
  },
};

module.exports.getSubPages = {
  description: 'Get list of subpages',
  handler(request, reply) {
    return cms.fetchSubPages()
      .then(reply)
      .catch(err => reply(Boom.badImplementation(err)));
  },
};

module.exports.getSubPageBySlug = {
  description: 'Get sub page by slug',
  validate: {
    params: {
      slug: Joi.string().regex(/^[a-z0-9-]+$/),
    },
  },
  handler(request, reply) {
    return cms.fetchSubPageBySlug(request.params.slug)
      .then(reply)
      .catch(err => reply(Boom.badImplementation(err)));
  },
};
