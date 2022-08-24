import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:suitable_flat/main.dart';
import 'package:suitable_flat/models/suit_models.dart';
import 'package:suitable_flat/provider/theme_provider.dart';
import 'package:suitable_flat/screens/details_screen.dart';
import 'package:suitable_flat/widgets/StartRating.dart';
import '../provider/trips.dart';
import 'package:provider/provider.dart';
import '../provider/hotels.dart';

import '../widgets/main_drawer.dart';

class Hotels extends StatefulWidget {
  @override
  _HotelsState createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
  int ratttting = 0;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    Provider.of<Hotelss>(context, listen: false).fetchAndSetHotels().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {},
        // ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              // child: Image(
              //   image: AssetImage("assest/images/man.jpg"),
              //   height: 40.0,
              //   width: 40.0,
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0, left: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Hotels",
                      style: TextStyle(
                          color: Theme.of(context).indicatorColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "In Sudan",
                      style: TextStyle(
                          color: Theme.of(context).indicatorColor,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          fontSize: 30.0),
                    ),
                  ],
                ),
                Switch(
                  value: themeProvider.isLightTheme,
                  onChanged: (val) {
                    themeProvider.setThemeData = val;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hotels()),
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Expanded(child: _buildListView())
        ],
      ),
    );
  }

  _buildImageListView(Hotel hotel) {
    return Positioned(
      right: 30.0,
      child: Container(
        width: 180.0,
        height: 260,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset.fromDirection(0.0, 0.2),
                blurRadius: 18,
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(
            children: <Widget>[
              Container(
                height: 260.0,
                child: Hero(
                  tag: hotel.id,
                  child: Image.network(
                    hotel.image_url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: 50.0,
                    width: 180.0,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 16,
                          offset: Offset.fromDirection(0.0, 0.2))
                    ]),
                  )),
              Positioned(
                bottom: 10.0,
                right: 4.0,
                left: 4.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      child: Text(
                        hotel.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.locationArrow),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: 15.0,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildBoxInfo(Hotel hotel) {
    return Positioned(
      right: 150.0,
      left: 20.0,
      top: 30.0,
      child: Container(
        height: 160.0,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).accentColor,
                  offset: Offset.fromDirection(0.0, 0.2),
                  blurRadius: 5)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${hotel.price.toString()} SDG',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "per Person",
                  style: TextStyle(),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(hotel.name),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // StarRating(
                //   starCount: 5,
                //   rating: hotrel.,
                //   color: Colors.orange,
                //   iconSize: 12.0,
                // ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  hotel.location,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.0),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200.0,
                  height: 50.0,
                  child: Text(
                    hotel.name,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 13.0),
                  ),
                ),
                // SizedBox(
                //   width: 5.0,
                // ),
                // SizedBox(
                //   width: 5.0,
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildListView() {
    final CatsData = Provider.of<Hotelss>(context);
    final hoteldata = CatsData.items;
    return ListView.builder(
      itemCount: hoteldata.length,
      itemBuilder: (BuildContext context, int index) {
        Hotel hotel1 = hoteldata[index];
        return GestureDetector(
          onTap: () {
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => DetailScreen(hotrel)));
          },
          child: Container(
            height: 280.0,
            child: Stack(
              children: <Widget>[
                _buildImageListView(hotel1),
                _buildBoxInfo(hotel1)
              ],
            ),
          ),
        );
      },
    );
  }
}
