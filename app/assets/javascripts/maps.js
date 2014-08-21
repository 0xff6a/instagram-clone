$(document).ready( function () {
  
  var map = new GMaps({
    div: '#map',
    lat: -12.043333,
    lng: -77.028333
  });

  GMaps.geocode({
    address: postLocation,
    callback: function(results, status) {
      if (status == 'OK') {
        var latlng = results[0].geometry.location;
        map.setCenter(latlng.lat(), latlng.lng());
        map.addMarker({
          lat: latlng.lat(),
          lng: latlng.lng(),
          infoWindow: {
            content: "<div><span class='glyphicon glyphicon-film'></span><span> " + postTitle + " </span></div><img src='"+ pictureUrl + "'></img>"
          }
        });
      }
    }
  });
  
});