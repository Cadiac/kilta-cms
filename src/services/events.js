const { utils, dataTypes, cms, constants } = require('../directus');
const R = require('ramda');

const { perPage } = constants;

const fetchEvents = (currentPage = 0) => {
  const options = {
    sort: 'event_start_time',
    sort_order: 'ASC',
    currentPage,
    perPage,
  };

  return cms.getActiveItems(dataTypes.events.table, options)
    .then(utils.mapEventsResults);
};

const fetchEvent = id => cms.getActiveItem(dataTypes.events.table, id)
  .then(utils.mapEventsResult);

const fetchUpcomingEvents = (currentPage = 0) => {
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

  return cms.getActiveItems(dataTypes.events.table, options)
    .then(utils.mapEventsResults);
};

const fetchPastEvents = (currentPage = 0) => {
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

  return cms.getActiveItems(dataTypes.events.table, options)
    .then(utils.mapEventsResults);
};

const fetchEventParticipants = eventId => cms.getActiveItem(dataTypes.events.table, eventId)
  .then(utils.pickEventParticipants)
  .then(R.map(R.prop('id')));

const participateEvent = (eventId, memberId) => {
  const data = {
    active: 1,
    member_id: memberId,
    event_id: eventId,
  };

  return cms.createActiveItem(dataTypes.eventParticipants.table, data);
};

module.exports = {
  fetchEvent,
  fetchEvents,
  fetchUpcomingEvents,
  fetchPastEvents,
  fetchEventParticipants,
  participateEvent,
};
