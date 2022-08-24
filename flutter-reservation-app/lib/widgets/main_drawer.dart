import 'package:flutter/material.dart';

import '../screens/bookings.dart';
import '../screens/profile.dart';
import '../screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/login_screen.dart';
import '../screens/hotels.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Tourism App',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Trips', Icons.trip_origin_outlined, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }),
          buildListTile('Reservations', Icons.book_online_rounded, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookingsPage()),
            );
          }),
          buildListTile('Hotels', Icons.book_online_rounded, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Hotels()),
            );
          }),
          buildListTile('Logout', Icons.logout, () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
            var logindata = await SharedPreferences.getInstance();
            // final String token = prefs.getString('token');
            print('yessssss');
            // print(token);
            //  await CatsData.logout().then((_) {
            //   print('from future');
            //   // print(token);
            // });
            await logindata.setBool('login', true);
            logindata.setString('token', 'null');
            // Navigator.pushReplacement(context,
            //     new MaterialPageRoute(builder: (context) => MyLoginPage()));

            print('yessssss222222');
            // await CatsData.logout();
            // final _token = CatsData.token;
            // print(token);
            // print(token);
            // Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
          }),
          // buildListTile('Authentication', Icons.app_registration, () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => LoginPage()),
          //   );
          // }),
        ],
      ),
    );
  }
}
