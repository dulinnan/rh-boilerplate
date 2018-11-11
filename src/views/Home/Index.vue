<template>
  <div>
    <v-layout>
      <div>
        <!--Carousel header area-->
        <div class="head-carousel">
          <b-carousel id="carousel1"
                      style="text-shadow: 1px 1px 2px #333"
                      img-width="1024"
                      img-height="480"
                      :interval="4000"
                      v-model="slide"
                      @sliding-start="onSlideStart"
                      @sliding-end="onSlideEnd">

            <!-- Slides with custom text -->
            <b-carousel-slide v-for="carouselImg in carouselImgs">
              <img slot="img" class="d-block w-100" width="1024" height="480"
                   :src="carouselImg.src" :alt="carouselImg.name" style="object-fit: cover;">
              <div class="container">
                <div class="row justify-content-center">
                  <div class="col-12 col-lg-9">
                    <!-- Slide Content -->
                    <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                      <div class="line" data-animation="fadeInUp" data-delay="300ms"></div>
                      <h2 data-animation="fadeInUp" data-delay="500ms">{{carouselImg.name}}</h2>
                      <p data-animation="fadeInUp" data-delay="700ms">{{carouselImg.info}}</p>
                      <a href="#" class="btn rh-btn mt-30" data-animation="fadeInUp" data-delay="900ms">Read
                        More</a>

                    </div>
                    <h2 class="narrow-tittle">RuralHolidays</h2>
                  </div>
                </div>
              </div>
            </b-carousel-slide>
          </b-carousel>
        </div>
        <!--Carousel header area ends-->

        <!-- ##### About Us Area Start ##### -->
        <section class="about-us-area section-padding-100">
          <div class="container">
            <div class="row align-items-center">
              <div class="col-12 col-lg-6">
                <div class="about-text text-center mb-100">
                  <div class="section-heading text-center">
                    <div class="line-"></div>
                    <h2>A place to remember</h2>
                  </div>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris
                    sceleri sque, at rutrum nulla dictum. Ut ac ligula sapien. Suspendisse cursus faucibus finibus.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
                  <div class="about-key-text">
                    <h6><span class="iconfont icon-check"></span> Donec malesuada lorem maximus mauris sceleri</h6>
                    <h6><span class="iconfont icon-check"></span> Malesuada lorem maximus mauris sceleri</h6>
                    <h6><span class="iconfont icon-check"></span> At vero eos et accusamus et iusto odio dignissimos</h6>
                  </div>
                  <a href="#" class="btn rh-btn mt-50">Read More</a>
                </div>
              </div>

              <div class="col-12 col-lg-6">
                <div class="about-thumbnail homepage mb-100">
                  <!-- First Img -->
                  <div class="first-img wow fadeInUp" data-wow-delay="100ms">
                    <img src="../../assets/discoverFeature/group-tour.jpg" alt="">
                  </div>
                  <!-- Second Img -->
                  <div class="second-img wow fadeInUp" data-wow-delay="300ms">
                    <img src="../../assets/discoverFeature/guitar.jpg" alt="">
                  </div>
                  <!-- Third Img-->
                  <div class="third-img wow fadeInUp" data-wow-delay="500ms">
                    <img src="../../assets/discoverFeature/about-us.jpg" alt="">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- ##### About Us Area End ##### -->

        <!-- ##### Pool Area Start ##### -->
        <section class="pool-area section-padding-100-70 bg-img bg-fixed">
          <div class="container">
            <div class="row justify-content-end">
              <div class="col-12 col-lg-7">
                <div class="pool-content text-center wow fadeInUp" data-wow-delay="300ms">
                  <div class="section-heading text-center white">
                    <div class="line-"></div>
                    <h2>Poop Pool</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris
                      sceleri sque, at rutrum nulla dictum. Ut ac ligula sapien. Suspendisse cursus faucibus finibus.
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris
                      sceleri sque, at rutrum nulla dictum.</p>
                  </div>

                  <div class="row">
                    <div class="col-12 col-sm-4">
                      <div class="pool-feature">
                        <i class="iconfont icon-lvyouchengshijianzhucity-nongminfarmer"></i>
                        <p>Poop Beachbar</p>
                      </div>
                    </div>
                    <div class="col-12 col-sm-4">
                      <div class="pool-feature">
                        <i class="iconfont icon-sheep"></i>
                        <p>Infinity Poop</p>
                      </div>
                    </div>
                    <div class="col-12 col-sm-4">
                      <div class="pool-feature">
                        <i class="iconfont icon-nongyaohuafei"></i>
                        <p>Sunpoops</p>
                      </div>
                    </div>
                  </div>
                  <!-- Button -->
                  <a href="#" class="btn rh-btn mt-50">Read More</a>
                </div>
              </div>
            </div>
          </div>
        </section>


        <!--Curated list area-->
        <section class="rooms-area section-padding-100-0">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-12 col-lg-6">
                <div class="section-heading text-center">
                  <div class="line-"></div>
                  <h2>Curated List</h2>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris
                    sceleri sque, at rutrum nulla dictum. Ut ac ligula sapien.</p>
                </div>
              </div>
            </div>

            <div class="row justify-content-center">

              <!-- Single Rooms Area -->
              <div class="col-12 col-md-6 col-lg-4 " v-for="location in featuredLocations">
                <div class="single-rooms-area wow fadeInUp" data-wow-delay="100ms">
                  <!-- Thumbnail -->
                  <div class="bg-thumbnail bg-img"
                       v-bind:style="{ 'background-image': 'url(' + location.src + ')' }"></div>
                  <!-- Price -->
                  <p class="price-from">From ${{location.price}}/night</p>
                  <!-- Rooms Text -->
                  <div class="rooms-text">
                    <div class="line"></div>
                    <h4>{{location.name}}</h4>
                    <p>{{location.info}}</p>
                  </div>
                  <!-- Book Room -->
                  <a href="#" class="book-room-btn btn rh-btn">Book a stay</a>
                </div>
              </div>

            </div>
          </div>
        </section>
        <!--Curated list area ends-->

        <!--Video group area-->
        <!--<div class="video-group">-->
        <!--<div class="container container&#45;&#45;md text">-->
        <!--<div class="row">-->
        <!--<div class="col-xs-9 col-md-7">-->
        <!--<div class="embed-responsive embed-responsive-16by9">-->
        <!--<iframe src="//player.vimeo.com/video/293373689"></iframe>-->
        <!--</div>-->
        <!--</div>-->
        <!--<div class="col-xs-3 col-md-5">-->
        <!--<h1>{{videoPara.title}}</h1>-->
        <!--<p>{{videoPara.body}}</p>-->
        <!--<button type="button" class="btn-blue">Booking Request</button>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->
        <!--Video group area ends-->



      </div>
      <v-contact> </v-contact>
    </v-layout>
  </div>
