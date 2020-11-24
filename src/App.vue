<template>
  <v-app>
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
      <v-list dense nav>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title class="title">
              MedAssitance
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-divider dark light></v-divider>

        <template v-if="esAdministrador">
          <v-list-item :to="{ name: 'Expediente' }">
            <v-list-item-action>
              <i class="far fa-address-card"></i>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>
                Expedientes
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>

        <template v-if="esAdministrador">
          <v-list-item :to="{ name: 'Medicos' }">
            <v-list-item-action>
              <i class="fas fa-user-md"></i>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>
                Medicos
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>

        <template v-if="esAdministrador || esUsuario">
          <v-list-item :to="{ name: 'Usuarios' }">
            <v-list-item-action>
              <i class="fas fa-users"></i>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>
                Usuarios
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>

        <template v-if="esAdministrador">
          <v-list-item :to="{ name: 'Roles' }">
            <v-list-item-action>
              <i class="fas fa-fingerprint"></i>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>
                Roles
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>

        <template v-if="esUsuario">
          <v-list-item :to="{ name: 'ExpedienteUsuario' }">
            <v-list-item-action>
              <i class="far fa-address-cardt"></i>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>
                Mi Expediente
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>

        <template v-if="esAdministrador || esUsuario">
          <v-list-item :to="{ name: 'Mapa' }">
            <v-list-item-action>
              <i class="fas fa-map-marked-alt"></i>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>
                Mapa
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
      </v-list>
    </v-navigation-drawer>

    <v-main >
      <v-container>
        <v-slide-y-transition mode="out-in">
          <router-view />
        </v-slide-y-transition>
      </v-container>
    </v-main>

    <v-footer  color="purple" absolute dark>
      <v-spacer></v-spacer>
    MedAssistance 2020
  </v-footer>
  </v-app>
</template>

<script>
export default {
  name: "App",

  components: {},

  data: () => ({
    drawer: true,
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
