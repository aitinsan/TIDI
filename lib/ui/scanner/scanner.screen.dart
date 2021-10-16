import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:homebank/controllers/basket.controller.dart';
import 'package:homebank/ui/basket/basket.screen.dart';
import 'package:homebank/ui/style/colors.dart';

class ScannerScreen extends StatefulWidget {
  final BasketController ctrl;

  const ScannerScreen({Key key, @required this.ctrl}) : super(key: key);
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController();
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _controller.text = barcodeScanRes;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                Text(
                  "Сканируйте штрихкод",
                  style: TextStyle(
                    fontSize: 20,
                    color: HomeBankColor.red,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                InkWell(
                  onTap: () => scanBarcodeNormal(),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: HomeBankColor.red)
                        // color: HomeBankColor.grey2,
                        ),
                    height: 150,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Отсканируйте штрихкод',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Или введите вручную',
                  style: TextStyle(
                    color: HomeBankColor.red,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    focusColor: HomeBankColor.red,
                    hintText: 'Штрихкод',
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  hoverColor: HomeBankColor.red,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: HomeBankColor.red,
                    child: Center(
                      child: Text(
                        'Добавить в корзину',
                        style: TextStyle(
                            color: HomeBankColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  onTap: () {
                    final snackBar = SnackBar(
                      content: Text('Добавлено в корзину'),
                      backgroundColor: HomeBankColor.green,
                      action: SnackBarAction(
                        label: 'Перейти',
                        textColor: HomeBankColor.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BasketScreen(ctrl: widget.ctrl),
                            ),
                          );
                        },
                      ),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
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
