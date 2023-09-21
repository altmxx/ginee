import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CarRide {
  int id;
  String pickUpLocation;
  String dropOffLocation;
  int fareAmount;
  String paymentMethod;
  String customerName;
  CarRide({
    required this.id,
    required this.pickUpLocation,
    required this.dropOffLocation,
    required this.fareAmount,
    required this.paymentMethod,
    required this.customerName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pickUpLocation': pickUpLocation,
      'dropOffLocation': dropOffLocation,
      'fareAmount': fareAmount,
      'paymentMethod': paymentMethod,
      'customerName': customerName,
    };
  }

  factory CarRide.fromMap(Map<String, dynamic> map) {
    return CarRide(
      id: map['id'] as int,
      pickUpLocation: map['pickUpLocation'] as String,
      dropOffLocation: map['dropOffLocation'] as String,
      fareAmount: map['fareAmount'] as int,
      paymentMethod: map['paymentMethod'] as String,
      customerName: map['customerName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarRide.fromJson(String source) =>
      CarRide.fromMap(json.decode(source) as Map<String, dynamic>);
}
