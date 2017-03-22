const BPromise = require('bluebird');
const { utils, dataTypes, cms } = require('../directus');
const R = require('ramda');

const config = require('../config/config');

const fetchBoardMember = memberId => cms.getActiveItem(dataTypes.boardMembers.table, memberId);

const fetchBoardMemberImage = member => BPromise.props(
  R.merge(member, {
    image: cms.getActiveFile(R.prop(['image'], member))
      .then(cms.createImageUrl),
  }));

const fetchGuildBoards = () => {
  const options = {
    sort: 'year',
    sort_order: 'DESC',
  };

  return cms.getActiveItems(dataTypes.guildBoard.table, options)
    .then(utils.mapGuildBoardsResult);
};

const fetchGuildBoardByYear = (year) => {
  const options = {
    sort: 'year',
    sort_order: 'ASC',
    filters: {
      year: {
        '=': year,
      },
    },
  };

  return cms.getActiveItems(dataTypes.guildBoard.table, options)
    .then(utils.pickFirstResultData)
    .then(data => BPromise.props({
      meta: R.pick(['text', 'title', 'year', 'slug', 'board_members_title', 'board_officials_title'], data),
      chairman: fetchBoardMember(data.chairman)
        .then(R.prop('data'))
        .then(fetchBoardMemberImage),
      board_members: BPromise.map(R.path(['board_members', 'data'], data), fetchBoardMemberImage),
      board_officials: BPromise.map(R.path(['board_officials', 'data'], data), fetchBoardMemberImage),
    }));
};

const fetchGuildInfo = () => cms.getActiveItems(dataTypes.landingPage.table)
  .then(utils.pickFirstResultData)
  .then(info => BPromise.props({
    main_title: info.main_title,
    introduction_text: info.introduction_text,
    guild_name: info.guild_name,
    guild_logo: cms.getActiveFile(R.prop(['guild_logo'], info)).then(cms.createImageUrl),
    jumbotron_images: info.jumbotron_images.data.map(image => ({
      title: image.title,
      url: config.directusFilesUrl + image.url,
    })),
  }));


module.exports = {
  fetchGuildBoards,
  fetchGuildBoardByYear,
  fetchGuildInfo,
};
