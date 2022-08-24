import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Trip {
  final String id;
  final String title;
  final String description;
  final String image_url;
  final String from_date;
  final String to_date;
  final String city;
  final String price;

  Trip({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image_url,
    @required this.from_date,
    @required this.to_date,
    @required this.city,
    @required this.price,
  });

  // factory Category.fromJson(Map<String, dynamic> json) {
  //   return Category(
  //       id: json['id'], name: json['name'], color: json['color'] ?? "");
  // }

}

class Trips with ChangeNotifier {
  List<Trip> _trips = [];

  List<Trip> get items {
    print('getter');
    print(_trips);
    return [..._trips];
  }

  Future<void> fetchAndSetTrips() async {
    Category result;
    print('runing');
    final url = Uri.parse('http://127.0.0.1:8000/api/trips');
    print('runing2');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    // final url = Uri.https('http://127.0.0.1:8000/api', '/categories');
    final response = await http.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      print(response);
      print('besmalla');
      final item = json.decode(response.body) as List;
      final List<Trip> loadedTrips = [];
      // _trips = item;
      // print(_trips);
      item.forEach((element) {
        loadedTrips.add(Trip(
            id: element['id'].toString(),
            title: element['title'],
            description: element['description'],
            image_url: element['image_url'],
            from_date: element['from_date'],
            to_date: element['to_date'],
            city: element['city'],
            price: element['price']
            ));
      });
      print('from future');
      _trips = loadedTrips;
      print('tesia');
      print(_trips[0].id);
      print(_trips[0].title);
      print(_trips[0].image_url);
      print(_trips[0].description);
      print(_trips[0].from_date);
      print(_trips[0].to_date);
      print(_trips[0].price);
      print(_trips[0].city);
      print(loadedTrips);
    } else {
      print('not found');
    }

    notifyListeners();
  }
}
