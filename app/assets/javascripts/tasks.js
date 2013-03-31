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

jQuery.fn.showOnHover = function(link) {
  this.find(link).hide();
  this.hover(function(){
    $(this).find(link).toggle();
  });
}

$(function(){
  $('.edit_task').submitOnCheck();
  $('.edit_task').showOnHover('.delete-task');

  $('.task-sort').sortable({
    axis: 'y',
    handle: '.move',
    update: function(){
      $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
});
