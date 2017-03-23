const R = require('ramda');

// TODO: This is a mess, get rid of this file

const getData = R.prop('data');
const getAuthors = R.path(['authors', 'data']);
const getParticipants = R.path(['participants', 'data']);
const getUsername = R.prop('username');
const pickAuthors = result => ({
  authors: R.map(getUsername, getAuthors(result)),
});

const pickParticipants = result => ({
  participants: R.map(getUsername, getParticipants(result)),
});

const mapNewsResults = (results) => {
  const pickProps = R.pick(['id', 'title', 'text', 'slug', 'created_on', 'tags', 'news_category']);
  const mapResults = result => R.merge(pickProps(result), pickAuthors(result));

  return R.map(mapResults, getData(results));
};

const mapNewsResult = (results) => {
  const pickProps = R.pick(['id', 'title', 'text', 'slug', 'created_on', 'tags', 'news_category']);
  const mapResults = result => R.merge(pickProps(result), pickAuthors(result));

  return mapResults(getData(results));
};

const mapEventsResults = (results) => {
  const eventProps = [
    'id',
    'title',
    'text',
    'slug',
    'created_on',
    'location',
    'event_start_time',
    'event_end_time',
    'registration_start_time',
    'registration_end_date',
    'max_participants',
  ];

  const pickProps = R.pick(eventProps);
  const mapResults = result => R.mergeAll([
    pickProps(result),
    pickAuthors(result),
    pickParticipants(result)]);

  return R.map(mapResults, getData(results));
};

const mapEventsResult = (results) => {
  const data = getData(results);
  if (R.isEmpty(data)) {
    return {};
  }
  const eventProps = [
    'id',
    'title',
    'text',
    'slug',
    'created_on',
    'location',
    'event_start_time',
    'event_end_time',
    'registration_start_time',
    'registration_end_date',
    'max_participants',
  ];

  const pickProps = R.pick(eventProps);
  const mapResults = result => R.mergeAll([
    pickProps(result),
    pickAuthors(result),
    pickParticipants(result)]);

  return mapResults(getData(results));
};

const pickEventParticipants = results => R.path(['data', 'participants', 'data'], results);

const mapGuildBoardsResult = results => R.map(R.pick(['id', 'title', 'year', 'slug']), getData(results));

const mapSubPagesResult = results => R.map(R.pick(['id', 'title', 'category', 'slug']), getData(results));

const pickFirstResultData = R.compose(R.defaultTo({}), R.head, R.prop('data'));

module.exports = {
  mapNewsResult,
  mapNewsResults,
  mapEventsResult,
  mapEventsResults,
  mapGuildBoardsResult,
  mapSubPagesResult,
  pickFirstResultData,
  pickEventParticipants,
};
