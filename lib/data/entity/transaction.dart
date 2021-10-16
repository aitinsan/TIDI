import 'package:homebank/data/entity/item.dart';

class Transaction {
  final int id;
  final Item item;
  bool isRefundable;
  bool isCredit;

  Transaction({
    this.id,
    this.item,
  }) {
    this.isRefundable = item.isRefundable;
    this.isCredit = item.isCredit;
  }
  
  void changeCreditType() {
    isCredit = true;
    isRefundable = false;
  }
}
