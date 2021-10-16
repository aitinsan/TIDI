import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:homebank/ui/style/colors.dart';

class LinkCardScreen extends StatefulWidget {
  const LinkCardScreen({Key key}) : super(key: key);

  @override
  _LinkCardScreenState createState() => _LinkCardScreenState();
}

class _LinkCardScreenState extends State<LinkCardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  OutlineInputBorder border;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formIINKey = GlobalKey<FormState>();
  TextEditingController iinController = TextEditingController();

  void onCreditCardModelChange(CreditCardModel model) {
    setState(() {
      cardNumber = model.cardNumber;
      expiryDate = model.expiryDate;
      cardHolderName = model.cardHolderName;
      cvvCode = model.cvvCode;
      isCvvFocused = model.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: HomeBankColor.red,
        width: 1.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          alignment: Alignment.center,
          child: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: HomeBankColor.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: HomeBankColor.white,
        elevation: 0,
        title: Text(
          "Привязать карту",
          style: TextStyle(color: HomeBankColor.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              CreditCardWidget(
                cardBgColor: HomeBankColor.red,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16, left: 16, top: 16),
                        child: Form(
                          key: formIINKey,
                          child: TextFormField(
                            controller: iinController,
                            onEditingComplete: () {},
                            style: TextStyle(
                              color: HomeBankColor.black,
                            ),
                            decoration: InputDecoration(
                              labelText: 'ИИН',
                              hintText: 'ИИН',
                              focusedBorder: border,
                              enabledBorder: border,
                            ),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            validator: (String value) {
                              if (value.isEmpty || value.length < 12) {
                                return "Введите ваш ИИН";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: Colors.blue,
                        textColor: HomeBankColor.black,
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          focusedBorder: border,
                          enabledBorder: border,
                        ),
                        expiryDateDecoration: InputDecoration(
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Card Holder',
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                  'Привязать',
                                  style: TextStyle(color: HomeBankColor.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
