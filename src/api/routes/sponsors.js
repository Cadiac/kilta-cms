const Boom = require('boom');

const commonService = require('../../services/common');

module.exports.getSponsors = {
  description: 'Get list of sponsors',
  handler(request, reply) {
    return commonService.fetchSponsors()
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Fetching events failed', err)));
  },
};
