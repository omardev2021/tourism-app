import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Booking {
  final String id;
  final String full_name;
  final String people_no;
  final String trip_id;
  final String phone;
  // final String price;
  final String image_url;
  final String title;
   final String status;

  Booking(
      {this.id,
      @required this.full_name,
      @required this.people_no,
      @required this.trip_id,
      @required this.phone,
      // @required this.price,
      this.status,
      this.image_url,
      this.title});

  // factory Category.fromJson(Map<String, dynamic> json) {
  //   return Category(
  //       id: json['id'], name: json['name'], color: json['color'] ?? "");
  // }

}

class Bookings with ChangeNotifier {
  List<Booking> _bookings = [];

  List<Booking> get items {
    print('getter');
    print(_bookings);
    return [..._bookings];
  }

  Future<void> fetchAndSetBookings() async {
    Category result;
    print('runing');
    final url = Uri.parse('http://127.0.0.1:8000/api/bookings');
    print('runing2');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    // final url = Uri.https('http://127.0.0.1:8000/api', '/categories');
    final response = await http.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      print(response);

      final item = json.decode(response.body) as List;
      final List<Booking> loadedTrips = [];

      item.forEach((element) {
        loadedTrips.add(Booking(
            id: element['id'].toString(),
            full_name: element['full_name'],
            people_no: element['people_no'],
            trip_id: element['trip_id'].toString(),
            phone: element['phone'],
            status: element['status'],
            image_url: element['image_url'],
            title: element['title']));
      });
      print('from future');
      _bookings = loadedTrips;
      print('tesia------------------');

      print(_bookings);
    } else {
      print('not found');
    }

    notifyListeners();
  }

  Future<Booking> makeBooking(Booking booking) async {
    Map data = {
      'full_name': booking.full_name,
      'people_no': booking.people_no,
      'trip_id': booking.trip_id,
      'phone': booking.phone,
      // 'price': booking.price,
      'title': booking.title,
      'image_url': booking.image_url
    };

    final url = Uri.parse('http://127.0.0.1:8000/api/bookings');
    print('runing2');
    Map<String, String> requestHeaders = {
      // 'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    // final url = Uri.https('http://127.0.0.1:8000/api', '/categories');
    final response = await http.post(url, headers: requestHeaders, body: data);

    if (response.statusCode == 201) {
      print('done!!');
    } else {
      throw Exception('Failed to update a case');
    }
    notifyListeners();
    // fetchAndSetProducts();
  }
}
