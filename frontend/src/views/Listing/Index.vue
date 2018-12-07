<template>
  <div>
    <v-layout>
      <section class="breadcumb-area bg-img d-flex align-items-center justify-content-center">
        <div class="bradcumbContent">
          <h2>Single Listing DEMO</h2>
        </div>
      </section>

      <!--Curated list area-->
      <section class="rooms-area section-padding-100-0">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-12 col-lg-6">
              <div class="section-heading text-center">
                <div class="line-"/>
                <h2>Single Listing</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris
                  sceleri sque, at rutrum nulla dictum. Ut ac ligula sapien.</p>
              </div>
            </div>
          </div>

          <div class="row justify-content-center">

            <!-- Single Rooms Area -->

          </div>
        </div>
      </section>
      <!--Curated list area ends-->

    </v-layout>
  </div>
</template>

<script>
  import VLayout from '@/layouts/Default.vue';
  import VContact from '@/components/Contact.vue';

  export default {
    name: 'ListingIndex',

    /**
     * The components that the page can use.
     */
    components: {
      VLayout,
    },
    data() {
      return {
      };
    },
    methods: {
      scrollBehavior() {
        window.scrollTo(0, 0);
      },

    },
    mounted() {
      this.scrollBehavior();
    }
  };
</script>

<style scoped>
  .breadcumb-area {
    background-image: url("../../assets/carousel/countryside-dawn.jpg");
  }

</style>
