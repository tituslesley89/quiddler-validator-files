<template lang="html">
  <v-overlay z-index=1000 :value="isShown">
    <v-card>
      <v-card-title>
        <span class="text-h5">{{isCategory?"Toggle Category":"Toggle Word"}}</span>
      </v-card-title>
      <v-card-text>
        <v-container>
          <v-form ref="form" v-model="valid" lazy-validation>
            <v-row>
              <v-text-field 
              label="Access Key"
              v-model="accessKey"
              :rules="requiredRule"
              :type="showPassword ? 'text' : 'password'"
              :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
              @click:append="showPassword = !showPassword"
              required/>
            </v-row>
            <v-row>
              <v-text-field
              :label="entityLabel"
              v-model="entity"
              :rules="requiredRule"
              required/>
            </v-row>
            <v-row v-if="isLoading">
              <v-progress-linear
              indeterminate
              color="cyan"/>
            </v-row>
            <v-row v-if="statusCode">
              <v-banner :color="statusCode===200?'green':'red'" rounded>
                StatusCode: {{statusCode}}
              </v-banner>
            </v-row>
          </v-form>
        </v-container>
      </v-card-text>
      <v-card-actions>
        <v-btn color="blue" text @click="hideDialog">
          Close
        </v-btn>
        <v-btn color="blue" text @click="resetForm">
          Reset
        </v-btn>
        <v-spacer/>
        <v-btn color="blue" text @click="sendRequest" :disabled="requestSent">
          Submit
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-overlay>
</template>

<script lang="js">
import axios from "axios";

  export default  {
    name: 'WordToggleDialog',
    props: {
      isCategory : {
        type : Boolean,
        default : false
      }
    },
    data () {
      return {
        isShown : false,
        accessKey : "",
        entity: "",
        statusCode : undefined,
        requestSent : false,
        isLoading : false,
        valid : false,
        showPassword : false,
        baseUrl: "https://i02k5kt7hj.execute-api.us-east-1.amazonaws.com/prod",
        requiredRule: [
          v => !!v || 'Required'
        ]
      }
    },
    methods: {
      showDialog () {
        this.isShown = true;
      },
      hideDialog () {
        this.isShown = false;
        this.accessKey = "";
        this.entity = "";
        this.statusCode = undefined;
        this.requestSent = false;
      },
      sendRequest () {
        if(this.$refs.form.validate()) {
          this.isLoading = true;
          this.requestSent = true;
          const url = this.isCategory?`${this.baseUrl}/exception/category/${this.entity}/${this.accessKey}`:
            `${this.baseUrl}/exception/word/${this.entity}/${this.accessKey}`;
          
          axios.post(url)
          .then((response) => {
            this.statusCode = response.status;
          })
          .catch((error) => {
            this.statusCode = error.response.status
          })
          .finally(()=> {
            this.isLoading = false;
          })
        }
      },
      resetForm () {
        this.$refs.form.reset();
      }
    },
    computed: {
      entityLabel () {
        return this.isCategory?"Category":"Word"
      }
    }
}

</script>

<style scoped lang="scss">
  .word-toggle-dialog {

  }
</style>
