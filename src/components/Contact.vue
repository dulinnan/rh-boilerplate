<template>
  <div class="contact">
    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area d-flex flex-wrap align-items-center">
      <div class="home-map-area">
        <iframe src="https://www.openstreetmap.org/export/embed.html?bbox=172.63005137443542%2C-43.53360436320591%2C172.6320040225983%2C-43.532198457073655&amp;layer=mapnik" style="border: 0 transparent"></iframe>
        </div>
      <!-- Contact Info -->
      <div class="contact-info">
        <div class="section-heading wow fadeInUp" data-wow-delay="100ms">
          <div class="line-"></div>
          <h2>Contact Info</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris sceleri sque, at rutrum nulla dictum. Ut ac ligula sapien. Suspendisse cursus faucibus finibus. Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
        </div>
          <div class="single-contact-information">
            <!-- Single Contact Information -->
            <div class="contact-content d-flex">
              <p>Postal Address</p>
              <p>P.O. Box 2155, Christchurch 8140<br>New Zealand</p>
            </div>
            <!-- Single Contact Information -->
            <div class="contact-content d-flex">
              <p>Phone</p>
              <p>+64 03 355 6218</p>
            </div>
            <!-- Single Contact Information -->
            <div class="contact-content d-flex">
              <p>Business Hours</p>
              <p>Mon-Fri 8:30am-5:00pm</p>
            </div>
            <!-- Single Contact Information -->
            <div class="contact-content d-flex">
              <p>E-mail</p>
              <p>Stay@RuralHolidays.co.nz</p>
            </div>
          </div>


         <!--Social Info-->
        <div class="social-info mt-30 wow fadeInUp" data-wow-delay="600ms">
          <a href="#"><i class="iconfont icon-facebook" aria-hidden="true"></i></a>
          <a href="#"><i class="iconfont icon-twitter" aria-hidden="true"></i></a>
          <a href="#"><i class="iconfont icon-linkedin" aria-hidden="true"></i></a>
          <a href="#"><i class="iconfont icon-weibo" aria-hidden="true"></i></a>
          <a href="#"><i class="iconfont icon-weixin" aria-hidden="true"></i></a>
        </div>
      </div>
    </section>
    <!-- ##### Contact Area End ##### -->
  </div>
</template>

<script>
/* ============
 * Card Component
 * ============
 *
 * A basic card component.
 *
 * Gives an idea how components work.
 */

import SlotMixin from '@/mixins/slot';

export default {
  /**
   * The name of the component.
   */
  name: 'Contact',

  /**
   * The mixins that the component can use.
   */
  mixins: [
    SlotMixin,
  ],

  /**
   * The properties that the component accepts.
   */
  props: {
    // contextualStyle: {
    //   default: 'primary',
    //   type: String,
    //   required: false,
    // },
  },

  /**
   * The computed properties that the component can use.
   */
  computed: {
    /**
     * Computed property which will compute the classes
     * for the header of the card.
     *
     * @returns {Array} The classes for the header.
     */
    // classNamesHeader() {
    //   const classNames = ['card-header'];
    //
    //   if (this.contextualStyle) {
    //     classNames.push(`bg-${this.contextualStyle}`);
    //     classNames.push('text-white');
    //   } else {
    //     classNames.push('bg-default');
    //   }
    //
    //   return classNames;
    // },
  },
};
</script>



