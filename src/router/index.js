import Vue from 'vue'
import VueRouter from 'vue-router'
import Usuarios from '../views/Usuarios.vue'
import Medicos from '../views/Medicos.vue'
import Expediente from '../views/Expediente.vue'
import ExpedienteUsuario from '../views/ExpedienteUsuario.vue'
import Rol from "../views/Rol.vue"
import Login from "../views/Login.vue"
import Mapa from "../views/Mapa.vue"
import store from "../store";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Usuarios',
    component: Usuarios,
    meta: {
      administrador: true,
      usuario: true,
    }
  },
  {
    path: '/medicos',
    name: 'Medicos',
    component: Medicos,
    meta: {
      administrador: true,
    }
  },
  {
    path: '/expediente',
    name: 'Expediente',
    component: Expediente,
    meta: {
      administrador: true,
    }
  },
  {
    path: '/ExpedienteUsuario',
    name: 'ExpedienteUsuario',
    component: ExpedienteUsuario,
    meta: {
      usuario: true,
    }
  },
  {
    path: '/rol',
    name: 'Roles',
    component: Rol,
    meta: {
      administrador: true,
    }
  },
  {
    path: '/mapa',
    name: 'Mapa',
    component: Mapa,
    meta: {
      administrador: true,
      usuario: true,
    }
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: {
      libre: true,
    }
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  if (to.matched.some((record) => record.meta.libre)) {
    next();
  }
  else if (store.state.usuario && store.state.usuario.rol == "Administrador") {
    if (to.matched.some((record) => record.meta.administrador)) {
      next();
    }
  }
  else if (store.state.usuario && store.state.usuario.rol == "Usuario") {
    if (to.matched.some((record) => record.meta.usuario)) {
      next();
    }
  } else {
    next({
      name: "login",
    });
  }
});

export default router
