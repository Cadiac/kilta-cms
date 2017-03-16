const jsonwebtoken = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const R = require('ramda');

const cms = require('../directus/cms');
const { apiSecretKey } = require('../config/config');

const validateToken = (decoded, request, callback) =>
  cms.fetchMember(decoded.id)
    .then((member) => {
      if (!member) {
        return callback(null, false);
      }
      return callback(null, true);
    })
    .catch(() => callback(null, false));

// Bcrypt on PHP (Directus) has different name for hash algorithm type
// http://stackoverflow.com/questions/23015043/verify-password-hash-in-nodejs-which-was-generated-in-php
const renameHashAlgorithm = (hash) => {
  if (hash && hash.startsWith('$2y$')) {
    // eslint-disable-next-line prefer-template
    return '$2a$' + hash.substring(4);
  }
  return hash;
};

const validatePassword = (username, password) =>
  cms.fetchMemberByUsername(username)
    .then((member) => {
      if (!member || !member.password) {
        return false;
      }

      const hash = renameHashAlgorithm(member.password);
      return bcrypt.compare(password, hash)
        .then((res) => {
          if (!res) {
            return false;
          }
          return member;
        });
    });

const getToken = member => jsonwebtoken.sign(
  R.pick(['id', 'role'], member),
  apiSecretKey,
  { expiresIn: '24h' });

module.exports = {
  validateToken,
  validatePassword,
  getToken,
};
