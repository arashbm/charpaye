# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
marked.setOptions( gfm: true, pedantic: false, sanitize: true)

jQuery ->
  $('textarea#post_body').autogrow()
  $('input#post_title').keyup ->
    $('textarea#post_body').keyup()
  $('textarea#post_body').keyup ->
    $('div#post_body_preview').html "<h1>#{$('input#post_title').val()}</h1><div>#{marked $(this).val()}</div>"
  $('textarea#post_body').keyup()
  $('*[data-markdown]').html ->
    marked $(this).data('markdown')
