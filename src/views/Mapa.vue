<template>
  <v-container>
    <v-row>
      <v-col class="pa-0 mt-3 ma-0">
        <div id="mapContainer" class="DimensionMap"></div>
      </v-col>
      <div id="features">
        <section id="Farmacia-Value-1" class="active mt-3">
          <h3>Farmacia Value</h3>
          <p>
            Avenida Independencia Sur, Santa Ana
          </p>
          <img
            width="330"
            height="250"
            src="https://farmavalue.biz/elsalvador/wp-content/uploads/sites/19/2019/06/Santa-Ana1.jpg"
          />
        </section>
        <section id="Farmacia-Value-2">
          <h3>Farmacia Value</h3>
          <p>
            Estación de servicio y Centro Comercial Texaco Las Piletas B-1
          </p>
          <img
            width="330"
            height="250"
            src="https://farmavalue.biz/elsalvador/wp-content/uploads/sites/19/2019/06/Escalo%CC%81n2.jpg"
          />
        </section>
        <section id="Farmacia-Value-3">
          <h3>Farmacia Value</h3>
          <p>
            Diagonal Doctor Luis Edmundo Vasquez,, San Salvador
          </p>
          <img
            width="330"
            height="250"
            src="https://farmavalue.biz/elsalvador/wp-content/uploads/sites/19/2019/06/Escalo%CC%81n1.jpg"
          />
        </section>
        <section id="Farmacia-Value-4">
          <h3>Farmacia Value</h3>
          <p>
            Plaza Soyapango, Soyapango
          </p>
          <img
            width="330"
            height="250"
            src="https://farmavalue.biz/elsalvador/wp-content/uploads/sites/19/2019/06/San-Jacinto2.jpg"
          />
        </section>
        <section id="Farmacia-Economica-1">
          <h3>Farmacia Económica</h3>
          <p>
            Calle Chiltiupan, Santa Tecla
          </p>
          <img
            width="330"
            height="250"
            src="https://i.ytimg.com/vi/GAXLZ-Sk3uM/hqdefault.jpg"
          />
        </section>
        <section id="Farmacia-Economica-2">
          <h3>Farmacia Económica</h3>
          <p>
            Boulevard Constitución y Calle El Algodon, San Salvador
          </p>
          <img
            width="330"
            height="250"
            src="https://multiplaza-samantha.s3.amazonaws.com/uploads/post/v4_mobile/3543/v400_400_FarmaciaEconomicas_800x800.jpg"
          />
        </section>
        <section id="Farmacia-Economica-3">
          <h3>Farmacia Económica</h3>
          <p>
            9° Ave. Sur y calle Ruben Dario Centro Comericial Plaza Centro Local
            211 San Salvador CP, 1101
          </p>
          <img
            width="330"
            height="250"
            src="https://elencuentrosv.com/wp-content/uploads/2020/04/ECL-farmacias-economicas.jpg"
          />
        </section>
        <section id="Farmacia-Economica-4">
          <h3>Farmacia Económica</h3>
          <p>
            Calle Modelo, San Salvador
          </p>
          <img
            width="330"
            height="250"
            src="https://1.bp.blogspot.com/-8ZKxa25MR-w/UoZty5c5YaI/AAAAAAAAADg/mG8llKW6Kl8/s1600/Plaza+Mundo+3.jpg"
          />
        </section>
        <section id="Farmacia-San-Nicolas-1">
          <h3>Farmacia San Nicolás</h3>
          <p>
            Sonsonate
          </p>
          <img
            width="330"
            height="250"
            src="https://cdn-pro.elsalvador.com/wp-content/uploads/2017/01/25204021/1435747365718.jpg"
          />
        </section>
        <section id="Farmacia-San-Nicolas-2">
          <h3>Farmacia San Nicolás</h3>
          <p>
            Centro comercial El encuentro, Lourdes
          </p>
          <img
            width="330"
            height="250"
            src="https://www.dinero.com.sv/images/20161007_143212.jpg"
          />
        </section>
        <section id="Farmacia-San-Nicolas-3">
          <h3>Farmacia San Nicolás</h3>
          <p>
            Apopa
          </p>
          <img
            width="330"
            height="250"
            src="https://cdn-pro.elsalvador.com/wp-content/uploads/2017/01/27002259/1434904918144.jpg"
          />
        </section>
        <section id="Farmacia-San-Nicolas-4">
          <h3>Farmacia San Nicolás</h3>
          <p>
            Km. 10, Carretera al Puerto de La Libertad Antiguo Cuscatlán,
            Antiguo Cuscatlán
          </p>
          <img
            width="330"
            height="250"
            src="https://www.farmaciasannicolas.com/img/nosotros/acerca/01.jpg"
          />
        </section>
        <section id="Farmacia-UNO-1">
          <h3>Farmacia UNO</h3>
          <p>
            Jardines de la Gloria, Prol Bulevar Constitución, Mejicanos
          </p>
        </section>
        <section id="Farmacia-UNO-2">
          <h3>Farmacia UNO</h3>
          <p>
            Pje No. 5 Dr Salvador Infante Diaz, San Salvador
          </p>
        </section>
        <section id="Farmacia-UNO-3">
          <h3>Farmacia UNO</h3>
          <p>
            Cd Merliot, la gran vía
          </p>
        </section>
        <section id="Farmacia-UNO-4">
          <h3>Farmacia UNO</h3>
          <p>
            Calle Antigua a Huizucar C-37, San Salvador
          </p>
        </section>
      </div>
    </v-row>
  </v-container>
