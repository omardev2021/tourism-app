import 'package:flutter/material.dart';
import '../widgets/item_widget.dart';

import 'package:provider/provider.dart';
import '../provider/bookings.dart';

class BookingsPage extends StatefulWidget {
  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  final int days = 30;

  final String name = "Codepur";
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    Provider.of<Bookings>(context, listen: false)
        .fetchAndSetBookings()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CatsData = Provider.of<Bookings>(context);
    final trips = CatsData.items;
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Reservations"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: trips.length,
          itemBuilder: (context, index) {
            return ItemWidget(
                trips[index].id,
                trips[index].full_name,
                trips[index].people_no,
                trips[index].trip_id,
                trips[index].phone,
                trips[index].status,
                trips[index].image_url,
                trips[index].title);
          },
        ),
      ),
      // drawer: MyDrawer(),
    );
  }
}
