<template>
  <div id="app">
    <router-view/>
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
    if (this.$store.state.auth.authenticated) {
      this.$store.dispatch('account/find');
    }
  },
};
</script>

<style>
    /*#app{*/
        /*font-family: "Lato", "Helvetica Condensed Light", "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", sans-serif;*/
    /*}*/
</style>
