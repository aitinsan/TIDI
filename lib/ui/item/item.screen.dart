import 'package:flutter/material.dart';
import 'package:homebank/controllers/basket.controller.dart';
import 'package:homebank/data/entity/item.dart';

class ItemScreen extends StatelessWidget {
  final BasketController ctrl;
  final Item item;
  const ItemScreen({Key key, @required this.ctrl, @required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(item.name),
            ElevatedButton(
              child: Text('Добавить в корзину'),
              onPressed: () {
                ctrl.addItemToBusket(item);
              },
            )
          ],
        ),
      ),
    );
  }
}
