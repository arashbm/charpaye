angular.module('reviewResource', ['ngResource']).
  factory 'Review', ($resource) ->
    Review = $resource(
      "#{window.location.pathname}/reviews/:id",
      {},
      update: method: 'PUT')

    Review.prototype.update = (cb) ->
        Review.update
          id: this._id.$oid,
          angular.extend({}, this, _id: undefined),
          cb

    Review.prototype.destroy = (cb) ->
      Review.remove id: this._id.$oid, cb

    return Review

angular.module('reviews', ['reviewResource']).
  config(["$httpProvider", (provider) ->
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  ])#.
  # config ($routeProvider) ->
  #   $routeProvider.
  #   when('/', controller: ListCtrl, templateUrl: 'list.html').
  #   when('/edit/:reviewId', controller: EditCtrl, templateUrl: 'detail.html').
  #   when('/new', controller: CreateCtrl, templateUrl: 'detail.html').
  #   otherwise {redirectTo: '/'}

@ListCtrl = ($scope, Review) ->
  $scope.reviews = Review.query()
  $scope.save = ->
    Review.save $scope.review, (review) ->
      $scope.reviews.push(review)

@EditCtrl = ($scope, $location, $routeParams, Review) ->
  self = this
 
  Review.get id: $routeParams.reviewId, (review) ->
    self.original = review
    $scope.review = new Review(self.original)

    $scope.isClean = ->
      return angular.equals self.original, $scope.review

    $scope.destroy = ->
      self.original.destroy ->
        $location.path '/list'

    $scope.save = ->
      $scope.review.update ->
        $location.path '/'
