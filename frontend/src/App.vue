<template>
  <div id="app">

    <keep-alive>
      <router-view v-if="$route.meta.keepAlive"></router-view>
    </keep-alive>
    <router-view v-if="!$route.meta.keepAlive"></router-view>

  </div>
</template>
<script>
/* ============
 * Entry Point
 * ============
 *
 * The entry point of the application.
 */


export default {
  /**
   * The name of the application.
   */
  name: 'RuralHoliday',

  /**
   * Fires when the app has been mounted.
   */
  mounted() {
    // If the user is authenticated,
    // fetch the data from the API
    // if (this.$store.state.auth.authenticated) {
    //   this.$store.dispatch('account/find');
    // }
  },
};
</script>
