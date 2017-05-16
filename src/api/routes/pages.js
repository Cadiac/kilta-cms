const Joi = require('joi');
const Boom = require('boom');
const R = require('ramda');

const { cachedReply } = require('../utils');

module.exports.getGuildInformation = {
  description: 'Get general guild information, such as logo and guild name',
  handler: (request, reply) =>
    request.server.methods.fetchGuildInfo((err, info, cached) => {
      if (err) {
        return reply(Boom.badImplementation('Fetching guild info failed', err));
      }
      if (R.isEmpty(info)) {
        return reply(Boom.notFound('Guild info ("Landing Page") is missing!'));
      }
      return cachedReply(reply, info, cached);
    })
};

module.exports.getGuildBoardByYear = {
  description: 'Get guild board page by year',
  validate: {
    params: {
      year: Joi.number().integer().min(0).required(),
    },
  },
  handler: (request, reply) =>
    request.server.methods.fetchGuildBoardByYear(request.params.year,
      (err, board, cached) => {
        if (err) {
          return reply(Boom.badImplementation('Fetching board failed', err));
        }
        if (R.isEmpty(board)) {
          return reply(Boom.notFound('Board not found!'));
        }
        return cachedReply(reply, board, cached);
      })
};

module.exports.getGuildBoards = {
  description: 'Get available guild board pages',
  handler: (request, reply) =>
    request.server.methods.fetchGuildBoards((err, boards, cached) => {
      if (err) {
        return reply(Boom.badImplementation('Fetching guild boards failed', err));
      }
      return cachedReply(reply, boards, cached);
    })
};

module.exports.getSubPages = {
  description: 'Get list of subpages',
  handler: (request, reply) =>
    request.server.methods.fetchSubPages((err, subpages, cached) => {
      if (err) {
        return reply(Boom.badImplementation('Fetching subpages failed', err));
      }
      return cachedReply(reply, subpages, cached);
    })
};

module.exports.getSubPageBySlug = {
  description: 'Get sub page by slug',
  validate: {
    params: {
      slug: Joi.string().regex(/^[a-z0-9-]+$/),
    },
  },
  handler: (request, reply) =>
    request.server.methods.fetchSubPageBySlug(request.params.slug,
      (err, subpage, cached) => {
        if (err) {
          return reply(Boom.badImplementation('Fetching subpage failed', err));
        }
        if (R.isEmpty(subpage)) {
          return reply(Boom.notFound(`Subpage ${request.params.slug} was not found!`));
        }
        return cachedReply(reply, subpage, cached);
      }
    )
};
