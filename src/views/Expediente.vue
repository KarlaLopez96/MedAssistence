<template>
  <v-data-table :headers="headers" :items="expedientes" class="elevation-1">
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title>Expedientes</v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>
        <v-dialog v-model="dialog" max-width="600px" persistent>
          <template v-slot:activator="{ on, attrs }">
            <v-btn color="primary" dark class="mb-2" v-bind="attrs" v-on="on">
              Nuevo Expediente
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="headline">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="nombre"
                      label="Nombre"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="nombre_Medico"
                      label="Nombre Médico"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="nombre_Usuario"
                      label="Nombre Usuario"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="6">
                    <v-text-field
                      v-model="fecha"
                      label="Fecha"
                      type="datetime-local"
                      step="1"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="6">
                    <v-text-field
                      v-model="detalles_Estudios"
                      label="Detalles de estudio"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="detalles_Examenes"
                      label="Detalle de examenes"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="recetas"
                      label="Recetas"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="costo_Cita"
                      label="Costo de cita"
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
  data: () => ({
    expedientes: [],
    dialog: false,
    editedIndex: -1,
    headers: [
      {
        text: "Nombre",
        align: "start",
        value: "nombre",
      },
      { text: "Cliente", value: "nombre_Usuario" },
      { text: "Medico", value: "nombre_Medico" },
      { text: "Fecha", value: "fecha" },
      { text: "Detalles de estudios", value: "detalles_Estudios" },
      { text: "Detalles de Examenes", value: "detalles_Examenes" },
      { text: "Actions", value: "actions", sortable: false },
    ],
    idExpediente: 0,
    idUsuario: 0,
    idMedico: 0,
    nombre: "",
    nombre_Medico: "",
    nombre_Usuario: "",
    fecha: "",
    detalles_Estudios: "",
    detalles_Examenes: "",
    recetas: "",
    costo_Cita: "",
  }),
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Nuevo Expediente" : "Editar Expediente";
    },
  },

  created() {
    this.initialize();
  },

  methods: {
    initialize() {
      let me = this;
      axios
        .get("api/Expedientes/Listar")
        .then(function(response) {
          me.expedientes = response.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    crear() {
      let me = this;
      axios
        .post("api/Expedientes/Crear", {
          idMedico: 1,
          idUsuario: 1,
          Nombre: me.nombre,
          Nombre_Medico: me.nombre_Medico,
          Nombre_Usuario: me.nombre_Usuario,
          Fecha: me.fecha,
          Detalles_Estudios: me.detalles_Estudios,
          Detalles_Examenes: me.detalles_Examenes,
          Recetas: me.recetas,
          Costo_Cita: me.costo_Cita,
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
        .put("api/Expedientes/Actualizar", {
          idExpediente: me.idExpediente,
          idMedico: me.idMedico,
          idUsuario: me.idUsuario,
          Nombre: me.nombre,
          Nombre_Medico: me.nombre_Medico,
          Nombre_Usuario: me.nombre_Usuario,
          Fecha: me.fecha,
          Detalles_Estudios: me.detalles_Estudios,
          Detalles_Examenes: me.detalles_Examenes,
          Recetas: me.recetas,
          Costo_Cita: me.costo_Cita,
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
      this.idExpediente = item.idExpediente;
      this.idUsuario = item.idUsuario;
      this.idMedico = item.idMedico;
      this.nombre = item.nombre;
      this.nombre_Medico = item.nombre_Medico;
      this.nombre_Usuario = item.nombre_Usuario;
      this.fecha = item.fecha;
      this.detalles_Estudios = item.detalles_Estudios;
      this.detalles_Examenes = item.detalles_Examenes;
      this.recetas = item.recetas;
      this.costo_Cita = item.costo_Cita;
      this.dialog = true;
      this.editedIndex = 1;
    },
    limpiar() {
      this.idExpediente = 0;
      this.idUsuario = 0;
      this.idMedico = 0;
      this.nombre = "";
      this.nombre_Medico = "";
      this.nombre_Usuario = "";
      this.detalles_Estudios = "";
      this.detalles_Examenes = "";
      this.fecha = "";
      this.recetas = "";
      this.costo_Cita = "";
      this.editedIndex = -1;
    },
    cerrarDialog() {
      this.dialog = false;
      this.limpiar();
    },
  },
};
</script>
