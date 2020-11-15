<template>
  <v-data-table :headers="headers" :items="usuarios" class="elevation-3">
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
                  <v-col cols="12" md="5">
                    <v-text-field
                      v-model="password"
                      label="CONTRASEÑA"
                      type="password"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" md="5">
                    <v-select v-model="idRol" :items="roles" label="ROLES">
                    </v-select>
                  </v-col>
                  <v-col cols="12" sm="12" md="12" v-show="valida">
                    <div
                      class="red--text"
                      v-for="v in validaMensaje"
                      :key="v"
                      v-text="v"
                    ></div>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="cerrarDialog()">
                Cerrar
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
        <v-dialog v-model="addModal" max-width="350px">
          <v-card>
            <v-card-title class="headline" v-if="addAccion == 1"
              >¿Activar Item?</v-card-title
            >
            <v-card-title class="headline" v-if="addAccion == 2"
              >Desactivar Item?</v-card-title
            >
            <v-card-text>
              Estas a punto de
              <span v-if="addAccion == 1">activar</span>
              <span v-if="addAccion == 2">desactivar</span>
              a {{ addNombre }}
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="cancel" @click="ActivarDesactivarCerrar()">
                Cancelar
              </v-btn>
              <v-btn v-if="addAccion == 1" color="success" @click="activar()">
                Activar
              </v-btn>
              <v-btn
                v-if="addAccion == 2"
                color="warning"
                @click="desactivar()"
              >
                Desactivar
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
      <template v-if="item.condicion">
        <v-icon small class="fas fa-ban" @click="ActivarDesactivar(2, item)">
        </v-icon>
      </template>
      <template v-else>
        <v-icon small class="fas fa-check" @click="ActivarDesactivar(1, item)">
        </v-icon>
      </template>
    </template>
    <template v-slot:no-data>
      <v-btn color="primary" @click="initialize">
        Reset
      </v-btn>
    </template>
    <template v-slot:[`item.condicion`]="{ item }">
      <v-chip :color="getColorCondicion(item.condicion)" dark>
        <div v-if="item.condicion"><span>Activo</span></div>
        <div v-else><span>Inactivo</span></div>
      </v-chip>
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
      { text: "Rol", value: "rol", sortable: false },
      { text: "Estado", align: "left", value: "condicion", sortable: false },
      { text: "Actions", value: "actions", sortable: false },
    ],
    id: "",
    idUsuario: 0,
    idRol: "",
    roles: [],
    nombre: "",
    telefono: "",
    correo: "",
    direccion: "",
    password: "",
    actPassword: false,
    passwordAnt: "",
    valida: 0,
    validaMensaje: [],
    addModal: 0,
    addAccion: 0,
    addNombre: "",
    addId: "",
  }),
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Nuevo Usuario" : "Editar Usuario";
    },
  },

  created() {
    this.initialize();
    this.select();
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
    select() {
      let me = this;
      var rolesArray = [];
      axios
        .get("api/Roles/Select")
        .then(function(response) {
          rolesArray = response.data;
          rolesArray.map(function(x) {
            me.roles.push({ text: x.nombre, value: x.idRol });
          });
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    crear() {
      let me = this;
      axios
        .post("api/Usuarios/Crear", {
          idRol: me.idRol,
          nombre: me.nombre,
          telefono: me.telefono,
          correo: me.correo,
          direccion: me.direccion,
          password: me.password,
        })
        .then(function(response) {
          me.initialize();
          me.cerrarDialog();
          me.limpiar();
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    actualizar() {
      if (this.validar()) {
        return;
      }
      let me = this;
      if (me.password != me.passwordAnt) {
        me.actPassword = true;
      }
      axios
        .put("api/Usuarios/Actualizar", {
          idUsuario: me.id,
          idRol: me.idRol,
          nombre: me.nombre,
          telefono: me.telefono,
          correo: me.correo,
          direccion: me.direccion,
          password: me.password,
          act_password: me.actPassword,
        })
        .then(function(response) {
          me.initialize();
          me.cerrarDialog();
          me.limpiar();
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    verDetalles(item) {
      this.id = item.idUsuario;
      this.idRol = item.idRol;
      this.nombre = item.nombre;
      this.telefono = item.telefono;
      this.correo = item.correo;
      this.direccion = item.direccion;
      this.password = item.password_hash;
      this.passwordAnt = item.password_hash;
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
      this.password = "";
      this.passwordAnt = "";
      this.editedIndex = -1;
    },
    cerrarDialog() {
      this.dialog = false;
      this.limpiar();
    },
    getColorCondicion(condicion) {
      if (condicion == true) {
        return "green";
      } else {
        return "red";
      }
    },
    validar() {
      this.valida = 0;
      this.validaMensaje = [];
      if (this.nombre <= 3) {
        this.validaMensaje.push("El nombre no debe ser menor a 3 digitos.");
      }
      if (!this.idRol) {
        this.validaMensaje.push("Seleccione un rol.");
      }
      if (!this.correo) {
        this.validaMensaje.push("Ingrese un email.");
      }
      if (!this.password) {
        this.validaMensaje.push("Ingrese una contraseña.");
      }
      if (this.validaMensaje.length) {
        this.valida = 1;
      }
      return this.valida;
    },
    ActivarDesactivar(accion, item) {
      this.addModal = 1;
      this.addNombre = item.nombre;
      this.addId = item.idUsuario;
      if (accion == 1) {
        this.addAccion = 1;
      } else if (accion == 2) {
        this.addAccion = 2;
      } else {
        this.addModal = 0;
      }
    },
    ActivarDesactivarCerrar() {
      this.addModal = 0;
    },
    activar() {
      let me = this;
      let header = { Authorization: "Bearer " + this.$store.state.token };
      let configuracion = { headers: header };
      axios
        .put("api/Usuarios/Activar/" + this.addId, {}, configuracion)
        .then(function(response) {
          me.addModal = 0;
          me.addAccion = 0;
          me.initialize();
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    desactivar() {
      let me = this;
      let header = { Authorization: "Bearer " + this.$store.state.token };
      let configuracion = { headers: header };
      axios
        .put("api/Usuarios/Desactivar/" + this.addId, {}, configuracion)
        .then(function(response) {
          me.addModal = 0;
          me.addAccion = 0;
          me.initialize();
        })
        .catch(function(error) {
          console.log(error);
        });
    },
  },
};
</script>
