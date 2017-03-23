const BPromise = require('bluebird');
const { utils, dataTypes, cms } = require('../directus');
const R = require('ramda');

const fetchLinkLogo = link => BPromise.props({
  link: R.prop('link', link),
  name: R.prop('name', link),
  logo: cms.getActiveFile(R.prop('logo', link))
    .then(cms.createImageUrl),
});

const fetchSponsorsLogo = sponsor => BPromise.props({
  name: R.prop('name', sponsor),
  website: R.prop('website', sponsor),
  logo: cms.getActiveFile(R.prop('logo', sponsor))
    .then(cms.createImageUrl),
});

const fetchSubPages = () => cms.getActiveItems(dataTypes.categories.table)
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

  return cms.getActiveItems(dataTypes.subpages.table, options)
    .then(utils.pickFirstResultData)
    .then(R.pick(['title', 'slug', 'text', 'category_id']));
};

const fetchFooter = () => cms.getActiveItems(dataTypes.footer.table)
  .then(utils.pickFirstResultData)
  .then(R.pick(['contact_info', 'other_links', 'social_media_buttons']))
  .then((footer) => {
    if (R.isEmpty(footer)) {
      return footer;
    }
    return BPromise.props({
      contact_info: footer.contact_info,
      other_links: R.map(R.pick(['title', 'link']), footer.other_links.data),
      social_media_buttons: BPromise.map(
        footer.social_media_buttons.data,
        fetchLinkLogo),
    });
  });

const fetchSponsors = () => cms.getActiveItems(dataTypes.sponsors.table)
  .then(R.prop('data'))
  .then(sponsors => BPromise.map(sponsors, fetchSponsorsLogo));

module.exports = {
  fetchSubPages,
  fetchSubPageBySlug,
  fetchFooter,
  fetchSponsors,
};
