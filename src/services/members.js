const R = require('ramda');
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

const fetchMemberWithoutSensitiveData = id => fetchMember(id)
  .then(utils.mapMemberResult);

module.exports = {
  fetchMember,
  fetchMemberByUsername,
  fetchMemberWithoutSensitiveData,
};
