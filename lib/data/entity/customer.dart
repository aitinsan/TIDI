import 'package:homebank/data/network/json_converted.dart';
import 'package:homebank/data/network/parser.dart';

class Customer {
  /// очень примерно чтобы просто видеть как создавать ентити
  final int id;
  final String phoneNumber;
  final String iin;

  Customer({this.id, this.phoneNumber, this.iin});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: Parse.integer(json['id']),
      phoneNumber: Parse.string(json['phoneNumber']),
      iin: Parse.string(json['iin']),
    );
  }

  static JsonConverter<Customer> converter = (json) => Customer.fromJson(json);

  @override
  String toString() {
    return 'Customer{id: $id, phone_number: $phoneNumber, iin: $iin';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone_number': phoneNumber,
      'iin': iin,
    };
  }
}
