/* ============
 * Getters for the auth module
 * ============
 *
 * The getters that are available on the
 * auth module.
 */


export const currentUser = state => state.state.currentUser;
export const isLogin = state => state.state.isLogin;

export default {
  currentUser,
  isLogin
};
