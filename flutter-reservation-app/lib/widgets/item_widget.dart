import 'package:flutter/material.dart';
// import 'package:flutter_catalog/models/catalog.dart';
import '../provider/bookings.dart';

class ItemWidget extends StatefulWidget {
  // final Item item;

  // const ItemWidget({Key key, @required this.item})
  //     : assert(item != null),
  //       super(key: key);

  String id;
  String full_name;
  String people_no;
  String trip_id;
  String phone;
  String status;
  String image_url;
  String title;
  ItemWidget(this.id, this.full_name, this.people_no, this.trip_id, this.phone,
      this.status, this.image_url, this.title);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: () {
            // print("${item.name} pressed");
          },
          leading: Image.network(
            widget.image_url,
          ),
          title: Text(widget.title),
          subtitle: Text(widget.phone),
          trailing: Chip(
            backgroundColor: Colors.green,
            label: Text(
              widget.status,
              style: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  fontSize: 13.0),
            ),
          )),
    );
  }
}
