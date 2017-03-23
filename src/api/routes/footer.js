const Boom = require('boom');
const R = require('ramda');

const commonService = require('../../services/common');

module.exports.getFooter = {
  description: 'Get footer data',
  handler(request, reply) {
    return commonService.fetchFooter()
      .then((footer) => {
        if (R.isEmpty(footer)) {
          return reply(Boom.notFound('Footer is missing!'));
        }
        return reply(footer);
      })
      .catch(err => reply(Boom.badImplementation('Fetching events failed', err)));
  },
};
