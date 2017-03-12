const Boom = require('boom');

const cms = require('../../directus/cms');

module.exports.getSponsors = {
  description: 'Get list of sponsors',
  handler(request, reply) {
    return cms.fetchSponsors()
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Fetching events failed', err)));
  },
};