</template>

<script>
  /* ============
   * Home Index Page
   * ============
   *
   * The home index page.
   */

  import VLayout from '@/layouts/Default.vue';
  import VContact from '@/components/Contact.vue';

  export default {
    /**
     * The name of the page.
     */
    name: 'HomeIndex',

    /**
     * The components that the page can use.
     */
    components: {
      VLayout,
      VContact,
    },
    data() {
      return {
        slide: 0,
        sliding: null,
        carouselImgs: [
          {
            name: 'calf',
            src: require('../../assets/carousel/calf.jpg'),
            info: 'THIS IS A CALF'
          },
          {
            name: 'farmer',
            src: require('../../assets/carousel/farmer.jpg'),
            info: 'THIS IS A FARMER'
          },
          {
            name: 'blue',
            src: require('../../assets/carousel/blue.jpg'),
            info: 'THIS IS A BLUE FEMALE'
          },
          {
            name: 'sheep',
            src: require('../../assets/carousel/sheep.jpg'),
            info: 'SHEEEEEEEPA'
          },
          {
            name: 'calves',
            src: require('../../assets/carousel/calves.jpg'),
            info: 'CALVES. EDIBLE'
          },
          {
            name: 'pumpkin',
            src: require('../../assets/carousel/pumpkin.jpg'),
            info: 'HALLOWEENS OVER'
          },
          {
            name: 'boyAndDuck',
            src: require('../../assets/carousel/boy-and-duck.jpeg'),
            info: 'BOI AND DUCKY'
          },
        ],
        introductionPara: {
          title: 'Sharing the people that make New Zealand unique',
          body: 'New Zealand is world famous for kind hospitality, friendliness, and a beautiful clean green ' +
            'environment. Rural Tours offers you the chance to enjoy an authentic experience with local ' +
            'New Zealand people. In addition to being New Zealand\'s largest farmstay reservations company, ' +
            'we offer New Zealand lifestyle experiences, home visits with morning/afternoon tea or lunch; ' +
            'technical visits for special interest groups; and specialist programmes for student group tours.',
        },
        featuredLocations: [
          {
            name: 'MATAMATA, WAIKATO',
            info: 'Matamata is a rural town nestled at the base of the scenic Kaimai Ranges',
            src: require('../../assets/featuredLocation/matamata.jpeg'),
            price: '999'
          },
          {
            name: 'ROTORUA, BAY OF PLENTY',
            info: 'Rotorua is a lake shore town and is at the heart of the North Island',
            src: require('../../assets/featuredLocation/rotorua.jpeg'),
            price: '888'
          },
          {
            name: 'FAIRLIE, CANTERBURY',
            info: 'Fairlie is a typical New Zealand rural town and a gateway to the MacKenzie Region',
            src: require('../../assets/featuredLocation/fairlie.jpg'),
            price: '777'
          },
        ],
        videoPara: {
          title: 'Your Opportunity to experience real rural life in New Zealand. Sharing the people that make New Zealand unique.',
          body: 'Please feel free to view Rural Tours promotional video to gain insight into what we have to offer you.',
        },
        discoverFeatures: [
          {
            name: 'Farmstays',
            info: 'A Rural Holidays Farmstay offers a unique opportunity for you to enjoy the hospitality of friendly New Zealanders in the comfort of their homes.',
            src: require('../../assets/discoverFeature/guitar.jpg')
          },
          {
            name: 'Group Tour',
            info: 'Rural Holidays handles a large number of group tour farmstay bookings. Unlike some countries that offer one large \'ranch\' with commercial accommodation on-site, Rural Tours offers accommodation on individual farms for groups of 10-300 people.',
            src: require('../../assets/discoverFeature/group-tour.jpg')
          },
          {
            name: 'About Us',
            info: 'Today, Rural Holidays is the only original one owner operated company in the New Zealand farm and country home stay market since establishment in 1983.',
            src: require('../../assets/discoverFeature/about-us.jpg')
          },
        ],

      };
    },
    methods: {
      onSlideStart(slide) {
        this.sliding = true;
      },
      onSlideEnd(slide) {
        this.sliding = false;
      },
      logImgPath: function () {
        const lenOfCarousel = this.carouselImgs.length;
        for (var i = 0; i < lenOfCarousel; i++) {
          console.log(this.carouselImgs[i].src);
        }
      }
    },
    mounted() {
      // this.logImgPath();
    },

  };
