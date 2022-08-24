import 'package:flutter/material.dart';
import 'package:suitable_flat/provider/bookings.dart';
import '../provider/trips.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import '../provider/bookings.dart';

class FormScreen extends StatefulWidget {
  Trip trip;
  num _total;
  FormScreen(this.trip);

  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;

  String _people;
  String _phoneNumber;
  String _total;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      autocorrect: false,
      // maxLength: 10,
      // initialValue: widget.trip.id,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _builURL() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'People no'),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      validator: (String value) {
        if (value.isEmpty) {
          return 'People is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _people = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  // String CalPrice() {
  //   _total = int.parse(_people) as double * widget.trip.price as double;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reservation Form")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _builURL(),
                _buildPhoneNumber(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    print(_name);

                    print(_phoneNumber);
                    final title = widget.trip.title;
                    print('title---------------------');
                    print(title);
                    //Send to API
                    final title1 = widget.trip.title;
                    print('title---------------------');
                    final title2 = widget.trip.image_url;
                    print(title2);
                    Provider.of<Bookings>(context, listen: false).makeBooking(
                        Booking(
                            full_name: _name,
                            people_no: _people,
                            phone: _phoneNumber,
                            trip_id: widget.trip.id,
                            // price: widget.trip.price * int.parse(_people),
                            title: title1,
                            image_url: title2));
                    print('tossss');

                    print(widget.trip.title);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
