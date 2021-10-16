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
    transactions =  ListModel(controller: this, initialList: []);
  }

  void addItemToBusket(Item item) {
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
}
