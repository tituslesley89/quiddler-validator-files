<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
    >
      <div class="d-flex align-center">
        <h1>Quiddler Word Checker</h1>
      </div>

      <v-spacer></v-spacer>
    </v-app-bar>

    <v-main>
      <ValidateWord/>
    </v-main>
  </v-app>
</template>

<script>
import ValidateWord from './components/ValidateWord';

export default {
  name: 'App',

  components: {
    ValidateWord,
  },

  data: () => ({
    //
  }),
};
</script>
