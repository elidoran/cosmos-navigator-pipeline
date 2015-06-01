Package.describe({
  name: 'cosmos:navigator-pipeline',
  version: '0.1.0',
  summary: 'Ordered action pipeline executed when location changes',
  git: 'http://github.com/elidoran/cosmos-navigator-pipeline',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1');

  api.use([
    'tracker',            // onLocation uses Tracker
    'underscore',         // _.extend
    'coffeescript@1.0.6',
    'cosmos:navigator-location@0.1.0',
    'cosmos:chain@0.1.0'
  ], ['client']);

    api.addFiles([
      'client/navigator-pipeline.coffee'
    ], 'client');

    api.export('Nav', 'client');
});

Package.onTest(function(api) {
  api.use(['tinytest', 'coffeescript']);

  api.use('cosmos:navigator-pipeline');

  api.addFiles([
    'test/navigator-pipeline-tests.coffee'
  ], 'client');
});
