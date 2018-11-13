<template>
  <v-layout>
    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img d-flex align-items-center justify-content-center">
      <div class="bradcumbContent">
        <h2>Booking</h2>
      </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### About Us Area Start ##### -->
    <section class="about-us-area mt-100">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-12 col-lg-6">

            <div class="about-text mb-100">
              <div class="section-heading">
                <div class="line-"/>
                <h2>Booking Here</h2>
              </div>

              <el-form
                ref="form"
                :model="form"
                label-width="120px">
                <el-form-item label="Activity name">
                  <el-input v-model="form.name"/>
                </el-form-item>
                <el-form-item label="Activity zone">
                  <el-select
                    v-model="form.region"
                    placeholder="please select your zone">
                    <el-option
                      label="Zone one"
                      value="shanghai"/>
                    <el-option
                      label="Zone two"
                      value="beijing"/>
                  </el-select>
                </el-form-item>
                <el-form-item label="Activity time">
                  <el-col :span="11">
                    <el-date-picker
                      v-model="form.date1"
                      type="date"
                      placeholder="Pick a date"
                      style="width: 100%;"
                      format="dd/M/yyyy"/>
                  </el-col>
                  <!--<el-col class="line" :span="2">-</el-col>-->
                  <el-col :span="11">
                    <el-time-picker
                      v-model="form.date2"
                      type="fixed-time"
                      placeholder="Pick a time"
                      style="width: 100%;"
                      format="hh:mm"/>
                  </el-col>
                </el-form-item>
                <el-form-item label="Instant delivery">
                  <el-switch v-model="form.delivery"/>
                </el-form-item>
                <el-form-item label="Activity type">
                  <el-checkbox-group v-model="form.type">
                    <el-checkbox
                      label="Online activities"
                      name="type"/>
                    <el-checkbox
                      label="Promotion activities"
                      name="type"/>
                    <el-checkbox
                      label="Offline activities"
                      name="type"/>
                    <el-checkbox
                      label="Simple brand exposure"
                      name="type"/>
                  </el-checkbox-group>
                </el-form-item>
                <el-form-item label="Resources">
                  <el-radio-group v-model="form.resource">
                    <el-radio label="Sponsor"/>
                    <el-radio label="Venue"/>
                  </el-radio-group>
                </el-form-item>
                <el-form-item label="Activity form">
                  <el-input
                    v-model="form.desc"
                    type="textarea"/>
                </el-form-item>
                <el-form-item>
                  <el-button
                    class="rh-btn"
                    @click="onSubmit">Book
                  </el-button>
                  <el-button class="rh-cancel-btn">Reset</el-button>
                </el-form-item>
              </el-form>
            </div>

          </div>

          <div class="col-12 col-lg-6">
            <div class="about-thumbnail mb-100">
              <img
                src="../../assets/booking/map.jpg"
                alt="">
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ##### About Us Area End ##### -->

  </v-layout>
</template>

<script>
    /* ============
             * Account Index Page
             * ============
             *
             * Page where the user can view the account information.
             */

    import VLayout from '@/layouts/Default.vue';

    export default {
        /**
     * The name of the page.
     */
        name: 'BookingIndex',

        /**
     * The components that the page can use.
     */
        components: {
            VLayout,
        },
        data() {
            return {
                form: {
                    name: '',
                    region: '',
                    date1: '',
                    date2: '',
                    delivery: false,
                    type: [],
                    resource: '',
                    desc: '',
                },
            };
        },
        methods: {
            onSubmit() {
                console.log('submit!');
            },
        },
    };
</script>

<style scoped>
  .breadcumb-area {
    background-image: url("../../assets/booking/direction-finger.jpg");
  }

  .rh-cancel-btn {
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    position: relative;
    z-index: 1;
    display: inline-block;
    min-width: 123px;
    height: 53px;
    border: none;
    border-radius: 0;
    padding: 0 30px;
    font-size: 16px;
    line-height: 53px;
    text-transform: capitalize;
  }
</style>
