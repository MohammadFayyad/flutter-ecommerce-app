import 'dart:convert';

import 'geolocation.dart';

class Address {
  final Geolocation geolocation;
  final String city;
  final String street;
  final int number;
  final String zipcode;
  Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  Address copyWith({
    Geolocation? geolocation,
    String? city,
    String? street,
    int? number,
    String? zipcode,
  }) {
    return Address(
      geolocation: geolocation ?? this.geolocation,
      city: city ?? this.city,
      street: street ?? this.street,
      number: number ?? this.number,
      zipcode: zipcode ?? this.zipcode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'geolocation': geolocation.toMap(),
      'city': city,
      'street': street,
      'number': number,
      'zipcode': zipcode,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      geolocation: Geolocation.fromMap(map['geolocation']),
      city: map['city'] ?? '',
      street: map['street'] ?? '',
      number: map['number']?.toInt() ?? 0,
      zipcode: map['zipcode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Address(geolocation: $geolocation, city: $city, street: $street, number: $number, zipcode: $zipcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Address &&
      other.geolocation == geolocation &&
      other.city == city &&
      other.street == street &&
      other.number == number &&
      other.zipcode == zipcode;
  }

  @override
  int get hashCode {
    return geolocation.hashCode ^
      city.hashCode ^
      street.hashCode ^
      number.hashCode ^
      zipcode.hashCode;
  }
}