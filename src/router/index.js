import Vue from 'vue'
import VueRouter from 'vue-router'
import Usuarios from '../views/Usuarios.vue'
import Medicos from '../views/Medicos.vue'
import Expediente from '../views/Expediente.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Usuarios',
    component: Usuarios
  },
  {
    path: '/medicos',
    name: 'Medicos',
    component: Medicos
  },
  {
    path: '/expediente',
    name: 'Expediente',
    component: Expediente
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
