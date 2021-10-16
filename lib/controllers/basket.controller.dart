import 'package:homebank/data/entity/item.dart';
import 'package:homebank/providers/base_controller.dart';

import 'package:homebank/providers/list_model.dart';

class BasketController extends BaseController {
  ListModel<Item> busketItems;

  BasketController() {
    busketItems = ListModel(controller: this, initialList: []);
  }
  
  void addItemToBusket(Item item) {
    busketItems.add(item);
    print(busketItems.list.first.name);
  }
  void removeItemFromBusket(Item item) {
    busketItems.remove(item);
    print(busketItems.list.first.name);
  }
}
