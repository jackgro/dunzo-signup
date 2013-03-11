jQuery.fn.submitOnCheck = function () {
  this.find('input:checkbox').on('click', function(){
    $(this).parent('form').submit();
  });
}

jQuery.fn.resetForm = function() { 
  this.each(function(){
    this.reset();
  });
}

// Hide new task form on blur and replace with new task link
// ====== Not using for now =============
/*jQuery.fn.hideAndReplaceWith = function($form, $link){
  this.blur(function(){
    $form.fadeOut(function(){
      $link.fadeIn('fast');
      $(this).remove();
    })('fast');
  });
}*/

$(function(){
  //$('.new_task').resetForm();
  $('.edit_task').submitOnCheck();
});
