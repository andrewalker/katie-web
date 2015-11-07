function ItemsByLatLng() {
    var data = this.data = {};

    for (var i = 0; i < Route.items.length; i++) {
        data[hashll(Route.items[i].location.latitude, Route.items[i].location.longitude)] = Route.items[i];
    }

    this.get = function(latlng) {
        return data[hashll(latlng.lat, latlng.lng)];
    }

    // pseudo hash function
    function hashll(lat, lng) {
        // use 3 point precision
        lat = Math.floor(lat * 1000);
        lng = Math.floor(lng * 1000);

        return '' + lat + lng;
    }
}

var itemsByLatLng = new ItemsByLatLng();

var map = L.map('map', {
    center: [ Route.items[0].location.latitude, Route.items[0].location.longitude ],
    zoom: 13,
    layers: MQ.mapLayer()
});

var markers = [];

var CustomRouteLayer = MQ.Routing.RouteLayer.extend({
  createStopMarker: function(location, stopNumber, x, y, z) {
      var item = itemsByLatLng.get(location.latLng);
    var marker = L.marker(location.latLng)
      .bindPopup('<b>' + item.title + '</b><br><img src="' + item.image  + '" width="100" >')
      .addTo(map);

    markers[stopNumber-1] = marker;

    return marker;
  }
});

var dir = MQ.routing.directions();
var loc = [];
for (var i = 0; i < Route.items.length; i++) {
    loc.push({
        latLng: { lat: Route.items[i].location.latitude, lng: Route.items[i].location.longitude }
    });
}

dir.route({ locations: loc, routeType: 'multimodal' });

map.addLayer(new CustomRouteLayer({
  directions: dir,
  fitBounds: true,
  ribbonOptions: {
    draggable: false
  }
}));

$(function () {
    $('.museum-map').each(function () {
        var i = this.id.replace('map-', '');
        console.log(Route.items[i].location, this.id);
        L.map(this.id, {
            center: [ Route.items[i].location.latitude, Route.items[i].location.longitude ],
            zoom: 13,
        });
    });
});
