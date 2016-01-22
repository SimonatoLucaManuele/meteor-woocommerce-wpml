# WooCommerce and WMPL on Meteor
A simple "copy" of node woocommerce-api created for meteor that enable the use of multilanguage

This pack was made for personal uses

Not support for SSL for now

# Usage
Now you can add the lang value to the request object.

```
  woocommerce = new WooCommerceWpmlApi({
    url: 'YOUR URL',
    consumerKey: 'YOUR CK',
    consumerSecret: 'YOUR CS',
    lang: 'en'
```

Don't add the lang property for the default language.

WPML must be set up with languages as parameters on url