<template lang="html">
  <v-list two-line subheader>
  <h3>{{isInvalid?"INVALID":"VALID"}} DEFINITIONS</h3>
    <v-list-item
      v-for="item in definitions"
      :key="item.definition.meta.id"
    >
    <v-list-item-content>
      <v-list-item-title>
        {{ item.definition.meta.id }}
      </v-list-item-title>
      <v-list-item-subtitle>
        Category: {{ item.definition.fl }} <br />
        {{ isInvalid?`Reason: ${item.reason}`:"" }} <br />
        <div v-for="(def, i) in item.definition.shortdef" :key="def">
          {{ i + 1 }}. {{ def }} 
        </div>
      </v-list-item-subtitle>
    </v-list-item-content>
    </v-list-item>
  </v-list>
</template>

<script lang="js">

  export default  {
    name: 'definitions-list',
    props: {
        definitions : {
          type : Array,
          default () {
            return [];
          }
        },
        isInvalid : {
          type : Boolean,
          default : false
        }
    },
    mounted () {

    },
    data () {
      return {

      }
    },
    methods: {

    },
    computed: {

    }
}


</script>

<style scoped lang="scss">
.definitions-list {
}
</style>
