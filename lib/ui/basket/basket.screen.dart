import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:homebank/controllers/basket.controller.dart';
import 'package:homebank/ui/item/item.screen.dart';
import 'package:homebank/ui/payment/payment.screen.dart';
import 'package:homebank/ui/style/colors.dart';

class BasketScreen extends StatefulWidget {
  final BasketController ctrl;

  const BasketScreen({Key key, @required this.ctrl}) : super(key: key);
  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  void didUpdateWidget(BasketScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeBankColor.lightest_grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Ваша корзина:',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.ctrl.busketItems.list.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: HomeBankColor.grey2,
                            ),
                            child: Image.asset('assets/image/im_product.png'),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(widget.ctrl.busketItems.list[index].name),
                                Text('4/64 RAM'),
                                Text(
                                    '${widget.ctrl.busketItems.list[index].cost} kzt'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemScreen(
                              ctrl: widget.ctrl,
                              item: widget.ctrl.busketItems.list[index],
                              operation: OperationType.delete,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                InkWell(
                  hoverColor: HomeBankColor.red,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: HomeBankColor.red,
                    child: Center(
                      child: Text(
                        'Купить товары',
                        style: TextStyle(
                            color: HomeBankColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(
                          ctrl: widget.ctrl,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
