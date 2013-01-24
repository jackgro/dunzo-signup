jQuery.fn.submitOnCheck = function () {
  this.find('input[type=checkbox]').on('click', function(){
    $(this).parent('form').submit();
  });
  return this; // Allow chaining other calls onto it
}

$(function(){
  $('.edit_task').submitOnCheck();
});
