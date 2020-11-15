<template>
  <v-app id="inspire">
    <v-app-bar
      app
      color="purple"
      fixed
      dense
      dark
      :clipped-left="$vuetify.breakpoint.mdAndUp"
    >
      <v-toolbar-title>
        <v-app-bar-nav-icon v-if="logueado" @click.stop="drawer = !drawer" />
        <span>Professionals</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn @click="salir" icon v-if="logueado">
        <i class="fas fa-sign-out-alt fa-2x"></i>
      </v-btn>
    </v-app-bar>

    <v-navigation-drawer
      :clipped="$vuetify.breakpoint.mdAndUp"
      app
      v-model="drawer"
      v-if="logueado"
    >
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title class="title">
            MedAssitance
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-divider dark light></v-divider>

      <v-list nav dense v-if="esAdministrador || esUsuario">
        <v-list-item
          v-for="item in items"
          :key="item.title"
          link
          :to="{ name: item.screen }"
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-main>
      <v-container>
        <v-slide-y-transition mode="out-in">
          <router-view />
        </v-slide-y-transition>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: "App",

  components: {},

  data: () => ({
    drawer: true,
    items: [
      {
        title: "Expediente",
        icon: "far fa-address-card",
        screen: "Expediente",
      },
      { title: "Medicos", icon: "fas fa-user-md", screen: "Medicos" },
      { title: "Usuarios", icon: "fas fa-users", screen: "Usuarios" },
      { title: "Roles", icon: "fas fa-fingerprint", screen: "Rol" },
    ],
  }),
  computed: {
    logueado() {
      return this.$store.state.usuario;
    },
    esAdministrador() {
      return (
        this.$store.state.usuario &&
        this.$store.state.usuario.rol === "Administrador"
      );
    },
    esUsuario() {
      return (
        this.$store.state.usuario && this.$store.state.usuario.rol === "Usuario"
      );
    },
  },
  create() {
    this.$store.dispatch("autoLogin");
  },
  methods: {
    salir() {
      this.$store.dispatch("salir");
    },
  },
};
</script>
