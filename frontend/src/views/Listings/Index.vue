<template>
  <div>
    <v-layout>
      <section class="breadcumb-area bg-img d-flex align-items-center justify-content-center">
        <div class="bradcumbContent">
          <h2>{{regionName}}</h2>
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
                  :style="{ 'background-image': 'url(' + picDemo + ')' }"
                  class="bg-thumbnail bg-img"/>
                <!-- Price -->
                <p class="price-from">From ${{ location.reservePrice }}/night</p>
                <p>{{location.description}}</p>
                <!-- Rooms Text -->
                <div class="rooms-text">
                  <div class="line"/>
                  <h4>{{ location.location }}</h4>
                  <!--<p>{{ location.info }}</p>-->
                </div>
                <!-- Book Room -->
                <router-link
                  :to="{name:'listing.index', params:{ listingId: location.id}}"
                  class="book-room-btn btn rh-btn"><a>View Details</a></router-link>
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
  // import {AxiosInstance as axios} from "axios";

  export default {
    name: 'ListingsIndex',

    /**
     * The components that the page can use.
     */
    components: {
      VLayout,
    },
    data() {
      return {
        regionName: 'Upcoming',
        featuredLocations: [],
        picDemo: require('../../assets/featuredLocation/rotorua.jpeg'),
      };
    },
    methods: {
      scrollBehavior() {
        window.scrollTo(0, 0);
      },
      getListings: function () {
        // this.featuredLocations = [];
        this.$http.get('listings', {params: {'region-id': this.$route.query['region']}})
          .then(response => {
            this.featuredLocations = response.data;
            this.regionName = this.featuredLocations[0]['region'];
          }).catch(error => {
          console.log(error);
        });
      },

    },
    mounted() {
      this.getListings();
      // this.scrollBehavior();
    }
  };
</script>

<style scoped>
  .breadcumb-area {
    background-image: url("../../assets/carousel/countryside-dawn.jpg");
  }

</style>
