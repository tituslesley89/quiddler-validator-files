<template>
  <v-container>
    <v-row class="text-center">
      <v-col md="6">
        <v-card class="pa-5">
          <v-text-field v-model="wordToSearch" label="Word" clearable @keyup.enter="checkWord"/>
          <v-btn block class="primary" @click="checkWord">Search</v-btn>
        </v-card>
      </v-col>
    </v-row>
    <v-row>
      <v-col md="6">
        <v-card class="pa-5">
          <v-progress-linear
            v-if="isLoading"
            indeterminate
            color="cyan"
          ></v-progress-linear>
          <div v-else-if="wordCheckResult">
            <v-banner v-if="wordCheckResult.isValid" color="green" rounded>
              Word is valid
            </v-banner>
            <v-banner v-else color="red" rounded>
              Word is invalid.
              <br />
              Reason: "{{ wordCheckResult.reason }}"
            </v-banner>
            <div class="pt-3" v-if="wordCheckResult.validDefinition && wordCheckResult.validDefinition.length">
              <v-divider></v-divider>
              <definitions-list :definitions="wordCheckResult.validDefinition" :is-invalid=false />
            </div>
            <div class="pt-3" v-if="wordCheckResult.invalidDefinition && wordCheckResult.invalidDefinition.length">
              <v-divider></v-divider>
              <definitions-list :definitions="wordCheckResult.invalidDefinition" :is-invalid=true />
            </div>
          </div>
          <div v-else-if="errorResponse">
            <v-banner color="red" rounded>
              Something went wrong :(
            </v-banner>
          </div>
          <div v-else>Nothing found</div>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";
import DefinitionsList from './DefinitionsList.vue';

export default {
  components: { DefinitionsList },
  name: "ValidateWord",

  data: () => ({
    wordToSearch: "",
    isLoading: false,
    errorResponse : false,
    baseUrl: "https://i02k5kt7hj.execute-api.us-east-1.amazonaws.com/prod",
    wordCheckResult: undefined,
  }),
  methods: {
    checkWord() {
      if (this.wordToSearch) {
        this.isLoading = true;
        this.errorResponse = false;
        this.wordCheckResult = undefined;
        axios
          .get(`${this.baseUrl}/validate/${this.wordToSearch}`)
          .then((response) => {
            this.wordCheckResult = response.data;
          })
          .catch((error) => {
            console.error(error);
            this.errorResponse = true;
          })
          .finally(() => {
            this.isLoading = false;
          });
      }
    },
  },
};
</script>

