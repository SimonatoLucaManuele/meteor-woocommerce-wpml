# per prima cosa mettiamo i require
OAuth = Npm.require 'oauth-1.0a'

# creiamo la nostra class

class WooCommerceWpmlApi
	constructor: (@opt) ->
		if not @opt.url then throw new Error 'url required'
		if not @opt.consumerKey then throw new Error 'consumerKey required'
		if not @opt.consumerSecret then throw new Error 'consumerSecret required'

		@classVersion = '1.0.4'
		@_setDefaultOptions @opt

	_setDefaultOptions: (opt) ->
		@url = opt.url
		@lang = opt.lang or null
		@consumerKey = opt.consumerKey
		@consumerSecret = opt.consumerSecret
		@encoding = opt.encoding or 'utf8'
		@version = opt.version or 'v3'
		@signature = opt.signature or 'HMAC-SHA256'
		# @isSsl = /^https/i.test @.url
		# @verifySsl = if opt.verifySsl is false then false else true

	_getUrl: (endpoint) ->
		url = if '/' is @url.slice(-1) then @url else @url +'/'
		url = url + 'wc-api/' + @version + '/' + endpoint

		if not @lang then url else url = url + '?lang=' + @lang

	_getOAuth: ->
		data =
			consumer:
				public: @consumerKey
				secret: @consumerSecret
			signature_method: @signature

		new OAuth data

	_request: (method, endpoint, data, callback) ->

		url = @_getUrl endpoint

		auth = @_getOAuth.authorize
			url: url
			method: method

		if data then parmas.body = JSON.stringify data

		HTTP.call method, url, [params: auth, data: data], callback

	get: (endpoint, callback) ->
		@_request 'GET', endpoint, null, callback

	post: (endpoint, data, callback) ->
		@_request 'POST', endpoint, data, callback

	put: (endpoint, data, callback) ->
		@_request 'PUT', endpoint, data, callback

	delete: (endpoint, callback) ->
		@_request 'DELETE', endpoint, null, callback