</script>

<style>
  @media only screen and (min-width: 540px) and (max-width: 1024px) {
    .hero-slides-content {
      background-color: rgba(0, 0, 0, 0.4);
      border: 2px solid #EE6123;
      padding: 40px 30px;
      margin-bottom: 2rem;
    }

    .narrow-tittle {
      display: none;
    }

    .head-carousel::before {
      background: url(../../assets/img/sprite.png) no-repeat;
      background-position: top left;
      width: 367px;
      max-width: 100%;
      height: 26px;
      z-index: 2;
      content: '';
      position: absolute;
      right: 0rem;
      display: block;
      pointer-events: none;
      overflow: hidden
    }

  }

  @media only screen and (min-width: 1024px) {
    .hero-slides-content {
      background-color: rgba(0, 0, 0, 0.4);
      border: 2px solid #EE6123;
      padding: 40px 30px;
      margin-bottom: 6rem;
    }

    .narrow-tittle {
      display: none;
    }

    .head-carousel::before {
      background: url(../../assets/img/sprite.png) no-repeat;
      background-position: top left;
      width: 367px;
      max-width: 100%;
      height: 26px;
      z-index: 2;
      content: '';
      position: absolute;
      right: 0rem;
      display: block;
      pointer-events: none;
      overflow: hidden
    }
  }

  @media only screen and (max-width: 440px) {
    .hero-slides-content {
      display: none;
    }

    .head-carousel {
      margin-top: 45px;
    }

    .head-carousel::before {
      display: none;
    }

    .narrow-tittle {
      position: relative;
      z-index: 1;
      /*font-size: 4rem;*/
      color: #ffffff;
      margin-bottom: 1rem;
      display: inline-block;
      background-color: rgba(0, 0, 0, 0.4);
      border: 2px solid #EE6123;
      padding: 1rem;
    }

  }

  .hero-slides-content .line {
    width: 90px;
    height: 2px;
    background-color: #EE6123;
    margin: 0 auto 30px;
  }

  .hero-slides-content h2 {
    position: relative;
    z-index: 1;
    font-size: 4rem;
    color: #ffffff;
    margin-bottom: 0;
    display: inline-block;
  }

  .hero-slides-content p {
    color: #ffffff;
  }

  .pool-area {
    background-image: url("../../assets/carousel/road.jpg");
  }

</style>

