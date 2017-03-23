const Joi = require('joi');
const Boom = require('boom');
const R = require('ramda');

const commonService = require('../../services/common');
const guildService = require('../../services/guild');

module.exports.getGuildInformation = {
  description: 'Get general guild information, such as logo and guild name',
  handler(request, reply) {
    return guildService.fetchGuildInfo(request.params.slug)
      .then((guild) => {
        if (R.isEmpty(guild)) {
          return reply(Boom.notFound('Guild info ("Landing Page") is missing!'));
        }
        return reply(guild);
      })
      .catch(err => reply(Boom.badImplementation(err)));
  },
};

module.exports.getGuildBoardByYear = {
  description: 'Get guild board page by year',
  validate: {
    params: {
      year: Joi.number().integer().min(0).required(),
    },
  },
  handler(request, reply) {
    return guildService.fetchGuildBoardByYear(request.params.year)
      .then((board) => {
        if (R.isEmpty(board)) {
          return reply(Boom.notFound());
        }
        return reply(board);
      })
      .catch(err => reply(Boom.badImplementation(err)));
  },
};

module.exports.getGuildBoards = {
  description: 'Get available guild board pages',
  handler(request, reply) {
    return guildService.fetchGuildBoards()
      .then(reply)
      .catch(err => reply(Boom.badImplementation(err)));
  },
};

module.exports.getSubPages = {
  description: 'Get list of subpages',
  handler(request, reply) {
    return commonService.fetchSubPages()
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
    return commonService.fetchSubPageBySlug(request.params.slug)
      .then((page) => {
        if (R.isEmpty(page)) {
          return reply(Boom.notFound());
        }

        return reply(page);
      })
      .then(reply)
      .catch(err => reply(Boom.badImplementation(err)));
  },
};
