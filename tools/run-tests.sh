#!/bin/bash

echo "Running eslint";

# Run linter, only as warnings
./node_modules/.bin/eslint . --ext .js

source ./.env.test

echo "Running tests";

# Run tests
./node_modules/.bin/lab -v

exit $?
