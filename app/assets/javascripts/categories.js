$(function(){

  // Display New Category form
  $('a.new-category-link').on('click', function(){
    $('div.new-user-category-form').slideToggle(200);
  });

  $('.best_in_place').best_in_place();
  $('.best_in_place').bind('ajax:error', function(){
    bootbox.alert("Whoa! Only letters, numbers, dashes and underscores are allowed. Please try again.");
  });
  $('.best_in_place').bind('ajax:success', function(){
    $url = $('#category-list').data('url');
    $.get($url);
  });

});
