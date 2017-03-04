const R = require('ramda');

function mapNewsResults(results) {
  return R.map(R.pick([
    'id', 'title', 'text', 'slug', 'created_on', 'tags', 'news_category', 'authors',
  ]))(results.data);
}

module.exports = {
  mapNewsResults,
};
