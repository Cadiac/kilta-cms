const Boom = require('boom');
const R = require('ramda');

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
      const lastModified = cached ? new Date(cached.stored) : new Date();
      return reply(footer).header('Last-Modified', lastModified.toUTCString());
    })
};
