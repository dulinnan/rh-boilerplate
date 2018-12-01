<template>
  <div>
    <v-layout>
      <section class="breadcumb-area bg-img d-flex align-items-center justify-content-center">
        <div class="bradcumbContent">
          <h2>DEMO</h2>
        </div>
      </section>

      <!--Curated list area-->
      <section class="rooms-area section-padding-100-0">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-12 col-lg-6">
              <div class="section-heading text-center">
                <div class="line-"/>
                <h2>Curated List</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris
                  sceleri sque, at rutrum nulla dictum. Ut ac ligula sapien.</p>
              </div>
            </div>
          </div>

          <div class="row justify-content-center">

            <!-- Single Rooms Area -->
            <div
              v-for="location in featuredLocations"
              class="col-12 col-md-6 col-lg-4 ">
              <div
                class="single-rooms-area wow fadeInUp"
                data-wow-delay="100ms">
                <!-- Thumbnail -->
                <div
                  :style="{ 'background-image': 'url(' + location.src + ')' }"
                  class="bg-thumbnail bg-img"/>
                <!-- Price -->
                <p class="price-from">From ${{ location.price }}/night</p>
                <!-- Rooms Text -->
                <div class="rooms-text">
                  <div class="line"/>
                  <h4>{{ location.name }}</h4>
                  <p>{{ location.info }}</p>
                </div>
                <!-- Book Room -->
                <a
                  href="#"
                  class="book-room-btn btn rh-btn">Book a stay</a>
              </div>
            </div>


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
    name: 'ContactIndex',

    /**
     * The components that the page can use.
     */
    components: {
      VLayout,
      VContact,
    },
    data() {
      return {
        featuredLocations: [
          {
            name: 'MATAMATA, WAIKATO',
            info: 'Matamata is a rural town nestled at the base of the scenic Kaimai Ranges',
            src: require('../../assets/featuredLocation/matamata.jpeg'),
            price: '999',
          },
          {
            name: 'ROTORUA, BAY OF PLENTY',
            info: 'Rotorua is a lake shore town and is at the heart of the North Island',
            src: require('../../assets/featuredLocation/rotorua.jpeg'),
            price: '888',
          },
          {
            name: 'FAIRLIE, CANTERBURY',
            info: 'Fairlie is a typical New Zealand rural town and a gateway to the MacKenzie Region',
            src: require('../../assets/featuredLocation/fairlie.jpg'),
            price: '777',
          },
        ],
      };
    },
    methods: {
      scrollBehavior() {
        window.scrollTo(0, 0);
      }
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
