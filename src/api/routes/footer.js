const Boom = require('boom');
const R = require('ramda');

const { cachedReply } = require('../utils');

module.exports.getFooter = {
  description: 'Get footer data',
  handler: (request, reply) =>
    request.server.methods.fetchFooter((err, footer, cached) => {
      if (err) {
        return reply(Boom.badImplementation('Fetching footer failed', err));
      }
      if (R.isEmpty(footer)) {
        return reply(Boom.notFound('Footer is missing!'));
      }
      return cachedReply(reply, footer, cached);
    })
};
