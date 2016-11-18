Package.describe({
  name: 'meteor-screensize',
  version: '0.0.0',
  summary: 'Meteor package with helpers for easy screen size detection'
});

Package.onUse(function (api) {
  api.versionsFrom('1.1.0.2');
  api.use([
    'underscore',
    'coffeescript',
    'templating',
    'jquery',
    'deps',
    'ui'
  ], 'client');

  api.addFiles('index.coffee', 'client');
});