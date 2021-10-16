import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:homebank/controllers/basket.controller.dart';
import 'package:homebank/data/entity/transaction.dart';
import 'package:homebank/ui/payment/receipt.screen.dart';
import 'package:homebank/ui/style/colors.dart';

class PaymentScreen extends StatefulWidget {
  final BasketController ctrl;
  const PaymentScreen({Key key, @required this.ctrl}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
        color: HomeBankColor.red,
        width: 1.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HomeBankColor.white,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(20),
              ),
              child: Text("Отменить"))
        ],
      ),
      body: Container(
        color: HomeBankColor.white,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Оплата",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 160,
                height: 160,
                child: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image(
                      image: AssetImage("assets/image/im_avatar.jpg"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "оплачивает",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: HomeBankColor.lightGrey,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Tamina Temirkhan",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: HomeBankColor.black,
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "54,852",
                    style: TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.w400,
                      color: HomeBankColor.black,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "KZT",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w400,
                      color: HomeBankColor.black,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 16, left: 16, top: 16),
                child: TextField(
                  style: TextStyle(
                    color: HomeBankColor.black,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Комментарий',
                    hintText: 'Оставить комментарий',
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
              ),
              CreditCardWidget(
                cardBgColor: HomeBankColor.red,
                cardNumber: "4225 9765 0008 6141",
                expiryDate: "09/28",
                cardHolderName: "Tamina Temirkhan",
                cvvCode: "111",
                showBackView: false,
                obscureCardNumber: false,
                obscureCardCvv: true,
              ),
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
                          'Оплатить',
                          style: TextStyle(
                              color: HomeBankColor.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    for (var item in widget.ctrl.busketItems.list) {
                      widget.ctrl.transactions.list.add(
                        Transaction(
                          id: widget.ctrl.getId(),
                          item: item,
                        ),
                      );
                    }
                    widget.ctrl.busketItems.clear();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReceiptScreen(ctrl: widget.ctrl,),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
