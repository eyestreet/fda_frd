# NOTE:
#   To enabled log messages:  localStorage.debug = true
#   To disabled log messages:  delete localStorage.debug
#= require andlog/andlog

#= require jquery
#= require jquery_ujs

#= require bootstrap-sass-official/assets/javascripts/bootstrap-sprockets

#= require metisMenu

#= require raphael

#= require morrisjs

#= require flot

#= startbootstrap-sb-admin-2/dist/js/sb-admin-2

#= require leaflet.markercluster/dist/leaflet.markercluster

#= require sb-admin-2

#= require_tree .

$ ->

  element = $('ul.nav a').filter( ->
    url = window.location

    @.href == url || url.href.indexOf(@.href) == 0
  ).addClass('active').parent().parent().addClass('in').parent()

  if element.is 'li'
    element.addClass('active')

  $('#side-menu').metisMenu()
