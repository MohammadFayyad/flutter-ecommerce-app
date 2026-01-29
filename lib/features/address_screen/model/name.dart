import 'dart:convert';

class Name {
  final String firstname;
  final String lastname;
  Name({
    required this.firstname,
    required this.lastname,
  });

  Name copyWith({
    String? firstname,
    String? lastname,
  }) {
    return Name(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      firstname: map['firstname'] ?? '',
      lastname: map['lastname'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Name.fromJson(String source) => Name.fromMap(json.decode(source));

  @override
  String toString() => 'Name(firstname: $firstname, lastname: $lastname)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Name &&
      other.firstname == firstname &&
      other.lastname == lastname;
  }

  @override
  int get hashCode => firstname.hashCode ^ lastname.hashCode;
}