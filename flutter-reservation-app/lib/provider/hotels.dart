import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Hotel {
  final String id;
  final String name;
  final String city;
  final String location;
  final String image_url;
  final String price;

  Hotel(
      {@required this.id,
      @required this.name,
      @required this.city,
      @required this.location,
      @required this.image_url,
      @required this.price});

  // factory Category.fromJson(Map<String, dynamic> json) {
  //   return Category(
  //       id: json['id'], name: json['name'], color: json['color'] ?? "");
  // }

}

class Hotelss with ChangeNotifier {
  List<Hotel> _hotels = [];

  List<Hotel> get items {
    print('getter');
    print(_hotels);
    return [..._hotels];
  }

  Future<void> fetchAndSetHotels() async {
    Category result;
    print('runing');
    final url = Uri.parse('http://127.0.0.1:8000/api/hotels');
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
      final List<Hotel> loadedHotels = [];
      // _Hotels = item;
      // print(_Hotels);
      item.forEach((element) {
        loadedHotels.add(Hotel(
            id: element['id'].toString(),
            name: element['name'],
            city: element['city'],
            location: element['location'],
            image_url: element['image_url'],
            price: element['price']));
      });
      print('from future');
      _hotels = loadedHotels;
      print('tesia');
      // print(_Hotels[0].id);
      // print(_Hotels[0].title);
      // print(_Hotels[0].image_url);
      // print(_Hotels[0].description);
      // print(_Hotels[0].from_date);
      // print(_Hotels[0].to_date);
      // print(_Hotels[0].price);
      // print(_Hotels[0].city);
      print(loadedHotels);
    } else {
      print('not found');
    }

    notifyListeners();
  }
}
