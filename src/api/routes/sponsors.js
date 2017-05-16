const Boom = require('boom');

const { cachedReply } = require('../utils');

module.exports.getSponsors = {
  description: 'Get list of sponsors',
  handler: (request, reply) =>
    request.server.methods.fetchSponsors((err, sponsors, cached) => {
      if (err) {
        return reply(Boom.badImplementation('Fetching sponsors failed', err));
      }
      return cachedReply(reply, sponsors, cached);
    })
};
