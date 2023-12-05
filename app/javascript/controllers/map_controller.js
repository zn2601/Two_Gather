import { Controller } from "@hotwired/stimulus";

import mapboxgl from "mapbox-gl";

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    center: Object,
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/light-v10",
    });
    this.#addMarkersToMap();

    if (this.centerValue) {
      const bounds = new mapboxgl.LngLatBounds();
      bounds.extend([this.centerValue.lng, this.centerValue.lat]);
      this.map.fitBounds(bounds, {
        padding: 70,
        maxZoom: this.centerValue.zoom,
        duration: 0,
      });
    }
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const color = marker.type == "helper" ? "#94D2FF" : "#D2C4FF";
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);
      new mapboxgl.Marker({ "color": color })
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)

    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) =>
      bounds.extend([marker.lng, marker.lat])
    );
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}
