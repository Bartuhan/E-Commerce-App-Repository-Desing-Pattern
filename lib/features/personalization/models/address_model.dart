import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_ui_project/utils/formatters/formatter.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.dateTime,
    this.selectedAddress = true,
  });

  String get formattedPhoneNo => TFormatter.phoneFormatter(phoneNumber);

  static AddressModel empty() => AddressModel(id: '', name: '', phoneNumber: '', street: '', city: '', state: '', postalCode: '', country: '');

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'dateTime': DateTime.now(),
      'selectedAddress': selectedAddress,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] as String,
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      street: map['street'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      postalCode: map['postalCode'] as String,
      country: map['country'] as String,
      dateTime: (map['dateTime'] as Timestamp).toDate(),
      selectedAddress: map['selectedAddress'] as bool,
    );
  }

  factory AddressModel.fromDocumentSnapsot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return AddressModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      street: data['street'] ?? '',
      city: data['city'] ?? '',
      state: data['state'] ?? '',
      postalCode: data['postalCode'] ?? '',
      country: data['country'] ?? '',
      dateTime: (data['dateTime'] as Timestamp).toDate(),
      selectedAddress: data['selectedAddress'] as bool,
    );
  }

  @override
  String toString() {
    return '$street, $city, $state, $postalCode, $country';
  }
}
