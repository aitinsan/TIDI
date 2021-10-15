import 'package:flutter/material.dart';
import 'package:homebank/ui/bottomBusinessNavigation.dart';
import 'package:homebank/ui/style/colors.dart';

import '../bottomNavigation.dart';

class RegisterScreen extends StatefulWidget {
  final bool isCustomer;

  RegisterScreen({Key key, this.isCustomer}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          alignment: Alignment.bottomCenter,
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              widget.isCustomer ? 'Регистрация' : "Здраствуйте, уважаемый партнер",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 28,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.isCustomer
                  ? 'Кредит доступнее с нашим приложением'
                  : "Введите свои данные для входа",
              style: TextStyle(
                // fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  focusColor: HomeBankColor.red,
                  hintText: 'ФИО',
                ),
              ),
            ),
            if (widget.isCustomer)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    focusColor: HomeBankColor.red,
                    hintText: 'ИИН',
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  focusColor: HomeBankColor.red,
                  hintText: 'Почта',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  focusColor: HomeBankColor.red,
                  hintText: 'Пароль',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
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
                        'Зарегистрироваться ',
                        style: TextStyle(color: HomeBankColor.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => widget.isCustomer ? Home() : HomeBusiness()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
