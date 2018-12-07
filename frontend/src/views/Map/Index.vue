<template>
  <div>
    <v-layout>
      <section class="breadcumb-area bg-img d-flex align-items-center justify-content-center">
        <div class="bradcumbContent">
          <h2>MAP DEMO</h2>
        </div>
      </section>

    </v-layout>
  </div>
</template>

<script>
  import VLayout from '@/layouts/Default.vue';

  export default {
    name: 'MapIndex',

    /**
     * The components that the page can use.
     */
    components: {
      VLayout,
    },
    data() {
      return {}
    },
    methods: {},
    mounted() {
    }
  };
</script>

<style scoped>
  /*@import "../node_modules/leaflet/dist/leaflet.css";*/
  body {
    background-color: #e7d090;
    margin-left: 100px;
    margin-right: 100px;
  }

  #map {
    background-color: #eee;
  }
</style>
