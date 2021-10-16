import 'package:flutter/material.dart';
import 'package:homebank/ui/style/colors.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HomeBankColor.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.ios_share,
              color: Colors.blue,
            ),
          )
        ],
        automaticallyImplyLeading: false,
        title: Text(
          "Квитанция",
          style: TextStyle(
            color: HomeBankColor.black,
            fontSize: 34,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: HomeBankColor.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 32),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  Image.asset("assets/image/receipt.png"),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "22.02.2020",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Text(
                          "Квитанция",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "-------------------------------------",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Amount",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "\$ 40.00",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Service Fee",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "\$ 2.82",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Internet Charge",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "\$ 7.18",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "-------------------------------------",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "\$ 50.00",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "-------------------------------------",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Image.asset("assets/image/barcode.png"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: InkWell(
                radius: 16,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: HomeBankColor.red,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        'Home',
                        style: TextStyle(color: HomeBankColor.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  int count = 0;
                  Navigator.popUntil(context, (route) {
                    return count++ == 2;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
