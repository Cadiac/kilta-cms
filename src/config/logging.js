// Options for good logging
module.exports = {
  ops: {
    interval: 1000,
  },
  reporters: {
    console: [{
      module: 'good-squeeze',
      name: 'Squeeze',
      args: [{ log: '*', response: '*' }],
    }, {
      module: 'good-console',
    }, 'stdout'],
  },
};
