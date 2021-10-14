import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homebank/ui/style/colors.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key key}) : super(key: key);

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeBankColor.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: HomeBankColor.white,
        title: Text(
          "Корзина",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: HomeBankColor.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: SvgPicture.asset("assets/icon/ic_search.svg")),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    focusColor: HomeBankColor.red,
                    hintText: 'Поиск',
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Популярные позиции",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: HomeBankColor.black,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Показано 564 результата",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: HomeBankColor.black,
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      "assets/icon/ic_filter.svg",
                      fit: BoxFit.fill,
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return buildProductCard(
                    image: "assets/image/im_product.png",
                    title: "Minavi Headseat Pro Gaming",
                    price: 30.99,
                    prevPrice: 30.99,
                    stars: index + 1,
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget buildProductCard({String image, String title, double price, double prevPrice, int stars}) {
    return Padding(
      padding: EdgeInsets.only(top: 18, left: 16, right: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 10,
        shadowColor: HomeBankColor.black,
        color: HomeBankColor.white,
        child: Container(
          height: 131,
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: HomeBankColor.red,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8), topLeft: Radius.circular(8))),
                  height: 131,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: HomeBankColor.black,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$ $price",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: HomeBankColor.black,
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Text(
                            "\$ $prevPrice",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: HomeBankColor.lightGrey,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: HomeBankColor.lightGrey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 36,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return Icon(
                                  Icons.star,
                                  color: Color(0xFFFFA800),
                                );
                              },
                              itemCount: stars > 3 ? 3 : stars,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                            ),
                            InkWell(
                              radius: 32,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: HomeBankColor.red,
                                  borderRadius: BorderRadius.all(Radius.circular(32)),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  child: Center(
                                    child: Text(
                                      'Оформить',
                                      style: TextStyle(
                                        color: HomeBankColor.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {},
                            )
                          ],
                        ),
                      )
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
