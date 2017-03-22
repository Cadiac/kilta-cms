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
  .then(utils.mapNewsResult);

module.exports = {
  fetchNewsArticles,
  fetchNewsArticle,
};
