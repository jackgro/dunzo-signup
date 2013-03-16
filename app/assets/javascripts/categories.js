$(function(){

  // Display New Category form
  $('a.new-category-link').on('click', function(){
    $('div.new-user-category-form').slideToggle(200);
  });

  $('.options').popover({
     html: true,
     placement: 'left',
     title: 'Options'
  });
});
