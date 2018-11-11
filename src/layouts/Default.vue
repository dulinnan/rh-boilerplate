<template>
  <div>
    <header class="header-area">
      <nav class="navbar navbar-expand-lg navbar-dark">
        <!--<div class="center-me-when-desktop">-->
        <router-link
          :to="{ name: 'home.index' }"
          class="navbar-brand"
        >
          <img
            src="../assets/logo/logo_rural_holidays.png"
            alt=""
            class="big-logo">
          <img
            src="../assets/logo/logo_transparent_orange.png"
            alt=""
            class="small-logo">

        </router-link>

        <button
          class="navbar-toggler"
          type="button"
          @click="toggleMenu">
          <span class="navbar-toggler-icon"/>
        </button>

        <div
          :class="{ show : menuCollapsed}"
          class="collapse navbar-collapse"

        >
          <ul class="navbar-nav">
            <router-link
              :to="{ name: 'home.index' }"
              active-class="active"
              class="nav-item"
              tag="li"
              exact
            >
              <a class="nav-link">
                Home
              </a>
            </router-link>

            <li
              class="nav-item dropdown"
              active-class="active">
              <a
                id="navbarDropdown"
                class="nav-link dropdown-toggle"
                href="#"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false">
                NZ Farmstays
              </a>
              <div
                class="dropdown-menu"
                aria-labelledby="navbarDropdown">
                <a
                  class="dropdown-item"
                  href="#">Our Listings</a>
                <a
                  class="dropdown-item"
                  href="#">Booking Conditions</a>
                <a
                  class="dropdown-item"
                  href="#">Reservation & Booking Info</a>
                <a
                  class="dropdown-item"
                  href="#">Booking Form</a>
                <a
                  class="dropdown-item"
                  href="#">Pricing</a>
                <div class="dropdown-divider"/>
                <a
                  class="dropdown-item"
                  href="#">Guest Response</a>
              </div>
            </li>

            <li
              class="nav-item dropdown"
              active-class="active">
              <a
                id="navbarDropdown"
                class="nav-link dropdown-toggle"
                href="#"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false">
                Group Tour
              </a>
              <div
                class="dropdown-menu"
                aria-labelledby="navbarDropdown">
                <a
                  class="dropdown-item"
                  href="#">North Island</a>
                <a
                  class="dropdown-item"
                  href="#">South Island</a>
                <div class="dropdown-divider"/>
                <a
                  class="dropdown-item"
                  href="#">Technical & Special Interest</a>
              </div>
            </li>

            <li
              :class="{ 'active': isAboutUsActive }"
              class="nav-item dropdown">
              <a
                id="navbarDropdown"
                class="nav-link dropdown-toggle"
                href="#"
                role="button"
                aria-haspopup="true"
                aria-expanded="false">
                About Us
              </a>
              <div
                class="dropdown-menu"
                aria-labelledby="navbarDropdown">
                <a
                  class="dropdown-item"
                  href="#/about-us">Our Story</a>
                <a
                  class="dropdown-item"
                  href="#">Become a host</a>
                <a
                  class="dropdown-item"
                  href="#">Terms & Conditons</a>
                <a
                  class="dropdown-item"
                  href="#">Trade Info</a>
              </div>
            </li>

            <router-link
              :to="{ name: 'contact.index' }"
              active-class="active"
              class="nav-item"
              tag="li"
              exact
            >
              <a class="nav-link">
                Contact Us
              </a>
            </router-link>
          </ul>
          <div class="menu-btn">
            <a
              href="#"
              class="btn rh-btn">Booking Request</a>
          </div>
        </div>


      </nav>


    </header>


    <div>
      <!-- <div class="container-fluid">   -->
      <div class="row">
        <div class="col col-12">
          <!-- Content will be placed here -->
          <slot/>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <footer class="page-footer font-small blue pt-4">
      <!-- Footer Links -->
      <div class="container text-center text-md-left">

        <!-- Grid row -->
        <div class="row">

          <!-- Grid column -->
          <div class="col-md-3 mt-md-0 mt-3">

            <h5><span class="footer-link-arrow">Newsletters</span></h5>
            <p>Sign up to receive enewsletters on a range of rural holiday activities.</p>

          </div>
          <!-- Grid column -->

          <hr class="clearfix w-100 d-md-none pb-3">

          <!-- Grid column -->
          <div class="col-md-3 mb-md-0 mb-3">

            <h5>Site Details</h5>
            <p>Terms and conditions</p>
            <p>Privacy statement</p>
            <p>Trade Login</p>

          </div>
          <!-- Grid column -->

          <hr class="clearfix w-100 d-md-none pb-3">

          <!-- Grid column -->
          <div class="col-md-3 mb-md-0 mb-3">
            <router-link :to="{name:'contact.index'}">
              <h5><span class="footer-link-arrow">Contact Us</span></h5>
            </router-link>
            <p>Give feedback or request queries to Rural Holidays</p>
            <a
              href="tel:+6433556218"
              class="footer-link-arrow">(03) 355 6218</a><br>
            <a
              href="mailto:Stay@RuralHolidays.co.nz"
              class="footer-link-arrow">Stay@RuralHolidays.co.nz</a>
          </div>
          <!-- Grid column -->

          <hr class="clearfix w-100 d-md-none pb-3">

          <!-- Grid column -->
          <div class="col-md-3 mb-md-0 mb-3">
            <h5>Partners</h5>
            <a
              href="https://tia.org.nz/"
              target="_blank"
              title="Opens in new window. "
              class="external-link">Tourism
              Industry Aotearoa</a><br>
            <a
              href="https://www.tourismexportcouncil.org.nz/"
              target="_blank"
              title="Opens in new window. "
              class="external-link">Tourism Export Council</a><br>
          </div>
          <!-- Grid column -->

        </div>
        <!-- Grid row -->

      </div>
      <!-- Footer Links -->

      <!-- Copyright -->
      <div class="footer-copyright text-center py-3">2004-2018
        <a href="http://www.ruralholidays.co.nz/"> Rural Holidays&trade; NZ Ltd</a>
      </div>
      <!-- Copyright -->

    </footer>
    <!-- Footer -->
    <div class="footer-pattern header-area"/>

  </div>

