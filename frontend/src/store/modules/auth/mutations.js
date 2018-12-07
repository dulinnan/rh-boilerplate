/* ============
 * Mutations for the auth module
 * ============
 *
 * The mutations that are available on the
 * account module.
 */

import Vue from 'vue';
import {
  CHECK,
  REGISTER,
  LOGIN,
  LOGOUT,
} from './mutation-types';

/* eslint-disable no-param-reassign */
export const userStatus = (state, user) => {
  if (user) {
    state.currentUser = user;
    state.isLogin = true;
  } else if (user === null) {
    sessionStorage.setItem("id_token", null);
    state.currentUser = null;
    state.isLogin = false;
    state.token = "";
  }
};
export default {
  // [CHECK](state) {
  //   state.authenticated = !!localStorage.getItem('id_token');
  //   if (state.authenticated) {
  //     Vue.$http.defaults.headers.common.Authorization = `Bearer ${localStorage.getItem('id_token')}`;
  //   }
  // },
  //
  // [REGISTER]() {
  //   //
  // },
  //
  // [LOGIN](state, token) {
  //   state.authenticated = true;
  //   localStorage.setItem('id_token', token);
  //   Vue.$http.defaults.headers.common.Authorization = `Bearer ${token}`;
  // },
  //
  // [LOGOUT](state) {
  //   state.authenticated = false;
  //   localStorage.removeItem('id_token');
  //   Vue.$http.defaults.headers.common.Authorization = '';
  // },
  userStatus
};
