const { utils, dataTypes, cms } = require('../directus');

const fetchMember = id => cms.getActiveItem(dataTypes.members.table, id);

const fetchMemberByUsername = (username) => {
  const options = {
    filters: {
      username: {
        '=': username,
      },
    },
  };

  return cms.getActiveItems(dataTypes.members.table, options)
    .then(utils.pickFirstResultData);
};

module.exports = {
  fetchMember,
  fetchMemberByUsername,
};
