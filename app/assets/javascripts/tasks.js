jQuery.fn.submitOnCheck = function () {
  this.find('input:checkbox').on('click', function(){
    $(this).parent('form').submit();
  });
  return this;
}

jQuery.fn.resetForm = function() { 
  this.each(function(){
    this.reset();
  });
  return this;
}

$(function(){
  $('.edit_task').submitOnCheck();

  $('.task-sort').sortable({
    axis: 'y',
    handle: '.move',
    update: function(){
      $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
});
