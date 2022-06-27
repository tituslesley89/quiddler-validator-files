<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
    >
      <div class="d-flex align-center">
        <h3>Scrabble Word Checker</h3>
      </div>

      <v-spacer></v-spacer>
      <admin-button class="pa-5" @showCategoryDialog="showCategoryDialog" @showWordDialog="showWordDialog"/>
      <v-menu offset-y>
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          color="cyan"
          v-bind="attrs"
          v-on="on"
        >
          Info
        </v-btn>
      </template>
      <v-card class="pa-2 ma-0"> This website is powered by the Merriam-Webster dictionary. The search engine validates the word based on a list of exception words
        and categories saved on this application.<br>

        The word is searched in Merriam-Webster, then the returned defintitions are sorted into valid/invalid based on their Categories. If a word 
        is part of the exception word list, it is invalid, regardless of whether they have valid definitions. If a word does not have any valid definitions
        then it is also considered invalid.
      </v-card>
    </v-menu>
    </v-app-bar>

    <v-main>
      <ValidateWord/>
    </v-main>
    <word-toggle-dialog ref="wordDialog" :is-category=false />
    <word-toggle-dialog ref="categoryDialog" :is-category=true />

    <head>
      <meta charset="utf-8">
        <link rel="shortcut icon" type="image/png" href="/static/favicon.png"/>
    </head>

  </v-app>
</template>

<script>
import ValidateWord from './components/ValidateWord';
import AdminButton from './components/AdminButton';
import WordToggleDialog from "./components/WordToggleDialog.vue";

export default {
  name: 'App',

  components: {
    ValidateWord,
    AdminButton,
    WordToggleDialog
  },

  data: () => ({
    //
  }),
  methods: {
    showCategoryDialog () {
      this.$refs.categoryDialog.showDialog();
    },
    showWordDialog () {
      this.$refs.wordDialog.showDialog();
    }
  },
  mounted () {
    document.title = 'Scrabble Word Checker'
  }
};
</script>
