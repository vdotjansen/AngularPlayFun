###global require, window###

require
	paths:
		angular: 'libs/angular'
		angularResource: 'libs/angular-resource'
		modernizr: 'libs/modernizr'
		text: 'libs/text'
		use: 'libs/use'
	use:
		angular:
			attach: 'angular'
		angularResource:
			deps: ['use!angular']
		modernizr:
			attach: 'Modernizr'
	[
		'use!modernizr'
		'use!angular'
		'app'
		'controllers/gitHubController'
		'controllers/searchHistoryController'
		'controllers/twitterController'
		'directives/link'
		'directives/tabs'
		'directives/tab'
		'filters/twitterfy'
	], (modernizr, angular, app) ->
		'use strict'

		app.config ['$routeProvider', ($routeProvider) ->
			$routeProvider
			.when '/twitter/:searchTerm'
				controller: 'twitterController'
				reloadOnSearch: true
			.otherwise redirectTo: '/twitter/@CaryLandholt'
		]

		angular.bootstrap window.document, ['app']