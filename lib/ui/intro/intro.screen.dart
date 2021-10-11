import 'package:flutter/material.dart';
import 'package:homebank/ui/register/register.screen.dart';
import 'package:homebank/ui/style/colors.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      'assets/image/im_logo.png',
                    ),
                  ],
                ),
                Text(
                  'Бесконтакный\nкредит',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Хотите получить кредит в три клика?\nНаше приложение поможет Вам\nоформить кредит без консультантов и длинных очередей.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
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
                          'Зарегистрироваться ',
                          style: TextStyle(
                              color: HomeBankColor.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  child: Text(
                    'Войти',
                    style: TextStyle(color: HomeBankColor.red, fontSize: 16),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
