import 'package:flutter/material.dart';
import 'package:homebank/ui/register/register.screen.dart';
import 'package:homebank/ui/style/colors.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({Key key}) : super(key: key);

  @override
  _ChooseScreenState createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
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
                        'Покупатель',
                        style: TextStyle(color: HomeBankColor.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterScreen(
                              isCustomer: true,
                            )),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
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
                        'Компания',
                        style: TextStyle(color: HomeBankColor.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen(isCustomer: false)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
