import 'package:homebank/controllers/basket.controller.dart';
import 'package:homebank/data/entity/item.dart';

import 'package:homebank/providers/list_model.dart';

class CatalogController extends BasketController {
  ListModel<Item> items;

  CatalogController() {
    items = ListModel(controller: this, initialList: [
      Item(id: 1, name: 'IPHONE 10', barcode: '4321543253', cost: 100),
      Item(id: 1, name: 'IPHONE 9', barcode: '4321543253', cost: 30),
      Item(id: 1, name: 'IPHONE 8', barcode: '4321543253', cost: 600),
      Item(id: 1, name: 'IPHONE 7', barcode: '4321543253', cost: 7600),
    ]);
  }

}
