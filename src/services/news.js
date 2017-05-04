const R = require('ramda');
const { utils, dataTypes, cms, constants } = require('../directus');

const { perPage } = constants;

const fetchNewsArticles = (currentPage = 0) => {
  const options = {
    sort: 'created_on',
    sort_order: 'DESC',
    currentPage,
    perPage,
  };

  return cms.getActiveItems(dataTypes.news.table, options)
    .then(utils.mapNewsResults);
};

const fetchNewsArticle = id => cms.getActiveItem(dataTypes.news.table, id)
  .then((news) => {
    if (R.isEmpty(news.data)) {
      return news.data;
    }
    return utils.mapNewsResult(news);
  });

const fetchNewsCategories = () => {
  const options = {
    columns: 'title,slug,id',
  };

  return cms.getActiveItems(dataTypes.newsCategories.table, options)
    .then(categories => categories.data);
};

module.exports = {
  fetchNewsArticles,
  fetchNewsArticle,
  fetchNewsCategories,
};
