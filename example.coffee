woocommerce = new WooCommerceWpmlApi
	url: 'http://store.site.com'
	consumerKey: 'your_costumer_key'
	consumerSecret: 'your_consumer_secret'
	lang: 'en'

Meteor.methods
	getProducts: ->
		woocommerce.get 'products', (error, result) ->
			if error then error else result

	postProduct: ->
		data = 
			name: 'You\'re wunderful'
			price: 'a lot'

		woocommerce.post 'product', data, (error, result) ->
			if error then error else result