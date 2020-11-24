<template>
  <v-data-table
    :headers="headers"
    :items="expedientes"
    :search="search"
    class="elevation-1"
  >
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title>Expedientes</v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-btn outlined icon color="green" @click="initialize()"
          ><v-icon class="fa fa-sync-alt"></v-icon
        ></v-btn>
        <v-text-field
          class="text-xs-center ml-2"
          v-model="search"
          append-icon="fas fa-search"
          label="Busqueda"
          single-line
          hide-details
        ></v-text-field>
        <v-spacer></v-spacer>
        <div class="mr-1">
          Desde:
          <v-text-field
            type="date"
            class="text-xs-center"
            v-model="fechaInicio"
            :max="new Date().toISOString().substr(0, 10)"
            hide-details
          ></v-text-field>
        </div>
        <div class="ml-1">
          Hasta:
          <v-text-field
            type="date"
            class="text-xs-center"
            v-model="fechaFin"
            :max="new Date().toISOString().substr(0, 10)"
            hide-details
          ></v-text-field>
        </div>
        <v-spacer></v-spacer>
        <div>
          <v-btn color="green" @click="filtrar()" dark>
            <i class="fas fa-file-excel fa-2x"></i>
          </v-btn>
        </div>
        <v-dialog v-model="dialog" max-width="600px" persistent>
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
                      readonly
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="nombre_Medico"
                      label="Nombre Médico"
                      readonly
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="nombre_Usuario"
                      label="Nombre Usuario"
                      readonly
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="6">
                    <v-text-field
                      v-model="fecha"
                      label="Fecha"
                      type="datetime-local"
                      step="1"
                      readonly
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="6">
                    <v-text-field
                      v-model="detalles_Estudios"
                      label="Detalles de estudio"
                      readonly
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="detalles_Examenes"
                      label="Detalle de examenes"
                      readonly
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="recetas"
                      label="Recetas"
                      readonly
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field
                      v-model="costo_Cita"
                      label="Costo de cita"
                      type="number"
                      readonly
                    ></v-text-field>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn @click="descargarPDF()" color="orange" dark>
                <i class="fas fa-file-pdf fa-2x"></i>
              </v-btn>
              <v-btn color="blue darken-1" text @click="cerrarDialog()">
                Cerrar
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
      <v-snackbar v-model="snackValidacion" color="cyan darken-2" right top
        >Los campos de Fecha inicio y Fecha Fin no deben estar
        vacios.</v-snackbar
      >
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
import { jsPDF } from "jspdf";
import "jspdf-autotable";
import XLSX from "xlsx";

export default {
  data: () => ({
    expedientes: [],
    dialog: false,
    editedIndex: -1,
    search: "",
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
    fechaInicio: "",
    fechaFin: "",
    snackValidacion: false,
  }),
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Nuevo Expediente" : "Expediente";
    },
  },

  created() {
    this.initialize();
  },

  methods: {
    initialize() {
      let me = this;
      me.expedientes = [];
      axios
        .get("api/Expedientes/ListarId/" + this.$store.state.usuario.idUsuario)
        .then(function(response) {
          me.expedientes = response.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    filtrar() {
      let me = this;
      if (me.fechaInicio != "" && me.fechaFin != "") {
        me.expedientes = [];
        axios
          .get(
            "api/Expedientes/InformeID/" +
              me.fechaInicio +
              "/" +
              me.fechaFin +
              "/" +
              this.$store.state.usuario.idUsuario
          )
          .then(function(response) {
            me.expedientes = response.data;
            me.ExportarExcel();
          })
          .catch(function(error) {
            console.log(error);
          });
      } else {
        me.snackValidacion = true;
      }
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
    descargarPDF() {
      const doc = new jsPDF();
      doc.text("Mi Expediente médico", 10, 10);
      doc.autoTable({
        head: [
          [
            "Nombre Medico",
            "Paciente",
            "Fecha",
            "Detalles de estudio",
            "Detalles de examenes",
            "Recetas",
            "Costo",
          ],
        ],
        body: [
          [
            this.nombre_Medico,
            this.nombre_Usuario,
            this.fecha,
            this.detalles_Estudios,
            this.detalles_Examenes,
            this.recetas,
            this.costo_Cita,
          ],
        ],
      });

      doc.save("Expediente.pdf");
    },
    ExportarExcel() {
      let me = this;
      let data = XLSX.utils.json_to_sheet(this.expedientes);
      const workbook = XLSX.utils.book_new();
      const filename = "mi Expediente";
      XLSX.utils.book_append_sheet(workbook, data, filename);
      XLSX.writeFile(workbook, `${filename}.xlsx`);
    },
  },
};
</script>
