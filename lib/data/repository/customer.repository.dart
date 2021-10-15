import 'package:flutter/cupertino.dart';
import 'package:homebank/data/entity/customer.dart';
import 'package:homebank/data/network/http.dart';

class CustomerRepository {
  final Http _http;
  CustomerRepository({@required Http http}) : _http = http;

  Future<Customer> getCustomer() async {
    try {
      final result = await _http.getHttp('');
      return result;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<void> createCustomer(Customer customer) async {
    try {
      await _http.postHttp('', Customer.converter);
    } catch (error) {
      print(error);
      return null;
    }
  }
}
