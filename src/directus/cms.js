const config = require('../config/config');
const dataTypes = require('./data-types');
const directus = require('./client');
const R = require('ramda');
const utils = require('./utils');
const BPromise = require('bluebird');

const client = directus.getDirectusClient();

const ACTIVE = 1;
const perPage = 25;

const getActiveItems = (dataType, options) => {
  const defaultParams = {
    status: ACTIVE,
  };
  const params = R.merge(defaultParams, options);

  return client.getItems(dataType, params);
};

const getActiveItem = (dataType, id, options) => {
  const defaultParams = {
    status: ACTIVE,
  };
  const params = R.merge(defaultParams, options);

  return client.getItem(dataType, id, params);
};

const createActiveItem = (dataType, data) => client.createItem(dataType, data);

const getActiveFile = (id, options) => {
  const defaultParams = {
    status: ACTIVE,
  };
  const params = R.merge(defaultParams, options);

  return client.getFile(id, params);
};

const createImageUrl = (image) => {
  const thumbnail = R.path(['data', 'thumbnail_url'], image);

  // Use thumbnail if available - svgs or other vector formats don't have one
  return config.directusFilesUrl + (thumbnail || R.path(['data', 'url'], image));
};

const fetchNewsArticles = (currentPage = 0) => {
  const options = {
    sort: 'created_on',
    sort_order: 'DESC',
    currentPage,
    perPage,
  };

  return getActiveItems(dataTypes.news.table, options)
    .then(utils.mapNewsResults);
};

const fetchNewsArticle = id => getActiveItem(dataTypes.news.table, id)
  .then(utils.mapNewsResult);

const fetchEvents = (currentPage = 0) => {
  const options = {
    sort: 'event_start_time',
    sort_order: 'ASC',
    currentPage,
    perPage,
  };

  return getActiveItems(dataTypes.events.table, options)
    .then(utils.mapEventsResults);
};

const fetchEvent = id => getActiveItem(dataTypes.events.table, id)
  .then(utils.mapEventsResult);

const fetchUpcomingEvents = (currentPage) => {
  const options = {
    sort: 'event_start_time',
    sort_order: 'ASC',
    currentPage,
    perPage,
    filters: {
      event_end_time: {
        '>=': new Date().toISOString(),
      },
    },
  };

  return getActiveItems(dataTypes.events.table, options)
    .then(utils.mapEventsResults);
};

const fetchPastEvents = (currentPage) => {
  const options = {
    sort: 'event_start_time',
    sort_order: 'ASC',
    currentPage,
    perPage,
    filters: {
      event_end_time: {
        '<': new Date().toISOString(),
      },
    },
  };

  return getActiveItems(dataTypes.events.table, options)
    .then(utils.mapEventsResults);
};

const fetchEventParticipants = eventId => getActiveItem(dataTypes.events.table, eventId)
  .then(utils.pickEventParticipants)
  .then(R.map(R.prop('id')));

const participateEvent = (eventId, memberId) => {
  const data = {
    active: 1,
    member_id: memberId,
    event_id: eventId,
  };

  return createActiveItem(dataTypes.eventParticipants.table, data);
};

const fetchBoardMember = memberId => getActiveItem(dataTypes.boardMembers.table, memberId);

const fetchBoardMemberImage = member => BPromise.props(
  R.merge(member, {
    image: getActiveFile(R.prop(['image'], member))
      .then(createImageUrl),
  }));

const fetchGuildBoards = () => {
  const options = {
    sort: 'year',
    sort_order: 'DESC',
  };

  return getActiveItems(dataTypes.guildBoard.table, options)
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

  return getActiveItems(dataTypes.guildBoard.table, options)
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

const fetchLinkLogo = link => BPromise.props({
  link: R.prop('link', link),
  name: R.prop('name', link),
  logo: getActiveFile(R.prop('logo', link))
    .then(createImageUrl),
});

const fetchSponsorsLogo = sponsor => BPromise.props({
  name: R.prop('name', sponsor),
  website: R.prop('website', sponsor),
  logo: getActiveFile(R.prop('logo', sponsor))
    .then(createImageUrl),
});

const fetchSubPages = () => getActiveItems(dataTypes.categories.table)
  .then(R.prop('data'))
  .then(R.filter(R.compose(R.not, R.isEmpty, R.path(['subpages', 'data']))))
  .then(R.map(R.pick(['title', 'slug', 'subpages'])))
  .then(R.map(category => R.merge(category, {
    subpages: R.map(R.pick(['title', 'slug', 'priority']), category.subpages.data),
  })));

const fetchSubPageBySlug = (slug) => {
  const options = {
    filters: {
      slug: {
        '=': slug,
      },
    },
  };

  return getActiveItems(dataTypes.subpages.table, options)
    .then(utils.pickFirstResultData)
    .then(R.pick(['title', 'slug', 'text', 'category_id']));
};

const fetchFooter = () => getActiveItems(dataTypes.footer.table)
  .then(utils.pickFirstResultData)
  .then(R.pick(['contact_info', 'other_links', 'social_media_buttons']))
  .then(footer => BPromise.props({
    contact_info: footer.contact_info,
    other_links: R.map(R.pick(['title', 'link']), footer.other_links.data),
    social_media_buttons: BPromise.map(
      footer.social_media_buttons.data,
      fetchLinkLogo),
  }));

const fetchSponsors = () => getActiveItems(dataTypes.sponsors.table)
  .then(R.prop('data'))
  .then(sponsors => BPromise.map(sponsors, fetchSponsorsLogo));

const fetchGuildInfo = () => getActiveItems(dataTypes.landingPage.table)
  .then(utils.pickFirstResultData)
  .then(info => BPromise.props({
    main_title: info.main_title,
    introduction_text: info.introduction_text,
    guild_name: info.guild_name,
    guild_logo: getActiveFile(R.prop(['guild_logo'], info)).then(createImageUrl),
    jumbotron_images: info.jumbotron_images.data.map(image => ({
      title: image.title,
      url: config.directusFilesUrl + image.url,
    })),
  }));

module.exports = {
  fetchNewsArticle,
  fetchNewsArticles,
  fetchEvent,
  fetchEvents,
  fetchUpcomingEvents,
  fetchPastEvents,
  fetchEventParticipants,
  participateEvent,
  fetchSubPages,
  fetchSubPageBySlug,
  fetchGuildBoards,
  fetchGuildBoardByYear,
  fetchFooter,
  fetchSponsors,
  fetchGuildInfo,
};
