import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify';
import VueGeolocation from 'vue-browser-geolocation';
import axios from "axios";

Vue.config.productionTip = false
Vue.use(VueGeolocation);

//desarrollo
axios.defaults.baseURL = "http://localhost:52064";

//Servidor
//axios.defaults.baseURL = "http://192.168.1.22:9096"

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
