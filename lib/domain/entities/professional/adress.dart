import 'package:flutter/cupertino.dart';

class Adress {
  String zipcode;
  String place;
  String city;
  String state;
  String neighborhood;

  Adress({
    @required this.zipcode,
    @required this.place,
    @required this.city,
    @required this.state,
    @required this.neighborhood,
  });

  Adress.fromMap(Map<String, dynamic> map) {
    zipcode = map['zipcode'] as String;
    place = map['place'] as String;
    city = map['city'] as String;
    state = map['state'] as String;
    neighborhood = map['neighborhood'] as String;
  }

  Map<String, dynamic> toMap() {
    return {
      'zipcode': zipcode,
      'place': place,
      'city': city,
      'state': state,
      'neighborhood': neighborhood,
    };
  }

  @override
  String toString() {
    return 'zipcode: $zipcode, place: $place, city: $city, state: $state, neighborhood: $neighborhood';
  }
}
