#!/bin/bash

echo switching node to version $NODE_VERSION
n $NODE_VERSION --quiet

echo node version: `node --version`

git clone $GIT_URL app
cd app

npm install --production --silent
npm run $NPM_SCRIPT
