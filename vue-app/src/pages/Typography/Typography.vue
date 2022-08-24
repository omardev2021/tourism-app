<template>
  <v-container fluid class="typography-page">
    <h1 class="page-title mt-10 mb-6">Bookings Reports</h1>
    <v-row>
      <v-col cols="12" md="3" class="mb-4"> </v-col>
    </v-row>

    <v-row>
      <v-col cols="12"> </v-col>
      <v-col cols="12">
        <v-card class="mb-1">
          <v-card-title class="pa-5 pb-3">
            <v-spacer></v-spacer>
            <v-menu>
              <template v-slot:activator="{ on, attrs }">
                <v-btn icon v-bind="attrs" v-on="on">
                  <v-icon color="textColor">mdi-dots-vertical</v-icon>
                </v-btn>
              </template>
              <v-list>
                <v-list-item
                  v-for="(item, i) in bookings"
                  :key="i"
                  @click="() => {}"
                >
                  <v-list-item-title>{{ item }}</v-list-item-title>
                </v-list-item>
              </v-list>
            </v-menu>
          </v-card-title>
          <v-simple-table>
            <template v-slot:default>
              <thead>
                <tr>
                  <th class="text-left pa-6">Id</th>
                  <th class="text-left">Trip Id</th>
                  <th class="text-left">People No</th>
                  <th class="text-left">Phone No</th>
                  <th class="text-left">Total</th>
                  <th class="text-left">Tourist Name</th>
                  <th class="text-left">Status</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="booking in bookings" :key="booking.id">
                  <td class="pa-6">{{ booking.id }}</td>
                  <td>{{ booking.trip_id }}</td>
                  <td>{{ booking.people_no }}</td>
                  <td>{{ booking.phone }}</td>
                  <td>{{ booking.price }}</td>
                  <td>{{ booking.full_name }}</td>
                  <td v-if="booking.status === 'confirm'">
                    <v-chip link color="success" class="ma-2 ml-0">
                      Confirmed
                    </v-chip>
                  </td>
                  <td v-else-if="booking.status === 'pending'">
                    <v-chip link color="warning" class="ma-2 ml-0">
                      Pending
                    </v-chip>
                  </td>
                  <td v-else-if="booking.status === 'rejected'">
                    <v-chip link color="secondary" class="ma-2 ml-0">
                      Declined
                    </v-chip>
                  </td>
                </tr>
              </tbody>
            </template>
          </v-simple-table>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import ActivitiesService from "../../services/ActivitiesService";
import BookingsService from "../../services/BookingsService";
import mock from "../Tables/mock";
export default {
  name: "Typography",
  data: () => ({
    dialog: false,
    bookings: [],
    mock,
    heading: "Sample PDF Generator",
    items: [
      { title: "Item 1", body: "I am item 1 body text" },
      { title: "Item 2", body: "I am item 2 body text" },
      { title: "Item 3", body: "I am item 3 body text" },
      { title: "Item 4", body: "I am item 4 body text" },
    ],
    moreText: [
      "This is another few sentences of text to look at it.",
      "Just testing the paragraphs to see how they format.",
      "jsPDF likes arrays for sentences.",
      "Do paragraphs wrap properly?",
      "Yes, they do!",
      "What does it look like?",
      "Not bad at all.",
    ],
  }),
  methods: {
    retrieveBookings() {
      BookingsService.getAll().then((response) => {
        this.bookings = response.data;
        console.log(response.data);
      });
    },
    confirm(id) {
      BookingsService.confirm(id).then((response) => {
        // this.bookings = response.data;
        console.log(response.data);
      });
      this.retrieveBookings();
    },
    reject(id) {
      BookingsService.reject(id).then((response) => {
        // this.bookings = response.data;
        console.log(response.data);
      });
      this.retrieveBookings();
    },

    saveActivity() {
      var data = {
        place: this.activity.place,
        image_url: this.activity.image_url,
        from: this.activity.from,
        to: this.activity.to,
        location: this.activity.location,
        trip_id: this.activity.trip_id,
      };
      ActivitiesService.create(data)
        .then((response) => {
          this.activity.id = response.data.id;
          console.log(response.data);
          this.dialog = false;
          this.retrieveActivites();
          // this.retrieveCat();
          //   this.submitted = true;
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },

  mounted() {
    this.retrieveBookings();
    this.retrieveActivites();
  },
};
</script>

<style src="./Typography.scss" scoped lang="scss"></style>
