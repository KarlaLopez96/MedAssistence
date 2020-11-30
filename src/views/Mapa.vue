<template>
  <v-container>
    <v-row>
      <v-col class="pa-0 mt-3 ma-0">
        <div id="mapContainer" class="DimensionMap"></div>
      </v-col>
      <div id="features">
        <!--Mostramos el panel lateral con la información al hacer la petición a la base de datos -->
        <section
          :id="c.nombreLugarId"
          class="active mt-3"
          v-for="c in datosUbicaciones"
          :key="c.idMapa"
        >
          <h3>{{ c.nombreLugar }}</h3>
          <p>
            {{ c.direccion }}
          </p>
          <img v-if="c.imagen" width="330" height="250" :src="c.imagen" />
        </section>
      </div>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";
import mapboxgl from "mapbox-gl";
export default {
  data() {
    return {
      datosUbicaciones: [],
      map: "",
      //Coordenadas de posicion central de El Salvador
      coordenadas: {
        lat: 13.793964668767925,
        lng: -88.89500168220982,
      },
      markers: [],
      accessToken:
        "pk.eyJ1Ijoiam9obmxpbmFyZXMiLCJhIjoiY2tjcWk2eDZrMTU2bjJyczVyMWF0ejg3NiJ9.848u9JaZDYfKTRPBzFvDwA",
    };
  },
  mounted() {
    let me = this;
    //Se hace la peticion al Back-end para las ubicaciones
    axios
      .get("api/Mapas/Listar")
      .then(function(response) {
        var arrayUbicaciones = [];
        var chapters = {};
        var Id = "";
        me.datosUbicaciones = response.data;
        arrayUbicaciones = response.data;
        arrayUbicaciones.forEach((element, index) => {
          me.markers.push({
            name: element.nombreLugar,
            position: {
              lat: element.latitude,
              lng: element.longitude,
            },
          });
          Id = element.nombreLugarId;
          var detalles = {
            bearing: 27,
            center: [element.longitude, element.latitude],
            zoom: 15.5,
            pitch: 20,
          };
          chapters[arrayUbicaciones[index].nombreLugarId] = detalles;
        });
        console.log(chapters);
        //Coloca los marcadores con un mensaje
        for (let i = 0; i < me.markers.length; i++) {
          var marker = new mapboxgl.Marker({ color: "blue" })
            .setLngLat(me.markers[i].position)
            .setPopup(
              new mapboxgl.Popup({ offset: 25 }).setHTML(
                "<strong>" + me.markers[i].name + "</strong>"
              )
            )
            .addTo(map);
        }

        //funciones para mostrar como panel ubicaciones con marcadores y mostrando texto e imagen
        window.onscroll = function() {
          var chapterNames = Object.keys(chapters);
          //console.log(chapterNames);
          for (var i = 0; i < chapterNames.length; i++) {
            var chapterName = chapterNames[i];
            if (isElementOnScreen(chapterName)) {
              setActiveChapter(chapterName);
              break;
            }
          }
        };
        var activeChapterName = "Farmacia-Value-1";
        function setActiveChapter(chapterName) {
          if (chapterName === activeChapterName) return;
          map.flyTo(chapters[chapterName]);
          document.getElementById(chapterName).setAttribute("class", "active");
          document.getElementById(activeChapterName).setAttribute("class", "");
          activeChapterName = chapterName;
        }
        function isElementOnScreen(id) {
          var element = document.getElementById(id);
          var bounds = element.getBoundingClientRect();
          return bounds.top < window.innerHeight && bounds.bottom > 70;
        }
      })
      .catch(function(error) {
        console.log(error);
      });

    //Se inizializa el mapa
    mapboxgl.accessToken = this.accessToken;
    var map = new mapboxgl.Map({
      container: "mapContainer",
      style: "mapbox://styles/mapbox/streets-v11",
      center: [this.coordenadas.lng, this.coordenadas.lat],
      zoom: 8,
    });

    //control para ubicar al usuario
    map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true,
        },
        trackUserLocation: true,
      })
    );

    //Controles para zoom y rotar mapa
    map.addControl(new mapboxgl.NavigationControl());

    //Trazar rutas al seleccionar dos puntos en el mapa
    map.addControl(
      new MapboxDirections({
        accessToken: mapboxgl.accessToken,
      }),
      "top-left"
    );
  },
  created() {},
  methods: {},
};
</script>

<style scoped>
.DimensionMap {
  height: 600px;
  width: 50%;
  position: fixed;
}
#features {
  width: 35%;
  margin-left: 0%;
  margin-top: 10px;
  font-family: sans-serif;
  overflow-y: scroll;
  background-color: #fafafa;
}
section {
  padding: 25px 50px;
  line-height: 25px;
  border-bottom: 1px solid #ddd;
  opacity: 0.25;
  font-size: 13px;
}
section.active {
  opacity: 1;
}
section:last-child {
  border-bottom: none;
  margin-bottom: 500px;
}
</style>
