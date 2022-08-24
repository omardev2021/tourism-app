import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({

  namespace: true,
  state: {
    drawer: true,
    user: null,
    token: null
  },
  mutations: {
    toggleDrawer(state) {
      state.drawer = !state.drawer;
    },
    setUser(state, user) {
      state.user = user;
    },
    setToken(state, token) {
      state.token = token;
    },
    LogOut(state) {
      state.user = null

    }
  },
  actions: {
    TOGGLE_DRAWER({ commit }) {
      commit('toggleDrawer');
    }
  },
  getters: {
    DRAWER_STATE(state) {
      return state.drawer;
    },
    isLoggedIn(state) {
      return !!state.token;
    },
  }
});
