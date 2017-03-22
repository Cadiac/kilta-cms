const Boom = require('boom');

const commonService = require('../../services/common');

module.exports.getFooter = {
  description: 'Get footer data',
  handler(request, reply) {
    return commonService.fetchFooter()
      .then(reply)
      .catch(err => reply(Boom.badImplementation('Fetching events failed', err)));
  },
};
