<template>
  <v-app-bar class="main-header" height="64" fixed color="primary" dark>
    <v-btn icon class="mx-1" @click.stop="TOGGLE_DRAWER">
      <template v-if="DRAWER_STATE">
        <v-icon style="font-size: 28px">mdi-arrow-left</v-icon>
      </template>
      <template v-else>
        <v-icon style="font-size: 28px">mdi-menu</v-icon>
      </template>
    </v-btn>
    <v-toolbar-title>Tourism Management System</v-toolbar-title>
    <v-spacer></v-spacer>

    <v-menu min-width="180" offset-y bottom left nudge-bottom="10">
      <template v-slot:activator="{ on, attrs }">
        <v-btn class="mr-0" icon v-bind="attrs" v-on="on">
          <v-icon style="font-size: 28px" :color="config.light.iconColor"
            >mdi-account</v-icon
          >
        </v-btn>
      </template>
      <v-list>
        <!-- <div class="text-h5 grey--text text--darken-3 px-4 pt-4">Nizar Abdelrazig</div> -->

        <div class="d-flex justify-center my-3">
          <v-btn
            width="80%"
            large
            outlined
            color="primary"
            class="text-capitalize"
            @click="logOut"
            >Sign Out
          </v-btn>
        </div>
      </v-list>
    </v-menu>
  </v-app-bar>
</template>

<script>
import { mapActions, mapState } from "vuex";
import config from "../../config";

export default {
  name: "Header",
  components: {},
  data: () => ({
    config,
    searchCollapse: true,
    notifications: [
      {
        text: "Check out this awesome ticket",
        icon: "mdi-tag",
        color: "warning",
      },
      {
        text: "What is the best way to get ...",
        icon: "mdi-thumb-up",
        color: "success",
      },
      {
        text: "This is just a simple notification",
        icon: "mdi-flag",
        color: "error",
      },
      {
        text: "12 new orders has arrived today",
        icon: "mdi-cart",
        color: "primary",
      },
    ],
    messages: [
      {
        text: "JH",
        name: "Jane Hew",
        message: "Hey! How is it going?",
        time: "09:32",
        color: "warning",
      },
      {
        text: "LB",
        name: "Lloyd Brown",
        message: "Check out my new Dashboard",
        time: "10:02",
        color: "success",
      },
      {
        text: "MW",
        name: "Mark Winstein",
        message: "I want rearrange the appointment",
        time: "12:16",
        color: "error",
      },
      {
        text: "LD",
        name: "Liana Dutti",
        message: "Good news from sale department",
        time: "14:56",
        color: "primary",
      },
    ],
    account: [
      { text: "Profile", icon: "mdi-account", color: "textColor" },
      { text: "Tasks", icon: "mdi-thumb-up", color: "textColor" },
      { text: "Messages", icon: "mdi-flag", color: "textColor" },
    ],
    notificationsBadge: true,
    messageBadge: true,
  }),
  computed: {
    ...mapState(["drawer"]),
    DRAWER_STATE: {
      get() {
        return this.drawer;
      },
    },
  },
  methods: {
    ...mapActions(["TOGGLE_DRAWER"]),
    logOut: function () {
      window.localStorage.setItem("authenticated", false);
      this.$router.push("/login");
    },
  },
};
</script>

<style src="./Header.scss" lang="scss"></style>
