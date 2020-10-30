<template>
  <v-data-table
    :headers="headers"
    :items="usuarios"
    sort-by="calories"
    class="elevation-3"
  >
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title>Usuarios</v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>

        <v-dialog v-model="dialog" max-width="700px" persistent>
          <template v-slot:activator="{ on, attrs }">
            <v-btn color="primary" dark class="mb-2" v-bind="attrs" v-on="on">
              Nuevo Usuario
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="headline">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" md="5">
                    <v-text-field
                      v-model="nombre"
                      label="Nombre"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="5">
                    <v-text-field
                      v-model="telefono"
                      label="Telefono"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="5">
                    <v-text-field
                      v-model="correo"
                      label="Correo"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="5">
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
              <v-btn color="blue darken-1" v-if="editedIndex == 1" text @click="actualizar()">
                Actualizar
              </v-btn>
              <v-btn color="blue darken-1" v-if="editedIndex == -1" text @click="crear()">
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
    usuarios: [],
    dialog: false,
    editedIndex: -1,
    headers: [
      {
        text: "Nombre",
        align: "start",
        sortable: false,
        value: "nombre",
      },
      { text: "Telefono", value: "telefono" },
      { text: "Correo", value: "correo" },
      { text: "Dirección", value: "direccion" },
      { text: "Actions", value: "actions", sortable: false },
    ],
    idUsuario: 0,
    idRol: 1,
    nombre: "",
    telefono: "",
    correo: "",
    direccion: "",
  }),
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Nuevo Usuario" : "Editar Usuario";
    },
  },

  created() {
    this.initialize();
  },

  methods: {
    initialize() {
      let me = this;
      axios
        .get("api/Usuarios/Listar")
        .then(function(response) {
          me.usuarios = response.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    crear(){
      let me = this;
      axios
        .post("api/Usuarios/Crear", {
          idRol: 1,
          nombre: me.nombre,
          telefono: me.telefono,
          correo: me.correo,
          direccion: me.direccion,
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
        .put("api/Usuarios/Actualizar", {
          idUsuario: me.idUsuario,
          idRol: me.idRol,
          nombre: me.nombre,
          telefono: me.telefono,
          correo: me.correo,
          direccion: me.direccion,
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
      this.idUsuario = item.idUsuario;
      this.idRol = item.idRol;
      this.nombre = item.nombre;
      this.telefono = item.telefono;
      this.correo = item.correo;
      this.direccion = item.direccion;
      this.dialog = true;
      this.editedIndex = 1;
    },
    limpiar() {
      (this.idUsuario = ""),
        (this.idRol = ""),
        (this.nombre = ""),
        (this.telefono = ""),
        (this.correo = ""),
        (this.direccion = "");
        this.editedIndex = -1;
    },
    cerrarDialog() {
      this.dialog = false;
      this.limpiar();
    },
  },
};
</script>
