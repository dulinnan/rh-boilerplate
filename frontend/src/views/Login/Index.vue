<template>
  <div class="father">
    <v-layout class="son">
      <div>
        <el-card class="box-card" v-loading="loadingStatus">
          <div slot="header" class="clearfix">
            <span>Log In</span>
            <router-link :to="{ name: 'home.index' }">
              <el-button style="float: right; padding: 3px 0" type="text">Exit</el-button>
            </router-link>
          </div>
          <div>
            <el-form label-width="140px" ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form"
                     auto-complete="on" label-position="left">
              <el-form-item
                prop="email"
                label="Email">
                <el-input v-model="loginForm.email"></el-input>
              </el-form-item>
              <el-form-item prop="password" label="Password">
                <el-input
                  type="password"
                  v-model="loginForm.password"
                  name="password"
                  auto-complete="on"/>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="submitForm('loginForm')" :loading="loginClicked">Login</el-button>
                <el-button @click="resetForm('loginForm')">Reset</el-button>

              </el-form-item>
              <div>
                Don't have an account?
                <router-link :to="{ name: 'register.index' }">
                  <el-button style="padding: 3px 0" type="text">Sign Up</el-button>
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
   * Login Index Page
   * ============
   *
   * Page where the user can login.
   */

  import VLayout from '@/layouts/Minimal.vue';

  import {mapMutations} from 'vuex';

  export default {
    /**
     * The name of the page.
     */
    name: 'LoginIndex',

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
      return {
        loadingStatus: false,
        loginClicked: false,
        loginForm: {
          email: '',
          password: '',
        },
        loginRules: {
          email: [{required: true, message: 'Please input email address', trigger: 'blur'},
            {type: 'email', message: 'Please input correct email address', trigger: ['blur', 'change']}],
          password: [{required: true, message: 'Please fill in the password.', trigger: 'blur'},
            {
              type: 'string',
              min: 5,
              message: 'The password length cannot be less than 5 bits',
              trigger: 'blur'
            }]
        },
      };
    },

    /**
     * The methods the page can use.
     */
    methods: {
      /**
       * Will log the user in.
       *
       * @param {Object} user The user to be logged in.
       */
      submitForm(formName) {
        this.loadingStatus = true;
        this.loginClicked = true;
        this.$refs[formName].validate((valid) => {
          if (valid) {
            let vm = this;
            this.$http.post('users/login',
              {
                "email": this.loginForm.email,
                "password": this.loginForm.password
              })
              .then((response) => {
                this.$message({
                  message: 'Successfully logged in!',
                  type: 'success'
                });
                sessionStorage.setItem('id_token', JSON.stringify(response.data));
                console.log(sessionStorage.getItem('id_token'));
                this.$router.push({path: '/admin'});
              }, function (error) {
                if (error.response.status === 400) {
                  vm.loadingStatus = false;
                  vm.loginClicked = false;
                  vm.$notify.error({
                    title: 'Login Failed',
                    message: 'Invalid email or password supplied'
                  });
                }
              });
          } else {
            this.loadingStatus = false;
            this.loginClicked = false;
            return false;
          }
        });
      },
      resetForm(formName) {
        this.loadingStatus = false;
        this.loginClicked = false;
        this.$refs[formName].resetFields();
      },
    },
  };
</script>

<style scoped>
  .father {
    position: relative;
  }

  .son {
    position: absolute;
    top: 0%;
    left: 50%;
    transform: translate(-50%, 50%);
  }
</style>
