$ ->

  console.log 'recall_events'

  map = L.map('map', { maxZoom: 5 }).setView [37.09024, -95.712891], 4

  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
  }).addTo map

  markers = new L.MarkerClusterGroup
    showCoverageOnHover: false
    maxClusterRadius: 30

  # index map
  if $('.recall_event').length

    $('.recall_event').each (index, element) ->

      recall_event = $(element)

      popup_text = "<h5>#{ recall_event.find('h3.timeline-title').html() }</h5><p>#{ recall_event.find('.timeline-body p.reason').html() }</p><p>#{ recall_event.find('.timeline-body p.description').html() }</p><p>#{ recall_event.find('.timeline-body p.locations').html() }</p>"

      console.log popup_text

      for location in recall_event.data('locations')
        console.log location

        marker = new L.marker([location.coordinates[1], location.coordinates[0]])

        marker.bindPopup popup_text

        markers.addLayer marker

    map.addLayer markers

  # show map
  if $('h4.locations').length

    for location in $('h4.locations').data('locations')
      L.marker([location.coordinates[1], location.coordinates[0]]).addTo map
