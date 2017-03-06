const R = require('ramda');

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

function mapNewsResults(results) {
  const pickProps = R.pick(['id', 'title', 'text', 'slug', 'created_on', 'tags', 'news_category']);
  const mapResults = result => R.merge(pickProps(result), pickAuthors(result));

  return R.map(mapResults, getData(results));
}

function mapEventsResults(results) {
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
}

module.exports = {
  mapNewsResults,
  mapEventsResults,
};
