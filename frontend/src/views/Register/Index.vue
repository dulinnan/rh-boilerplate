<template>
  <div class="father">
    <v-layout class="son">
      <div>
        <el-card class="box-card" v-loading="loadingStatus">
          <div slot="header" class="clearfix">
            <span>Signup</span>
            <router-link :to="{ name: 'home.index' }">
              <el-button style="float: right; padding: 3px 0" type="text">Exit</el-button>
            </router-link>
          </div>
          <div>
            <el-form label-width="140px" ref="signupForm" :model="signupForm" :rules="signupRules" class="signup-form"
                     auto-complete="on" label-position="left">
              <el-form-item prop="firstName" label="First Name">
                <el-input v-model="signupForm.firstName"></el-input>
              </el-form-item>
              <el-form-item prop="lastName" label="Last Name">
                <el-input v-model="signupForm.lastName"></el-input>
              </el-form-item>
              <el-form-item prop="email" label="Email">
                <el-input v-model="signupForm.email"></el-input>
              </el-form-item>
              <el-form-item prop="password" label="Password">
                <el-input
                  type="password"
                  v-model="signupForm.password"
                  name="password"
                  auto-complete="on"/>
              </el-form-item>
              <el-form-item prop="passwordConfirm" label="Password Confirm">
                <el-input
                  type="password"
                  v-model="signupForm.passwordConfirm"
                  name="passwordConfirm"
                  auto-complete="on"/>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="submitForm('signupForm')" :loading="signupClicked">Sign Up</el-button>
                <el-button @click="resetForm('signupForm')">Reset</el-button>
              </el-form-item>
              <div>
                Already have an account?
                <router-link :to="{ name: 'login.index' }">
                  <el-button style="padding: 3px 0" type="text">Log In</el-button>
                </router-link>
              </div>
            </el-form>
          </div>

        </el-card>
      </div>
    </v-layout>
  </div>
</template>

<script>
/* ============
 * Register Index Page
 * ============
 *
 * Page where the user can register.
 */

import VLayout from '@/layouts/Minimal.vue';

export default {
  /**
   * The name of the page.
   */
  name: 'RegisterIndex',

  /**
   * The components the page can use.
   */
  components: {
    VLayout,
  },

  /**
   * The data that can be used by the page.
   *
   * @returns {Object} The view-model data.
   */
  data() {
    let validatePass = (rule, value, callback) => {
      if (value.length === 0) {
        callback(new Error('Please input the password'));
      } else if (value.length < 5) {
        callback(new Error('The password length cannot be less than 5 bits'));
      } else {
        if (this.signupForm.passwordConfirm !== '') {
          this.$refs.signupForm.validateField('passwordConfirm');
        }
        callback();
      }
    };
    let validatePassConfirm = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('Please input the password again'));
      } else if (value !== this.signupForm.password) {
        callback(new Error('Two inputs don\'t match!'));
      } else {
        callback();
      }
    };
    return {
      loadingStatus: false,
      signupClicked: false,
      signupForm: {
        firstName: '',
        lastName: '',
        email: '',
        passwordConfirm: '',
        password: '',
      },
      signupRules: {
        email: [{required: true, message: 'Please input email address', trigger: 'blur'},
          {type: 'email', message: 'Please input correct email address', trigger: ['blur', 'change']}],
        password: [{required: true, validator: validatePass, trigger: 'blur'}],
        lastName: [{required: true, message: 'Please fill in the family name', trigger: 'blur'},
          {type: 'string', max: 20, message: 'Name is no longer than 20 words', trigger: ['blur', 'change']}],
        firstName: [{required: true, message: 'Please fill in the given name', trigger: 'blur'},
          {type: 'string', max: 20, message: 'Name is no longer than 20 words', trigger: ['blur', 'change']}],
        passwordConfirm: [{required: true, validator: validatePassConfirm, trigger: 'blur'}],
      },
    };
  },

  /**
   * The methods the page can use.
   */
  methods: {
    /**
     * Will register the user.
     *
     * @param {Object} user The user to be registered.
     */
    submitForm(formName) {
      this.loadingStatus = true;
      this.signupClicked = true;
      this.$refs[formName].validate((valid) => {
        if (valid) {
          let vm = this;
          this.$http.post('users/',
            {
              "givenName": this.signupForm.firstName,
              "familyName": this.signupForm.lastName,
              "email": this.signupForm.email,
              "password": this.signupForm.password
            })
            .then((response) => {
              this.$message({
                message: 'Successfully signup!',
                type: 'success'
              });
              // this.bus.$on('listenOnSession', this.signupForm.email);
              this.$router.push({path: '/admin'});
            }, function (error) {
              if (error.response.status === 400) {
                vm.signupClicked = false;
                vm.loadingStatus = false;
                vm.$notify.error({
                  title: 'Signup Failed',
                  message: 'Invalid user detail supplied'
                });
              }
            });
        } else {
          this.loadingStatus = false;
          this.signupClicked = false;
          return false;
        }
      });
    },

    resetForm(formName) {
      this.signupClicked = false;
      this.loadingStatus = false;
      this.$refs[formName].resetFields();
    }

  },
};
</script>

<style scoped>
  .father {
    position: relative;
  }

  .son {
    position: absolute;
    top: 100%;
    left: 50%;
    transform: translate(-50%, 25%);
  }
</style>
