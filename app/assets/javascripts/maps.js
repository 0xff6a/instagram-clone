$(document).ready( function () {
  
  if( $('#map').length ) {

    postId = $('#map').data('id')

    $.get('/posts/' + postId , function(response) {

      var map = new GMaps({
        div: '#map',
        lat: -12.043333,
        lng: -77.028333
      });

      GMaps.geocode({
        address: response.postLocation,
        callback: function(results, status) {
          if (status == 'OK') {
            var latlng = results[0].geometry.location;
            map.setCenter(latlng.lat(), latlng.lng());
            map.addMarker({
              lat: latlng.lat(),
              lng: latlng.lng(),
              infoWindow: {
                content: "<div><span class='glyphicon glyphicon-film'></span><span> " + response.postTitle + " </span></div><img src='"+ response.pictureUrl + "'></img>"
              }
            });
            console.log(map.markers[0]);
          }
        }
      });
      
    });

  };

  if( $('#modal-map').length ) {

      var modalMap = new GMaps({
        div: '#modal-map',
        lat: -0.0,
        lng: -0.0
      });

    GMaps.geolocate({
      success: function(position){
        modalMap.setCenter(position.coords.latitude, position.coords.longitude);
      }
    });

    GMaps.on('click', modalMap.map, function(event) {

      modalMap.removeMarkers();

      var index = modalMap.markers.length;
      var lat = event.latLng.lat();
      var lng = event.latLng.lng();
      var template = $('#edit_marker_template').text();
      var content = template.replace(/{{index}}/g, index).replace(/{{lat}}/g, lat).replace(/{{lng}}/g, lng);

      modalMap.addMarker({
        lat: lat,
        lng: lng,
        id: 1,
      });

      GMaps.geocode({
        lat: lat, 
        lng: lng, 
        callback: function(result, status){
          $('#post_location').val(result[0].formatted_address);
        }
      });

    });

    $('#find-location-btn').on('click', function() {
      event.preventDefault();
      GMaps.geocode({
        address: $('#post_location').val(),
        callback: function(results, status) {
          if (status == 'OK') {
            var latlng = results[0].geometry.location;
            modalMap.setCenter(latlng.lat(), latlng.lng());
          }
        }
      });

    });

    $('#newPostModal').on('shown.bs.modal', function () {
      modalMap.refresh();
    });

  };

});