</template>

<script>
import mapboxgl from "mapbox-gl";
export default {
  data() {
    return {
      map: "",
      coordenadas: {
        lat: 13.793964668767925,
        lng: -88.89500168220982,
      },
      markers: [
        {
          name: "Farmacia Value",
          position: {
            lat: 14.015178380223439,
            lng: -89.56268108185407,
          },
        },
        {
          name: "Farmacia Value",
          position: {
            lat: 13.658393407400249,
            lng: -89.27937626849335,
          },
        },
        {
          name: "Farmacia Value",
          position: {
            lat: 13.709680955056216,
            lng: -89.20169949812468,
          },
        },
        {
          name: "Farmacia Value",
          position: {
            lat: 13.702342934664744,
            lng: -89.151917696986,
          },
        },
        {
          name: "Farmacia Económica",
          position: {
            lat: 13.678560556766945,
            lng: -89.26809090327585,
          },
        },
        {
          name: "Farmacia Económica",
          position: {
            lat: 13.722047721532723,
            lng: -89.22350185795166,
          },
        },
        {
          name: "Farmacia Económica",
          position: {
            lat: 13.70370320685091,
            lng: -89.19586437806772,
          },
        },
        {
          name: "Farmacia Económica",
          position: {
            lat: 13.689855265419146,
            lng: -89.19515490701257,
          },
        },
        {
          name: "Farmacia San Nicolás",
          position: {
            lat: 13.758889041579193,
            lng: -89.72249867187408,
          },
        },
        {
          name: "Farmacia San Nicolás",
          position: {
            lat: 13.756221254884057,
            lng: -89.35994984787598,
          },
        },
        {
          name: "Farmacia San Nicolás",
          position: {
            lat: 13.798568741372952,
            lng: -89.17764547878467,
          },
        },
        {
          name: "Farmacia San Nicolás",
          position: {
            lat: 13.671253118961747,
            lng: -89.27051428380605,
          },
        },
        {
          name: "Farmacia UNO",
          position: {
            lat: 13.748177952516501,
            lng: -89.21810405026591,
          },
        },
        {
          name: "Farmacia UNO",
          position: {
            lat: 13.716494600870293,
            lng: -89.20231120461794,
          },
        },
        {
          name: "Farmacia UNO",
          position: {
            lat: 13.68480697233331,
            lng: -89.25483958253402,
          },
        },
        {
          name: "Farmacia UNO",
          position: {
            lat: 13.682805505046371,
            lng: -89.22497050489547,
          },
        },
      ],
      accessToken:
        "pk.eyJ1Ijoiam9obmxpbmFyZXMiLCJhIjoiY2tjcWk2eDZrMTU2bjJyczVyMWF0ejg3NiJ9.848u9JaZDYfKTRPBzFvDwA",
    };
  },
  mounted() {
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

    //Coloca los marcadores con un mensaje
    for (let i = 0; i < this.markers.length; i++) {
      var marker = new mapboxgl.Marker({ color: "blue" })
        .setLngLat(this.markers[i].position)
        .setPopup(
          new mapboxgl.Popup({ offset: 25 }).setHTML(
            "<strong>" + this.markers[i].name + "</strong>"
          )
        )
        .addTo(map);
    }

    var chapters = {
      "Farmacia-Value-1": {
        bearing: 27,
        center: [-89.56268108185407, 14.015178380223439],
        zoom: 15.5,
        pitch: 20,
      },
      "Farmacia-Value-2": {
        duration: 6000,
        center: [-89.27937626849335, 13.658393407400249],
        bearing: 150,
        zoom: 15,
        pitch: 0,
      },
      "Farmacia-Value-3": {
        bearing: 90,
        center: [-89.20169949812468, 13.709680955056216],
        zoom: 13,
        speed: 0.6,
        pitch: 40,
      },
      "Farmacia-Value-4": {
        bearing: 90,
        center: [-89.151917696986, 13.702342934664744],
        zoom: 12.3,
      },
      "Farmacia-Economica-1": {
        bearing: 45,
        center: [-89.26809090327585, 13.678560556766945],
        zoom: 15.3,
        pitch: 20,
        speed: 0.5,
      },
      "Farmacia-Economica-2": {
        bearing: 180,
        center: [-89.22350185795166, 13.722047721532723],
        zoom: 12.3,
      },
      "Farmacia-Economica-3": {
        bearing: 90,
        center: [-89.19586437806772, 13.70370320685091],
        zoom: 17.3,
        pitch: 40,
      },
      "Farmacia-Economica-4": {
        bearing: 90,
        center: [-89.19515490701257, 13.689855265419146],
        zoom: 14.3,
        pitch: 20,
      },
      "Farmacia-San-Nicolas-1": {
        bearing: 90,
        center: [-89.72249867187408, 13.758889041579193],
        zoom: 14.3,
        pitch: 20,
      },
      "Farmacia-San-Nicolas-2": {
        bearing: 90,
        center: [-89.35994984787598, 13.756221254884057],
        zoom: 14.3,
        pitch: 20,
      },
      "Farmacia-San-Nicolas-3": {
        bearing: 90,
        center: [-89.17764547878467, 13.798568741372952],
        zoom: 14.3,
        pitch: 20,
      },
      "Farmacia-San-Nicolas-4": {
        bearing: 90,
        center: [-89.27051428380605, 13.671253118961747],
        zoom: 14.3,
        pitch: 20,
      },
      "Farmacia-UNO-1": {
        bearing: 90,
        center: [-89.21810405026591, 13.748177952516501],
        zoom: 14.3,
        pitch: 20,
      },
      "Farmacia-UNO-2": {
        bearing: 90,
        center: [-89.20231120461794, 13.716494600870293],
        zoom: 14.3,
        pitch: 20,
      },
      "Farmacia-UNO-3": {
        bearing: 90,
        center: [-89.25483958253402, 13.68480697233331],
        zoom: 14.3,
        pitch: 20,
      },
      "Farmacia-UNO-4": {
        bearing: 90,
        center: [-89.22497050489547, 13.682805505046371],
        zoom: 14.3,
        pitch: 20,
      },
    };

    //funciones para mostrar como panel ubicaciones con marcadores y mostrando texto e imagen
    window.onscroll = function() {
      var chapterNames = Object.keys(chapters);
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
