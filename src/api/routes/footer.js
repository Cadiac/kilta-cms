const Boom = require('boom');

const cms = require('../../directus/cms');

module.exports.getFooter = {
  description: 'Get footer data',
  handler(request, reply) {
    return cms.fetchFooter()
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Fetching events failed', err)));
  },
};
