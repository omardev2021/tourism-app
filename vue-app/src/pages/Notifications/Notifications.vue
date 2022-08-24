<template xmlns:div="http://www.w3.org/1999/html">
  <v-container fluid class="notification-page">
    <h1 class="page-title mt-10 mb-9">Hotels</h1>
    <v-row>
      <v-col cols="12" md="3" class="mb-4">
        <v-dialog v-model="dialog" persistent max-width="600px">
          <template v-slot:activator="{ on, attrs }">
            <v-btn rounded color="blue" dark v-bind="attrs" v-on="on">
              Add Hotel
            </v-btn>
          </template>
          <!-- dialog content  -->
          <v-card>
            <v-card-title>
              <span class="text-h5">Add New Hotel</span>
            </v-card-title>
            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12">
                    <v-text-field
                      label="Hotel Name"
                      required
                      v-model="hotel.name"
                      name="name"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12">
                    <v-text-field
                      label="City"
                      required
                      v-model="hotel.city"
                      name="city"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12">
                    <v-text-field
                      label="Hotel Location"
                      required
                      v-model="hotel.location"
                      name="location"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12">
                    <v-text-field
                      label="Hotel Price / Person"
                      required
                      v-model="hotel.price"
                      name="price"
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12">
                    <v-text-field
                      label="Hotel Image Url"
                      required
                      v-model="hotel.image_url"
                      name="image_url"
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
              <v-btn color="blue darken-1" text @click="saveHotel">
                Save
              </v-btn>
            </v-card-actions>
          </v-card>

          <!-- end -->
        </v-dialog>
      </v-col>
    </v-row>

    <v-row class="mb-5">
      <v-col cols="3" v-for="(hotel, index) in hotels" :key="index">
        <v-card class="mx-auto" max-width="344">
          <v-img
            :src=hotel.image_url
            height="200px"
          ></v-img>

          <v-card-title> {{ hotel.name }} </v-card-title>

          <v-card-subtitle> {{ hotel.city }} - {{ hotel.location }} - {{ hotel.price }} SDG/Person </v-card-subtitle>
          <!-- <v-card-subtitle> </v-card-subtitle>
          <v-card-subtitle> </v-card-subtitle> -->

      
        </v-card>
      </v-col>

     

    

      

     
    </v-row>
  </v-container>
</template>

<script>
import HotelsService from "../../services/HotelsService";
export default {
  name: "Notifications",
  data() {
    return {
      dialog: false,
      hotel: {
        id: null,
        name: "",
        image_url: "",
        city: "",
        location: "",
        price: "",
      },
      hotels:[],
    };
  },
  methods: {
    retrieveHotels() {
      HotelsService.getAll().then((response) => {
        this.hotels = response.data;
        console.log(response.data);
      });
      // .catch((e) => {
      //   //   console.log(e);
      // });
    },

    saveHotel() {
      var data = {
        name: this.hotel.name,
        image_url: this.hotel.image_url,
        description: this.hotel.description,
        price: this.hotel.price,
        location: this.hotel.location,
        city: this.hotel.city,
      };
      HotelsService.create(data)
        .then((response) => {
          this.hotel.id = response.data.id;
          console.log(response.data);
          this.dialog = false;
          this.retrieveHotels();
          // this.retrieveCat();
          //   this.submitted = true;
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },

  mounted() {
    this.retrieveHotels();
  },
};
</script>

<style src="./Notifications.scss" lang="scss"></style>
