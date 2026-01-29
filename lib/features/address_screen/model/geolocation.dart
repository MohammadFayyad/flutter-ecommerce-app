import 'dart:convert';

class Geolocation {
  final String lat;
  final String long;
  Geolocation({
    required this.lat,
    required this.long,
  });

  Geolocation copyWith({
    String? lat,
    String? long,
  }) {
    return Geolocation(
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'long': long,
    };
  }

  factory Geolocation.fromMap(Map<String, dynamic> map) {
    return Geolocation(
      lat: map['lat'] ?? '',
      long: map['long'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Geolocation.fromJson(String source) => Geolocation.fromMap(json.decode(source));

  @override
  String toString() => 'Geolocation(lat: $lat, long: $long)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Geolocation &&
      other.lat == lat &&
      other.long == long;
  }

  @override
  int get hashCode => lat.hashCode ^ long.hashCode;
}