// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require chosen-jquery

$(document).ready(function(){
  $(".date").datepicker();

  var tz = jstz.determine();
  $.cookie('timezone', tz.name());
  $(".trash_btn_div").hide();
});

$(document).on({
    mouseenter: function () {
    $(this).find(".trash_btn_div").show();
    },
    mouseleave: function () {
      $(this).find(".trash_btn_div").hide();
    }
}, ".messages_container");
