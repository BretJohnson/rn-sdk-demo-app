#!/bin/bash

echo 'Removing previous demo app source...'
rm -rf *.js js ios android package.json yarn.lock node_modules

echo 'Updating demo app source...'
cp -R ../mobile-center-sdk-react-native/DemoApp/ .

echo 'Installing node modules, with yarn...'
yarn install

echo 'Installing our npm packages...'
yarn add mobile-center
yarn add mobile-center-analytics
yarn add mobile-center-crashes
yarn add mobile-center-push

echo 'Removing Pods...'
rm -rf ios/Pods
rm ios/Podfile
rm ios/Podfile.lock

echo 'Linking...'
echo 'Android app secret should be: 13502f6c-53bc-496e-9517-f2454b4e03a5'
echo 'iOS app secret should be: 96638174-9d13-4b2b-a110-1866d6bfa7dc'
react-native link
