<template lang="html">
  <div>
    <v-menu>
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          color="red"
          v-bind="attrs"
          v-on="on"
        >
          Admin
        </v-btn>
      </template>
      <v-list dense>
        <v-list-item-group color="primary">
          <v-list-item @click="showCategoryDialog"> <v-list-item-title> Toggle Category </v-list-item-title> </v-list-item>
          <v-list-item @click="showWordDialog"> <v-list-item-title> Toggle Word </v-list-item-title> </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-menu>
  </div>
</template>

<script lang="js">

  export default  {
    name: 'admin-button',
    props: [],
    mounted () {

    },
    data () {
      return {

      }
    },
    methods: {
      showCategoryDialog () {
        this.$emit('showCategoryDialog')
      },
      showWordDialog () {
        this.$emit('showWordDialog')
      }
    },
    computed: {

    }
}


</script>

<style scoped lang="scss">
.admin-button {
}
</style>
