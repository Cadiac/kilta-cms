const Boom = require('boom');

module.exports.getSponsors = {
  description: 'Get list of sponsors',
  handler: (request, reply) =>
    request.server.methods.fetchSponsors((err, sponsors, cached) => {
      if (err) {
        return reply(Boom.badImplementation('Fetching sponsors failed', err));
      }
      const lastModified = cached ? new Date(cached.stored) : new Date();
      return reply(sponsors).header('Last-Modified', lastModified.toUTCString());
    })
};
