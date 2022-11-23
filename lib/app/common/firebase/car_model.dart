import 'dart:convert';

class Car {
  final int id;
  final String name;

  Car({required this.id, required this.name});


  
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source));
}
