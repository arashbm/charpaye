# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
@ActivityCtrl = ($scope) ->
  $scope.activities = [
    {
      subject_name: 'شما'
      action: 'ایجاد کردید'
      thing_type: 'مطلب'
      thing_name: 'گوردا گوردا در اثر معاصر'
      thing_path: '/posts/2'
    }

    {
      subject_name: 'سارا حیدری'
      action: 'ایجاد کرد'
      thing_type: 'نظر'
      thing_name: 'گوردا گوردا در اثر معاصر'
      thing_path: '/posts/2#review_1'
    }
  ]
