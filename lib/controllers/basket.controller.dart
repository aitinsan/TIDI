import 'package:homebank/data/entity/item.dart';
import 'package:homebank/data/entity/transaction.dart';
import 'package:homebank/providers/base_controller.dart';

import 'package:homebank/providers/list_model.dart';

class BasketController extends BaseController {
  ListModel<Item> busketItems;
  int id = 0;
  ListModel<Transaction> transactions;

  BasketController() {
    busketItems = ListModel(controller: this, initialList: []);
    transactions = ListModel(controller: this, initialList: []);
    items = ListModel(controller: this, initialList: [
      Item(
          id: 1,
          name: 'IPHONE 10',
          barcode: '123456789104',
          cost: 100,
          isCredit: false,
          isRefundable: true),
      Item(
          id: 1,
          name: 'IPHONE 9',
          barcode: '4321544253',
          cost: 30,
          isCredit: false,
          isRefundable: true),
      Item(
          id: 1,
          name: 'IPHONE 8',
          barcode: '4321513253',
          cost: 600,
          isCredit: false,
          isRefundable: true),
      Item(
          id: 1,
          name: 'IPHONE 7',
          barcode: '4321542253',
          cost: 7600,
          isCredit: false,
          isRefundable: true),
    ]);
  }

  void addItemToBusket(
    Item item,
  ) {
    busketItems.add(item);

    print(busketItems.list.first.name);
  }

  void changeTransactionToCredit(Transaction transaction) {
    transaction.changeCreditType();
    print(busketItems.list.first.name);
  }

  int getId() {
    id++;
    return id;
  }

  void removeItemFromBusket(Item item) {
    busketItems.remove(item);
    print(busketItems.list.first.name);
  }

  void changeCreditType(Transaction transaction) {
    transaction.changeCreditType();
  }

  ListModel<Item> items;
}
