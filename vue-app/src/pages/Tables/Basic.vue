<template>
  <v-container fluid>
    <div class="tables-basic">
      <h1 class="page-title mt-10 mb-6">Bookings</h1>
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
                    <th class="text-left">Action</th>
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
                    <td>
                      <v-row v-if="booking.status === 'pending'">
                        <v-btn
                          elevation="2"
                          small
                          color="success"
                          @click="confirm(booking.id)"
                          >Confirm</v-btn
                        ><v-btn
                          elevation="2"
                          small
                          color="error"
                          @click="reject(booking.id)"
                          >Reject</v-btn
                        ></v-row
                      >
                    </td>
                  </tr>
                </tbody>
              </template>
            </v-simple-table>
          </v-card>
        </v-col>
      </v-row>
    </div>
  </v-container>
</template>

<script>
import mock from "./mock";
import jsPDF from "jspdf";
// import autoTable from 'jspdf-autotable';
import BookingsService from "../../services/BookingsService";

export default {
  name: "Tables",
  data() {
    return {
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
    };
  },
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
    generatePDF() {
      // const columns = [
      //   { title: "Title", dataKey: "title" },
      //   { title: "Body", dataKey: "body" },
      // ];
      const pdf = new jsPDF({
        orientation: "landscape",
        unit: "in",
        format: [4, 2],
      });

      pdf.table(20, 100, [
        {
          id: 1,
          name: "Peter",
        },
        {
          id: 2,
          name: "Chris",
        },
      ]);
      pdf.save("my-table.pdf");

      // // text is placed using x, y coordinates
      // doc.setFontSize(16).text(this.heading, 0.5, 1.0);
      // // create a line under heading
      // doc.setLineWidth(0.01).line(0.5, 1.1, 8.0, 1.1);
      // // Using autoTable plugin
      // doc.autoTable({
      //   columns,
      //   body: this.items,
      //   margin: { left: 0.5, top: 1.25 }
      // });
      // // Using array of sentences
      // doc
      //   .setFont("helvetica")
      //   .setFontSize(12)
      //   .text(this.moreText, 0.5, 3.5, { align: "left", maxWidth: "7.5" });

      // // Creating footer and saving file
      // doc
      //   .setFont("times")
      //   .setFontSize(11)
      //   .setFontStyle("italic")
      //   .setTextColor(0, 0, 255)
      //   .text(
      //     "This is a simple footer located .5 inches from page bottom",
      //     0.5,
      //     doc.internal.pageSize.height - 0.5
      //   )
      //   .save(`${this.heading}.pdf`);

      // doc.table(20, 100, this.items);
      // doc.save("a4.pdf");
    },
  },
  mounted() {
    this.retrieveBookings();
  },
};
</script>

<style src="./Basic.scss" lang="scss"></style>
