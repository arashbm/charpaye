# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
marked.setOptions( gfm: true, pedantic: false, sanitize: true)


jQuery ->
  $('*[data-markdown]').html ->
    marked $(this).data('markdown')

  convertor = Markdown.getSanitizingConverter()
  editor = new Markdown.Editor(convertor)
  editor.run()
