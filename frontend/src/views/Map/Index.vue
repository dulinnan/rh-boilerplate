<template>
  <div>
    <v-layout>
      <section class="breadcumb-area bg-img d-flex align-items-center justify-content-center">
        <div class="bradcumbContent">
          <h2>MAP DEMO</h2>
        </div>
      </section>

      <section class="contact-area d-flex flex-wrap align-items-center mb-100">
        <div class="region-map-area">
          <div id="newzealand" style="width: 100%; height: 100%;"></div>
        </div>

        <div class="contact-info">
          <div class="section-heading wow fadeInUp" data-wow-delay="100ms">
            <div class="line-"></div>
            <h2 v-if="regionCode == 0">Please click on the map</h2>
            <h2 v-if="regionCode !== 0">{{regionTitle}}</h2>
            <!--<h2 v-if="regionCode != 0">{{regionFetched[regionCode-1]['region_title']}}</h2>-->
            <!--<p v-if="regionCode != 0">{{regionFetched[regionCode-1]['region_description']}}</p>-->
          </div>
          <div class="single-contact-information">
            <!-- Single Contact Information -->
            <div class="contact-content d-flex" v-if="regionCode !== 0 && regionCode !== 7">
              <router-link :to="{name:'listings.index', query: { region: regionCode}}">
                <button class="btn rh-btn mt-15">Browse listings</button>
              </router-link>
            </div>
          </div>

        </div>
      </section>

      <!--<div id="newzealand" style="width: 600px; height: 600px;"></div>-->



    </v-layout>
  </div>
</template>

<script>
  import VLayout from '@/layouts/Default.vue';
  import $ from 'jquery';

  window.jQuery = require('jquery');
  require('jvectormap-next');
  require("../../assets/jquery-jvectormap-nz-mill");
  export default {
    name: 'MapIndex',

    /**
     * The components that the page can use.
     */
    components: {
      VLayout,
    },
    data() {
      // let regionDesc = this.regionFetched[regionCode-1]['region_description'];
      return {
        regionTitleLookup: {
          "NZ-NSN": "Nelson City",
          "NZ-STL": "Southland",
          "NZ-HKB": "Hawke's Bay",
          "NZ-BOP": "Bay of Plenty",
          "NZ-AUK": "Auckland",
          "NZ-TKI": "Taranaki",
          "NZ-MBH": "Marlborough District",
          "NZ-TAS": "Tasman District",
          "NZ-CIT": "Chatham Islands Territory",
          "NZ-WKO": "Waikato",
          "NZ-WTC": "West Coast",
          "NZ-OTA": "Otago",
          "NZ-NTL": "Northland",
          "NZ-MWT": "Manawatu-Wanganui",
          "NZ-WGN": "Wellington",
          "NZ-GIS": "Gisborne District",
          "NZ-CAN": "Canterbury"
        },
        regionCodeLookup: {
          "NZ-NSN": 10,
          "NZ-STL": 17,
          "NZ-HKB": 5,
          "NZ-BOP": 4,
          "NZ-AUK": 2,
          "NZ-TKI": 7,
          "NZ-MBH": 11,
          "NZ-TAS": 0,
          "NZ-CIT": 0,
          "NZ-WKO": 3,
          "NZ-WTC": 12,
          "NZ-OTA": 15,
          "NZ-NTL": 1,
          "NZ-MWT": 6,
          "NZ-WGN": 9,
          "NZ-GIS": 0,
          "NZ-CAN": 13
        },
        regionTitle: '',
        regionCode: 0,
        regionFetched: [],
        regionDesc: ''
      }
    },
    methods: {
      initMap() {
        let vm = this;
        $('#newzealand').vectorMap({
          map: 'nz_mill',
          backgroundColor: "#61B3DE",
          focusOn: {
            x: 0.1,
            y: 0.7,
            scale: 3
          },
          zoomMix: 3,
          zoomOnScroll: false,
          normalizeFunction: 'polynomial',
          regionsSelectable: true,
          regionsSelectableOne: true,
          onRegionClick: function (e, code) {
            vm.regionTitle = vm.regionTitleLookup[code];
            vm.regionCode = vm.regionCodeLookup[code];
          }

        });
      },
      getRegions: function () {
        this.regionFetched = [];
        this.$http.get('regions')
          .then(response => {
            this.regionFetched = response.data;
            console.log(this.regionFetched);
          }).catch(error => {
          console.log(error);
        });
      },
    },
    mounted() {
      this.getRegions();
      this.initMap();
    },
  };
</script>

<style scoped>
  @import "../../assets/stylus/css/jquery-jvectormap-2.0.3.css";
  /*body {*/
  /*background-color: #e7d090;*/
  /*margin-left: 100px;*/
  /*margin-right: 100px;*/
  /*}*/

  .breadcumb-area {
    background-image: url("../../assets/carousel/countryside-dawn.jpg");
  }

  .contact-area {
    position: relative;
    /*z-index: 1;*/
  }

  .contact-area .region-map-area {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 50%;
    flex: 0 0 50%;
    max-width: 50%;
    width: 50%;
    height: 685px;
  }

  @media only screen and (max-width: 767px) {
    .contact-area .region-map-area {
      -webkit-box-flex: 0;
      -ms-flex: 0 0 100%;
      flex: 0 0 100%;
      max-width: 100%;
      width: 100%;
      height: 450px;
    }
  }
</style>
