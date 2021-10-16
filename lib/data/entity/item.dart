import 'package:homebank/data/network/json_converted.dart';
import 'package:homebank/data/network/parser.dart';

class Item {
  final int id;
  final String name;
  final String barcode;
  final int cost;
  bool isRefundable;
  bool isCredit;

  Item({
    this.id,
    this.name,
    this.barcode,
    this.cost,
    this.isRefundable,
    this.isCredit,
  });
}
