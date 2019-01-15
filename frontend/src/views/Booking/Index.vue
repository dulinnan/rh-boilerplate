<template>
  <v-layout>
    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img d-flex align-items-center justify-content-center">
      <div class="bradcumbContent">
        <h2>Booking</h2>
      </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Booking Form Start ##### -->
    <section class="about-us-area mt-50">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-12 col-lg-6">

            <div class="about-text mb-100">
              <div class="section-heading">
                <div class="line-"/>
                <h2>Booking Here</h2>
              </div>

              <el-form
                ref="bookingForm"
                :model="bookingForm"
                :rules="bookingRules"
                label-width="150px">
                <el-form-item prop="firstName" label="First name">
                  <el-input style="width: 50%;" v-model="bookingForm.givenName"/>
                </el-form-item>
                <el-form-item prop="lastName" label="Last name">
                  <el-input style="width: 50%;" v-model="bookingForm.familyName"/>
                </el-form-item>
                <el-form-item prop="email" label="Email">
                  <el-input style="width: 50%;" v-model="bookingForm.email"></el-input>
                </el-form-item>
                <el-form-item label="Address" prop="address">
                  <el-input style="width: 90%;"
                            size="medium"
                            v-model="bookingForm.address"
                            type="textarea"
                            placeholder="Please input your postal address"
                            :autosize="{ minRows: 1, maxRows: 6}"
                  />
                </el-form-item>
                <el-form-item label="Stay Option" prop="stayOption">
                  <el-select placeholder="please select stay type" v-model="bookingForm.stayOption">
                    <el-option
                      v-for="item in typeOfStay"
                      :key="item.value"
                      :label="item.label"
                      :value="item.value"></el-option>
                  </el-select>
                  <span class=".el-form-item__label" v-if="bookingForm.stayOption.includes('Farm')">Diner, Bed & Breakfast</span>
                  <span class=".el-form-item__label"
                        v-if="bookingForm.stayOption.includes('Home')">Bed & Breakfast</span>
                </el-form-item>
                <el-form-item label="Check-in" prop="checkinDate">
                  <el-col :span="11">
                    <el-date-picker
                      v-model="bookingForm.checkinDate"
                      :picker-options="pickerOptions"
                      type="date"
                      placeholder="Arriving date"
                      style="width: 100%;"
                      format="dd/MMM/yyyy"/>
                  </el-col>
                  <!--<el-col class="line" :span="2">-</el-col>-->
                  <el-col :span="11">
                    <el-time-picker
                      v-model="bookingForm.checkinTime"
                      prop="checkinTime"
                      type="fixed-time"
                      placeholder="Arriving time"
                      style="width: 100%;"
                      format="hh:mm"/>
                  </el-col>
                </el-form-item>
                <el-form-item label="Check-out" prop="checkoutDate">
                  <el-col :span="11">
                    <el-date-picker
                      v-model="bookingForm.checkoutDate"
                      :picker-options="pickerOptions"
                      type="date"
                      placeholder="Leaving date"
                      style="width: 100%;"
                      format="dd/MMM/yyyy"/>
                  </el-col>
                  <!--<el-col class="line" :span="2">-</el-col>-->
                  <el-col :span="11">
                    <el-time-picker
                      v-model="bookingForm.checkoutTime"
                      prop="checkoutTime"
                      type="fixed-time"
                      placeholder="Leaving time"
                      style="width: 100%;"
                      format="hh:mm"/>
                  </el-col>
                </el-form-item>
                <el-form-item label="How many adults?" prop="adultNum">
                  <el-input-number v-model="bookingForm.adultNum" :min="1" :max="10"></el-input-number>
                </el-form-item>
                <el-form-item label="How many kids?" prop="childNum">
                  <el-input-number v-model="bookingForm.childNum" :min="0" :max="10"></el-input-number>
                </el-form-item>
                <el-form-item label="Bedding Option" prop="beddingOption">
                  <el-select placeholder="Please select bedding" v-model="bookingForm.beddingOption">
                    <el-option
                      v-for="item in typeOfBedding"
                      :key="item.value"
                      :label="item.label"
                      :value="item.value"></el-option>
                  </el-select>
                </el-form-item>
                <el-form-item label="Transportation" prop="transportation">
                  <el-select placeholder="Please select transport" v-model="bookingForm.transportation">
                    <el-option
                      v-for="item in typeOfTransportation"
                      :key="item.value"
                      :label="item.label"
                      :value="item.value"></el-option>
                  </el-select>
                </el-form-item>
                <el-form-item label="Additional Information">
                  <el-input v-model="bookingForm.desc"
                            type="textarea"
                            placeholder="Dietary/Allergies/Any Special Requirements"
                            :autosize="{ minRows: 3, maxRows: 6}"/>
                </el-form-item>
                <el-form-item>
                  <el-button class="btn rh-btn" @click="submitForm()">Book</el-button>
                  <el-button @click="resetForm('bookingForm')" class="rh-cancel-btn">Reset</el-button>
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
      let validateCheckinDate = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('Please pick a date'));
        } else {
          if (this.bookingForm.checkoutDate !== '') {
            this.$refs.bookingForm.validateField('checkoutDate');
          }
          callback();
        }
      };
      let validateCheckoutDate = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('Please pick a date'));
        } else if (value <= this.bookingForm.checkinDate) {
          callback(new Error('You can only check out after checking in'));
        } else {
          callback();
        }
      };
      return {
        loadingStatus: false,
        bookingClicked: false,
        bookingForm: {
          givenName: '',
          familyName: '',
          email: '',
          stayOption: '',
          adultNum: 0,
          childNum: 0,
          address: '',
          checkinDate: '',
          checkinTime: '',
          checkoutDate: '',
          checkoutTime: '',
          beddingOption: '',
          transportation: '',
          delivery: false,
          type: [],
          resource: '',
          desc: '',
        },
        pickerOptions: {
          disabledDate(time) {
            return time.getTime() <= Date.now();
          },
        },
        typeOfStay: [{
          value: 'Farm Stay',
          label: 'Farm Stay'
        }, {
          value: 'Country/Home Stay',
          label: 'Country/Home Stay'
        }],
        typeOfBedding: [{
          value: 'Single',
          label: 'Single'
        }, {
          value: 'Double',
          label: 'Double'
        }, {
          value: 'Twin',
          label: 'Twin'
        }, {
          value: 'King',
          label: 'King'
        },
        ],
        typeOfTransportation: [{
          value: 'Rental',
          label: 'Rental'
        }, {
          value: 'Public Transportation',
          label: 'Public Transportation'
        }, {
          value: 'Private Car',
          label: 'Private Car'
        }, {
          value: 'Other',
          label: 'Other'
        }],
        bookingRules: {
          email: [{required: true, message: 'Please input email address', trigger: 'blur'},
            {type: 'email', message: 'Please input correct email address', trigger: ['blur', 'change']}],
          lastName: [{required: true, message: 'Please fill in the family name', trigger: 'blur'},
            {type: 'string', max: 20, message: 'Name is no longer than 20 words', trigger: ['blur', 'change']}],
          firstName: [{required: true, message: 'Please fill in the given name', trigger: 'blur'},
            {type: 'string', max: 20, message: 'Name is no longer than 20 words', trigger: ['blur', 'change']}],
          address: [{type: 'string', required: true, message: 'Please enter your address', trigger: 'change'}],
          checkinDate: [{required: true, validator: validateCheckinDate, trigger: 'blur'}],
          checkinTime: [{type: 'date', required: true, message: 'Please pick a time', trigger: 'change'}],
          checkoutDate: [{required: true, validator: validateCheckoutDate, trigger: 'blur'}],
          checkoutTime: [{type: 'date', required: true, message: 'Please pick a time', trigger: 'change'}],
          adultNum: [{
            type: 'integer',
            required: true,
            message: 'Please input the number of adults',
            trigger: 'change'
          }],
          stayOption: [{type: 'string', required: true, message: 'Please choose a stay option', trigger: 'change'}],
          beddingOption: [{
            type: 'string',
            required: true,
            message: 'Please choose a bedding option',
            trigger: 'change'
          }],
        },
      };
    },
    methods: {
      submitForm() {
        console.log('submit!');
        console.log(this.bookingForm.checkinDate);
        console.log(this.bookingForm.checkoutDate);
        if (this.bookingForm.checkinDate <= this.bookingForm.checkoutDate) {
          console.log("correct")
        }
      },
      resetForm(formName) {
        this.bookingClicked = false;
        this.loadingStatus = false;
        this.$refs[formName].resetFields();
      }
    },
  };
</script>

<style scoped>
  .breadcumb-area {
    background-image: url("../../assets/booking/direction-finger.jpg");
  }

  .rh-btn {
    background-color: #ff4c4c;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    position: relative;
    z-index: 1;
    display: inline-block;
    min-width: 123px;
    height: 53px;
    color: #ffffff;
    border: none;
    border-radius: 0;
    padding: 0 30px;
    font-size: 16px;
    line-height: 53px;
    text-transform: capitalize;
  }

  .rh-btn:hover, .rh-btn:focus {
    font-size: 16px;
    background-color: #363636;
    color: #ffffff;
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
