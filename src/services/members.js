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

const updateMember = (id, data) => cms.updateItem(dataTypes.members.table, id, data)
  .then(utils.mapMemberResult);

const deleteMember = id => cms.deleteItem(dataTypes.members.table, id);

module.exports = {
  fetchMember,
  fetchMemberByUsername,
  fetchMemberWithoutSensitiveData,
  updateMember,
  deleteMember,
};
