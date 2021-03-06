// Generated by CoffeeScript 1.10.0
(function() {
  Package.describe({
    name: 'simonato:woocommerce-wpml',
    summary: 'a simple clone of woocommerce-api create for Meteor that allow multilanguage support',
    git: 'https://github.com/SimonatoLucaManuele/meteor-woocommerce-wpml',
    documentation: 'README.md',
    version: '0.0.1'
  });

  Package.onUse(function(api) {
    api.versionsFrom('1.2.1');
    api.use('ecmascript');
    api.use('http');
    return api.addFiles('woocommerce-wpml.js');
  });

  Npm.depends({
    'oauth-1.0a': '1.0.1'
  });

}).call(this);


//# sourceMappingURL=package.js.map
