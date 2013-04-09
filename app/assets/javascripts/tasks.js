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

// iPad uses html views
// Always show category icons on iPad
// iPhone uses mobile views. Not hidden by default
// so no special iPhone functionality required in this method
jQuery.fn.showOnHover = function(link) {
  if (navigator.userAgent.match(/iPad/)){
    $(this).find(link).removeClass('hidden');
  } else {
    this.hover(function(){
      $(this).find(link).toggleClass('hidden');
    });
  }
}

$(function(){
  $('.edit_task').submitOnCheck();
  $('.edit_task').showOnHover('i.icon-remove');

  $('li.category').showOnHover('i.icon-edit');
  $('li.category').showOnHover('i.icon-remove');

  $('.task-sort').sortable({
    axis: 'y',
    handle: '.move',
    update: function(){
      $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
});
