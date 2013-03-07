# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#//= require tinymce
setTimeout("$('.alert').slideUp('slow')",2000);

tinyMCE.init
  mode: "textareas"
  theme: "advanced"
  plugins : "syntaxhl"
  theme_advanced_toolbar_location : "top"
  theme_advanced_buttons1 : "bold,italic,underline,undo,redo,removeformat,cleanup,code, syntaxhl"
  theme_advanced_buttons2 : ""
  theme_advanced_buttons3 : ""
  remove_linebreaks : false
  extended_valid_elements : "textarea[cols|rows|disabled|name|readonly|class]"
  width : "500"