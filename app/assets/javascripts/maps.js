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
          }
        }
      });

    });

  };

  if( $('#modal-map').length ) {

      modalMap = new GMaps({
        div: '#modal-map',
        lat: -12.043333,
        lng: -77.028333
      });

      GMaps.geocode({
      address: 'London, UK',
      callback: function(results, status) {
        if (status == 'OK') {
          var latlng = results[0].geometry.location;
          modalMap.setCenter(latlng.lat(), latlng.lng());
        }
      }
    });

  };

});