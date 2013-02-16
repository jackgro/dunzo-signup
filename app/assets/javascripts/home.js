//= require custom/bootstrap.min.js
//= require jquery.mobile-touch-swipe-1.0.js
//= require jquery.lazyload.min.js
//= require jquery.epicfullscreen.js
//= require waypoints.min.js
//= require jquery.parallax-1.1.3.js
//= require onepage.js
//= require jquery.fancybox-1.3.4.pack.js
//= require common.js
//= require subscribe.js



$('document').ready(function() {

  // use AJAX to submit the "request invitation" form
  $('#invitation_button').live('click', function() {
    var email = $('form #user_email').val();
    if($('form #user_opt_in').is(':checked'))
        var opt_in = true;
    else
        var opt_in = false;
    var dataString = 'user[email]='+ email + '&user[opt_in]=' + opt_in;
    $.ajax({
      type: "POST",
      url: "/accounts",
      data: dataString,
      success: function(data) {
        $('#request-invite').html(data);
        loadSocial();
      }
    });
    return false;
  });
});

// load social sharing scripts if the page includes a Twitter "share" button
function loadSocial() {

    //Twitter
    if (typeof (twttr) != 'undefined') {
      twttr.widgets.load();
    } else {
      $.getScript('http://platform.twitter.com/widgets.js');
    }

    //Facebook
    if (typeof (FB) != 'undefined') {
      FB.init({ status: true, cookie: true, xfbml: true });
    } else {
      $.getScript("http://connect.facebook.net/en_US/all.js#xfbml=1", function () {
        FB.init({ status: true, cookie: true, xfbml: true });
      });
    }

    //Google+
    if (typeof (gapi) != 'undefined') {
      $(".g-plusone").each(function () {
        gapi.plusone.render($(this).get(0));
      });
    } else {
      $.getScript('https://apis.google.com/js/plusone.js');
    }
}
