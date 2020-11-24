<template>
  <v-data-table
    :headers="headers"
    :items="medicos"
    :search="search"
    class="elevation-1"
  >
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title>Médicos</v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-text-field
          class="text-xs-center"
          v-model="search"
          append-icon="fas fa-search"
          label="Busqueda"
          single-line
          hide-details
        ></v-text-field>
        <v-spacer></v-spacer>
        <v-dialog v-model="dialog" max-width="500px" persistent>
          <template v-slot:activator="{ on, attrs }">
            <v-btn color="primary" dark class="mb-2" v-bind="attrs" v-on="on">
              Nuevo Médico
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="headline">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" sm="6" md="6">
                    <v-text-field
                      v-model="nombre"
                      label="Nombre"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="6">
                    <v-text-field
                      v-model="telefono"
                      label="Teléfono"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="6">
                    <v-text-field
                      v-model="correo"
                      label="Correo"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="6">
                    <v-text-field
                      v-model="profesion"
                      label="Profesión"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="8">
                    <v-text-field
                      v-model="direccion"
                      label="Dirección"
                    ></v-text-field>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="cerrarDialog()">
                Cancel
              </v-btn>
              <v-btn
                color="blue darken-1"
                v-if="editedIndex == 1"
                text
                @click="actualizar()"
              >
                Actualizar
              </v-btn>
              <v-btn
                color="blue darken-1"
                v-if="editedIndex == -1"
                text
                @click="crear()"
              >
                Guardar
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    <template v-slot:[`item.actions`]="{ item }">
      <v-icon small class="mr-2" @click="verDetalles(item)">
        mdi-pencil
      </v-icon>
    </template>
    <template v-slot:no-data>
      <v-btn color="primary" @click="initialize">
        Reset
      </v-btn>
    </template>
  </v-data-table>
</template>

<script>
import axios from "axios";

export default {
  name: "Home",
  data: () => ({
    medicos: [],
    editedIndex: -1,
    dialog: false,
    search: "",
    headers: [
      {
        text: "Nombre",
        align: "start",
        value: "nombre",
      },
      { text: "Dirección", value: "direccion" },
      { text: "Teléfono", value: "telefono" },
      { text: "Correo", value: "correo" },
      { text: "Profesión", value: "profesion" },
      { text: "Actions", value: "actions", sortable: false },
    ],
    idMedico: 0,
    nombre: "",
    direccion: "",
    telefono: "",
    correo: "",
    profesion: "",
  }),
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Nuevo Medico" : "Editar Medico";
    },
  },

  created() {
    this.initialize();
  },

  methods: {
    initialize() {
      let me = this;
      axios
        .get("api/Medicos/Listar")
        .then(function(response) {
          me.medicos = response.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    crear() {
      let me = this;
      axios
        .post("api/Medicos/Crear", {
          nombre: me.nombre,
          direccion: me.direccion,
          telefono: me.telefono,
          correo: me.correo,
          profesion: me.profesion,
        })
        .then(function(response) {
          me.initialize();
          me.cerrarDialog();
        })
        .catch(function(error) {
          console.log(error);
        });
    },

    actualizar() {
      let me = this;
      axios
        .put("api/Medicos/Actualizar", {
          idMedico: me.idMedico,
          nombre: me.nombre,
          telefono: me.telefono,
          correo: me.correo,
          direccion: me.direccion,
          profesion: me.profesion,
        })
        .then(function(response) {
          me.initialize();
          me.cerrarDialog();
        })
        .catch(function(error) {
          console.log(error);
        });
    },

    verDetalles(item) {
      this.idMedico = item.idMedico;
      this.nombre = item.nombre;
      this.telefono = item.telefono;
      this.correo = item.correo;
      this.direccion = item.direccion;
      this.profesion = item.profesion;
      this.dialog = true;
      this.editedIndex = 1;
    },

    limpiar() {
      (this.idMedico = ""),
        (this.nombre = ""),
        (this.telefono = ""),
        (this.correo = ""),
        (this.direccion = "");
      this.profesion = "";
      this.editedIndex = -1;
    },

    cerrarDialog() {
      this.dialog = false;
      this.limpiar();
    },
  },
};
</script>
