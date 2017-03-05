const R = require('ramda');

function mapNewsResults(results) {
  const getData = R.prop('data');
  const getAuthors = R.path(['authors', 'data']);
  const getUsername = R.prop('username');

  const pickProps = R.pick(['id', 'title', 'text', 'slug', 'created_on', 'tags', 'news_category']);

  const pickAuthors = result => ({
    authors: R.map(getUsername, getAuthors(result)),
  });

  const mapResults = result => R.merge(pickProps(result), pickAuthors(result));

  return R.map(mapResults, getData(results));
}

module.exports = {
  mapNewsResults,
};
