<template>
  <v-layout align-start>
    <v-flex>
      <v-data-table
        :headers="headers"
        :items="roles"
        :search="search"
        sort-by="calories"
        class="elevation-1"
      >
        <template v-slot:top>
          <v-toolbar flat color="white">
            <v-toolbar-title>Roles</v-toolbar-title>
            <v-divider class="mx-4" inset vertical></v-divider>
            <v-spacer></v-spacer>
            <v-text-field
              class="text-xs-center"
              v-model="search"
              append-icon="fas fa-search"
              label="Busqueda"
              single-line
              hide-details
            ></v-text-field>
            <v-spacer></v-spacer>
          </v-toolbar>
        </template>
        <template v-slot:[`item.condicion`]="{ item }">
          <v-chip :color="getColorCondicion(item.condicion)" dark>
            <div v-if="item.condicion"><span>Activo</span></div>
            <div v-else><span>Inactivo</span></div>
          </v-chip>
        </template>
      </v-data-table>
    </v-flex>
  </v-layout>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      dialog: false,
      roles: [],
      headers: [
        { text: "Nombre", value: "nombre", sortable: false },
        { text: "Descripcion", value: "descripcion", sortable: false },
        { text: "Estado", value: "condicion", sortable: false }
      ],
      search: "",
    };
  },
  created() {
    this.listar();
  },
  methods: {
    listar() {
      let me = this;
      let header = { Authorization: "Bearer " + this.$store.state.token };
      let configuracion = { headers: header };
      axios
        .get("api/Roles/Listar", configuracion)
        .then(function(response) {
          me.roles = response.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    getColorCondicion(condicion) {
      if (condicion == true) {
        return "green";
      } else {
        return "red";
      }
    }
  }
};
</script>