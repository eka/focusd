# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require bootstrap
# require turbolinks
# Batman.js and its adapters
#= require batman/es5-shim
#= require batman/batman
#= require batman/batman.jquery
#= require batman/batman.rails
#= require focusd
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./helpers


#= require_tree .
# Run the Batman app
$(document).ready ->
  Focusd.run()

