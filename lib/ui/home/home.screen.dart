import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homebank/ui/my_billing/billing.screens.dart';
import 'package:homebank/ui/style/colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      icon: Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    SvgPicture.asset(
                      'assets/icon/ic_notifications.svg',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Добрый день, Тамина.',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 4,
                        shadowColor: HomeBankColor.red,
                        color: HomeBankColor.red,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Ваши покупки ',
                                    style: TextStyle(
                                      color: HomeBankColor.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '№129030',
                                    style: TextStyle(
                                      color: HomeBankColor.white,
                                      fontSize: 32,
                                    ),
                                  ),
                                  InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: HomeBankColor.white,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Перейти',
                                          style: TextStyle(
                                            color: HomeBankColor.red,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BillingScreen(),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Кэшбек',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Подробнее',
                                style: TextStyle(
                                    color: HomeBankColor.red, fontSize: 16),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 16,
                                color: HomeBankColor.red,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Image.asset('assets/image/im_card_gold.png'),
                            SizedBox(
                              width: 16,
                            ),
                            Image.asset('assets/image/im_card_silver.png'),
                            SizedBox(
                              width: 16,
                            ),
                            Image.asset('assets/image/im_card_platinium.png'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Информация об акциях',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return buildDiscount(
                              "IPhone 12",
                              "5% скидка до 18 октября!",
                              "assets/image/im_product.png");
                        },
                        itemCount: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDiscount(String title, String discount, String asset) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  discount,
                  style: TextStyle(),
                ),
                Text(
                  "Успей купить!",
                  style: TextStyle(),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 60,
              height: 60,
              child: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image(
                    image: AssetImage(asset),
                  ),
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
