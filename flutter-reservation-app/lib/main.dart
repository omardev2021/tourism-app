import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitable_flat/screens/home_screen.dart';
import './provider/theme_provider.dart';
import './provider/trips.dart';
import './provider/bookings.dart';
import './screens/bookings.dart';
import './screens/login_screen.dart';
import './provider/auth.dart';
import './provider/hotels.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(isLightTheme: true),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  ThemeMode themeMode = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Trips(),
        ),
        ChangeNotifierProvider.value(
          value: Bookings(),
        ),
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Hotelss(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: themeMode, // Change it
        theme: themeProvider.getThemeData, // as you want

        home: LoginPage(),
      ),
    );
  }
}
