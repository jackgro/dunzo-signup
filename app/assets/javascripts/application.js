// This is a manifest file that'll be  into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the  file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootbox.min.js
//= require tasks
//= require bootstrap-alert.js
//= require bootstrap-button.js
//= require bootstrap-collapse.js
//= require bootstrap-dropdown.js
//= require bootstrap-modal.js
//= require bootstrap-tooltip.js
//= require bootstrap-popover.js

$('document').ready(function() {

  if (!navigator.userAgent.match(/iPhone/)) {

    // Override default confirm dialog with Bootbox
    $.rails.allowAction = function(element) {
    var message = element.data('confirm'),
      answer = false, callback;
    if (!message) { return true; }

    if ($.rails.fire(element, 'confirm')) {
      myCustomConfirmBox(message, function() {
        callback = $.rails.fire(element,
          'confirm:complete', [answer]);
          if(callback) {
            var oldAllowAction = $.rails.allowAction;
            $.rails.allowAction = function() { return true; };
            element.trigger('click');
            $.rails.allowAction = oldAllowAction;
          }
        });
      }
      return false;
    }

    function myCustomConfirmBox(message, callback) {
      bootbox.confirm(message, "Cancel", "Yes", function(confirmed) {
        if(confirmed){
          callback();
        }
      });
    }

  }
});
