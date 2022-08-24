import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:suitable_flat/screens/form_screen.dart';
// import 'package:trip_flat/models/suit_models.dart';
import '../provider/trips.dart';

// 978$

class DetailScreen extends StatefulWidget {
  final Trip trip;
  List<Trip> trips;
  DetailScreen(this.trip);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isLike = false;

  Icon icon = Icon(FontAwesomeIcons.solidHeart);

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: ClipRRect(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(60.0)),
              child: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Hero(
                        tag: widget.trip.id,
                        child: Image.network(
                          widget.trip.image_url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: FloatingActionButton(
                          child: icon,
                          onPressed: () {
                            setState(() {
                              isLike = !isLike;
                              icon = !isLike
                                  ? Icon(FontAwesomeIcons.solidHeart)
                                  : Icon(
                                      FontAwesomeIcons.solidHeart,
                                      color: Colors.red,
                                    );
                            });
                          },
                        ))
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  _buildTitleInfo(),
                  SizedBox(
                    height: 30.0,
                  ),
                  // _buildMenuBar(),
                  // _buildHotel(),
                  SizedBox(
                    height: 20.0,
                  ),
                  _buildServiceBar(),

                  SizedBox(
                    height: 30.0,
                  ),
                  _buildBookButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildTitleInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.trip.title,
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(widget.trip.title),
          ],
        ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: <Widget>[
        //     // Text(
        //     //   '\$${widget.trip.price.toString()}',
        //     //   style: TextStyle(
        //     //       fontSize: 19.0,
        //     //       fontWeight: FontWeight.w600,
        //     //       letterSpacing: 1.2),
        //     // ),
        //     SizedBox(
        //       height: 10.0,
        //     ),
        //     Text("Per month"),
        //   ],
        // ),
      ],
    );
  }

  // _buildHotel() {
  //   return Card(
  //     child: ListTile(
  //         onTap: () {
  //           // print("${item.name} pressed");
  //         },
  //         leading: Image.network(
  //           'https://pix8.agoda.net/hotelImages/124/1246280/1246280_16061017110043391702.jpg?ca=6&ce=1&s=1024x768',
  //         ),
  //         title: Text('AL-salam Hotel'),
  //         subtitle: Text('five starts hotel'),
  //         trailing: Chip(
  //           backgroundColor: Colors.green,
  //           label: Text(
  //             "included",
  //             style: TextStyle(
  //                 color: Theme.of(context).indicatorColor,
  //                 fontWeight: FontWeight.bold,
  //                 letterSpacing: 1.2,
  //                 fontSize: 13.0),
  //           ),
  //         )),
  //   );
  // }

  // _buildMenuBar() {
  //   return Container(
  //     height: 45.0,
  //     child: ListView.builder(
  //       itemCount: 1,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (BuildContext context, int index) {
  //         String menu = widget.trips[index].city;
  //         return GestureDetector(
  //           onTap: () {
  //             setState(() {
  //               _selectedIndex = index;
  //             });
  //           },
  //           child: Container(
  //             margin: EdgeInsets.only(right: 40.0),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Text(
  //                   menu,
  //                   style: TextStyle(
  //                       fontSize: 20.0,
  //                       color: _selectedIndex == index
  //                           ? Theme.of(context).accentColor
  //                           : Colors.grey),
  //                 ),
  //                 SizedBox(
  //                   height: 5.0,
  //                 ),
  //                 _selectedIndex == index
  //                     ? Container(
  //                         color: Theme.of(context).accentColor,
  //                         height: 4.0,
  //                         width: 30.0,
  //                       )
  //                     : SizedBox.shrink()
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  _buildServiceBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'description',
          style: TextStyle(
              fontSize: 22.0, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        Text(widget.trip.description),
        // SizedBox(
        //   height: 10.0,
        // ),
        // Text("Bathroom"),
        // SizedBox(
        //   height: 10.0,
        // ),
        // Text(
        //   "12 sqft",
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        // ),
        //   ],
        // ),
        // Column(
        //   children: <Widget>[
        //     Container(
        //       width: 70.0,
        //       height: 70.0,
        //       decoration: BoxDecoration(
        //           color: Colors.blue[100],
        //           borderRadius: BorderRadius.circular(45.0)),
        //       child: Icon(
        //         FontAwesomeIcons.bed,
        //         color: Colors.blueAccent,
        //       ),
        //     ),
        //     SizedBox(
        //       height: 10.0,
        //     ),
        //     Text("BedRoom"),
        //     SizedBox(
        //       height: 10.0,
        //     ),
        //     Text(
        //       "20 sqft",
        //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        //     ),
        //   ],
        // ),
        // Column(
        //   children: <Widget>[
        //     Container(
        //       width: 70.0,
        //       height: 70.0,
        //       decoration: BoxDecoration(
        //           color: Colors.blue[100],
        //           borderRadius: BorderRadius.circular(45.0)),
        //       child: Icon(
        //         FontAwesomeIcons.dollyFlatbed,
        //         color: Colors.blueAccent,
        //       ),
        //     ),
        //     SizedBox(
        //       height: 10.0,
        //     ),
        //     Text("Livingroom"),
        //     SizedBox(
        //       height: 10.0,
        //     ),
        //     Text(
        //       "80 sqft",
        //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  _buildBookButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(45.0),
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => FormScreen(widget.trip)));
        },
        color: Colors.blue[800],
        child: Container(
          width: 180.0,
          height: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 120.0,
                child: Text(
                  "Book now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(45.0),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue[800],
                  size: 21.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