</template>

<script>
/* ============
   * Default Layout
   * ============
   *
   * Used for the home and account pages.
   *
   * Layouts are used to store a lot of shared code.
   * This way the app stays clean.
   */

export default {
  /**
     * The name of the layout.
     */
  name: 'DefaultLayout',

  /**
     * The data that can be used by the page.
     *
     * @returns {Object} The view-model data.
     */
  data() {
    return {
      menuCollapsed: false,
    };
  },
  computed: {
    isAboutUsActive() {
      return this.$route.name === 'aboutus.index';
    },
  },

  /**
     * The methods that the layout can use.
     */
  methods: {
    /**
       * Will log the user out.
       */
    logout() {
      this.$store.dispatch('auth/logout');
    },

    /**
       * Will toggle the menu.
       */
    toggleMenu() {
      this.menuCollapsed = !this.menuCollapsed;
    },
  },
};
</script>

<style scoped>

  .navbar {
    background-color: rgba(0, 0, 0, 0.63);
    border-bottom: 2px solid rgba(203, 134, 112, 0.63);
    display: flex;
    font-size: 16px;
    font-weight: 700;
    /*color: #fff;*/
    padding: 0rem;
    height: 150px;
  }
  /*a:not([href]):not([tabindex]) {*/
    /*color: black;*/
    /*text-decoration: none;*/
  /*}*/

  @media only screen and (max-width: 992px) and (min-width: 320px){
    .navbar {
      height: 45px;
      background-color: rgba(0, 0, 0, 0.8);
    }
    .navbar-toggler {
      border: 0 transparent;
    }
    .big-logo {
      display:none;
    }
    .small-logo {
      display: inline-block;
    }
    .navbar-collapse {
      background-color: rgba(0, 0, 0, 0.8);
      border: 0 transparent;
    }

  }
  @media only screen and (min-width: 992px) {
    .big-logo {
      display: inline-block;
    }
    .small-logo {
      display:none;
    }

  }
  @media only screen and (max-width: 320px) {
    .navbar {
      height: 45px;
      background-color: rgba(0, 0, 0, 0.8);
    }
    .navbar-toggler {
      border: 0 transparent;
    }
    .big-logo {
      display: none;
    }
    .small-logo {
      display:none;
    }
    .navbar-collapse {
      background-color: rgba(0, 0, 0, 0.8);
      border: 0 transparent;
    }

  }

  .navbar-brand {
    margin-left: 1rem;
  }

  .nav-item {
    padding-left: 0.2rem;
    padding-right: 0.2rem;
    -webkit-transition: 250ms ease-in-out;
    transition: 250ms ease-in-out;
    margin-left: 0.2em;
    margin-right: 0.2em;
  }

  .menu-btn {
    margin-left: 1rem;
  }


  .dropdown:hover > .dropdown-menu {
    display: block;
    color: #fff;
    border-width: 0;
    margin: 0;
    border-radius: 0;
  }

  .dropdown-item {
    color: #000000 !important;
  }

  .dropdown:hover > .dropdown-menu:active {
    display: block;
  }

  .dropdown-item:hover, .dropdown-item:active {
    color: #FFFFFF !important;
    background-color: #EE6123 !important;
  }

  .dropdown > .dropdown-toggle:active {
    /*Without this, clicking will make it sticky*/
    pointer-events: none;
    color: #FFFFFF !important;
    background-color: #EE6123 !important;
  }

  .nav-link:active {
    color: #FFFFFF !important;
    background-color: #EE6123 !important;
  }
  b-link {
    color: #FFFFFF !important;
    background-color: #EE6123 !important;
  }

  .navbar-dark .navbar-nav .active>.nav-link {
    color: #fff;
    background-color: #EE6123 !important;
  }

  .nav-item:hover, .nav-item:active {
    background: #EE6123 !important;
    color: white !important;
  }

  .page-footer {
    /*margin-top: 1.5rem;*/
    background-color: #61B3DE;
    color: #ffffff;
    link: #FFFFFF;
  }

  .page-footer .row {
    padding-left: 1rem;
    padding-right: 1rem;
  }

  .footer-copyright {
    margin-top: 1.5rem;
    background-color: #343a40;
    color: #ffffff;
  }

  .footer-pattern {
    height: 45px;
    background: url(../assets/img/footer-pattern.png) repeat-x center bottom #343a40;
    /*background: #333;*/
    position: relative;
    z-index: 1;
  }

  .page-footer a,.page-footer p {
    color: #FFFFFF;
    font-size: .8em;
    line-height: 1.4em;
    margin-bottom: 0;

  }

  .page-footer h5 {
    line-height: 1.4117em;
  }

  .footer-link-arrow:after{
    font-family: iconfont;
  }
  .footer-link-arrow:after {
    content: "\e624";
  }

  .external-link:after, a[href^="https://"]:after {
    font-family: iconfont;
    display: inline-block;
    padding-left:.3529rem;
    vertical-align: text-top;
  }
  .external-link:after, a[href^="https://"]:after {
    content: "\e965";
  }


  .external-link {
    text-decoration: underline;
  }
</style>

