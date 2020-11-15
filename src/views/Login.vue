<template>
  <v-container>
    <v-row no-gutters justify="center" align="center" class="mt-12 pt-12">
      <v-card width="400px" >
        <v-toolbar flat dark color="blue darken-3">
          <v-toolbar-title class="mx-auto">
            INICIO DE SESION
          </v-toolbar-title>
        </v-toolbar>

        <v-card-text>
          <v-text-field
            v-model="correo"
            autofocus
            label="Usuario"
            prepend-icon="fas fa-user"
            required
          >
          </v-text-field>
          <v-text-field
            v-model="password"
            label="Contraseña"
            prepend-icon="fas fa-key"
            :append-icon="show1 ? 'fas fa-eye' : 'fas fa-eye-slash'"
            :type="show1 ? 'text' : 'password'"
            @click:append="show1 = !show1"
            required
            @keyup.enter="ingresar"
          >
          </v-text-field>
          <v-flex class="red--text" v-if="error">
            {{ error }}
          </v-flex>
        </v-card-text>

        <v-card-actions class="px-3 pb-3">
          <v-btn @click="ingresar" color="primary" class="mx-auto" block
            >Ingresar</v-btn
          >
        </v-card-actions>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      correo: "",
      password: "",
      error: null,
      show1: false,
    };
  },
  methods: {
    ingresar() {
      this.error = null;
      axios
        .post("api/Usuarios/Login", {
          correo: this.correo,
          password: this.password,
        })
        .then((respuesta) => {
          return respuesta.data;
        })
        .then((data) => {
          this.$store.dispatch("guardarToken", data.token);
          this.$router.push({ name: "Expediente" });
        })
        .catch((err) => {
            if (err.response.status == 400) {
              this.error = "No es un correo valido.";
            } else if (err.response.status == 404) {
              this.error = "No existe correo o contraseña incorrecta";
            } else {
              this.error = "Ocurrio un error";
            }
        });
    },
  },
};
</script>

<style>
.container {
  padding: 0;
}
.color {
  background: #00d2ff;
  background: -webkit-linear-gradient(to right, #3a7bd5, #00d2ff);
  background: linear-gradient(to right, #3a7bd5, #00d2ff);
}
</style>
