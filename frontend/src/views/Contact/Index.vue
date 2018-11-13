<template>
    <div>
      <v-layout>
        <section class="breadcumb-area bg-img d-flex align-items-center justify-content-center">
          <div class="bradcumbContent">
            <h2>Contact</h2>
          </div>
        </section>
        <v-contact class="mt-50"></v-contact>
        <!-- ##### Contact Form Area Start ##### -->
        <section class="contact-form-area mb-50 mt-100">
          <div class="container">
            <div class="row">
              <div class="col-12">
                <div class="section-heading">
                  <div class="line-"></div>
                  <h2>Get in touch</h2>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-12">
                <!-- Contact Form -->
                <form action="#" method="post">
                  <div class="row">
                    <div class="col-lg-4">
                      <input type="text" class="form-control" name="text" placeholder="Your Name">
                    </div>
                    <div class="col-lg-4">
                      <input type="email" class="form-control" name="email" placeholder="E-mail">
                    </div>
                    <div class="col-lg-4">
                      <input type="text" class="form-control" name="subject" placeholder="Subject">
                    </div>
                    <div class="col-12">
                      <textarea name="message" class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                    </div>
                    <div class="col-12">
                      <button type="submit" class="btn rh-btn mt-50">Send Message</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </section>
        <!-- ##### Contact Form Area End ##### -->
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
    methods: {
      scrollBehavior() {
        window.scrollTo(0,0);
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
