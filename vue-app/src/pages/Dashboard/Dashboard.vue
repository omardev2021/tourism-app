<template>
  <v-container fluid>
    <div class="dashboard-page">
      <v-row no-gutters class="d-flex justify-space-between mt-10 mb-6">
        <h1 class="page-title">Dashboard</h1>
      </v-row>
      <v-row>
        <v-col cols="12" md="3" class="mb-4">
          <v-dialog v-model="dialog" persistent max-width="600px">
            <template v-slot:activator="{ on, attrs }">
              <v-btn rounded color="blue" dark v-bind="attrs" v-on="on">
                Add Trips
              </v-btn>
            </template>
            <!-- dialog content  -->
            <v-card>
              <v-card-title>
                <span class="text-h5">Add New Trip</span>
              </v-card-title>
              <v-card-text>
                <v-container>
                  <v-row>
                    <v-col cols="12">
                      <v-text-field
                        label="City"
                        required
                        v-model="trip.city"
                        name="city"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12">
                      <v-text-field
                        label="Description"
                        required
                        v-model="trip.description"
                        name="description"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12">
                      <v-text-field
                        label="Image Url"
                        required
                        v-model="trip.image_url"
                        name="image_url"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12">
                      <v-text-field
                        label="Trip Title"
                        required
                        v-model="trip.title"
                        name="title"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12">
                      <v-text-field
                        label="From Date"
                        v-model="trip.from_date"
                        name="from_date"
                        type="date"
                        required
                        :rules="[
                          (v) => !!v || 'Item is required',
                          (v) =>
                            v >= new Date().toISOString().substr(0, 10) ||
                            'error',
                        ]"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12">
                      <v-text-field
                        label="To Date"
                        type="date"
                        v-model="trip.to_date"
                        name="to_date"
                        required
                        :rules="[
                          (v) => !!v || 'Item is required',
                          (v) =>
                            v >= new Date().toISOString().substr(0, 10) ||
                            'error',
                        ]"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12">
                      <v-text-field
                        label="Price"
                        type="number"
                        required
                        v-model="trip.price"
                        name="price"
                      ></v-text-field>
                    </v-col>
                  </v-row>
                </v-container>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="dialog = false">
                  Close
                </v-btn>
                <v-btn color="blue darken-1" text @click="saveTrip">
                  Save
                </v-btn>
              </v-card-actions>
            </v-card>

            <!-- end -->
          </v-dialog>
        </v-col>
      </v-row>

      <v-row>
        <v-col
          lg="3"
          sm="6"
          md="5"
          cols="12"
          v-for="(trip, index) in trips"
          :key="index"
        >
          <v-card class="mx-auto my-12" max-width="374">
            <template slot="progress">
              <v-progress-linear
                color="deep-purple"
                height="10"
                indeterminate
              ></v-progress-linear>
            </template>

            <v-img height="250" :src="trip.image_url"></v-img>

            <v-card-title>{{ trip.title }}</v-card-title>

            <v-card-text>
              <div class="my-4 text-subtitle-1">
                {{ trip.price }} SDG / Person
              </div>

              <div>
                {{ trip.description }}
              </div>
            </v-card-text>

            <v-divider class="mx-4"></v-divider>

            <v-card-title> From date - To date</v-card-title>

            <v-card-text>
              <v-chip-group column>
                <v-chip class="deep-purple accent-4 white--text"
                  >{{ trip.from_date }}
                </v-chip>
                <v-chip class="deep-purple accent-4 white--text"
                  >{{ trip.to_date }}
                </v-chip>
              </v-chip-group>
            </v-card-text>

            <!-- <v-card-actions>
              <v-btn color="deep-purple lighten-2" text @click="reserve">
                Reserve
              </v-btn>
            </v-card-actions> -->
          </v-card>
        </v-col>
      </v-row>
    </div>
  </v-container>
</template>

<script>
import TripsService from "../../services/TripsService";

export default {
  name: "Dashboard",
  components: {},
  data() {
    return {
      mainApexAreaSelect: "Daily",
      loading: false,
      selection: 1,
      dialog: false,
      trips: [],
      trip: {
        id: null,
        title: "",
        image_url: "",
        description: "",
        price: "",
        from_date: "",
        to_date: "",
        city: "",
      },
    };
  },
  methods: {
    retrieveTrips() {
      TripsService.getAll().then((response) => {
        this.trips = response.data;
        console.log(response.data);
      });
      // .catch((e) => {
      //   //   console.log(e);
      // });
    },

    saveTrip() {
      var data = {
        title: this.trip.title,
        image_url: this.trip.image_url,
        description: this.trip.description,
        price: this.trip.price,
        from_date: this.trip.from_date,
        to_date: this.trip.to_date,
        city: this.trip.city,
      };
      TripsService.create(data)
        .then((response) => {
          this.trip.id = response.data.id;
          console.log(response.data);
          this.dialog = false;
          this.retrieveTrips();
          // this.retrieveCat();
          //   this.submitted = true;
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
  mounted() {
    this.retrieveTrips();
  },
};
</script>

<style src="./Dashboard.scss" lang="scss"/>
