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
        <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
        <span>Professionals</span>
      </v-toolbar-title>
    </v-app-bar>

    <v-navigation-drawer
      :clipped="$vuetify.breakpoint.mdAndUp"
      app
      v-model="drawer"
    >
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title class="title">
            MedAssitance
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-divider dark light></v-divider>

      <v-list nav dense>
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
      <v-container fluid>
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
      { title: "Usuarios", icon: "fas fa-users", screen: "Usuarios" },
      { title: "Expediente", icon: "far fa-address-card", screen: "Expediente" },
      { title: "Medicos", icon: "fas fa-user-md", screen: "Medicos" },
    ],
  }),

  methods: {},
};
</script>
