import 'dart:ui';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(43), topRight: Radius.circular(43)),
              ),
              context: context,
              builder: (context) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 18,
                        left: 32,
                        right: 32,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(43), topRight: Radius.circular(43)),
                      color: HomeBankColor.red,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Добавить товар",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: HomeBankColor.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Опишите в подробностях",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: HomeBankColor.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(27),
                            color: HomeBankColor.white,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: HomeBankColor.red,
                                ),
                                Text(
                                  "Разместить фото",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: HomeBankColor.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextField(
                            style: TextStyle(
                              color: HomeBankColor.white,
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: HomeBankColor.white, width: 1.0),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: HomeBankColor.white, width: 1.0),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              hintStyle: TextStyle(color: HomeBankColor.white),
                              fillColor: HomeBankColor.red,
                              focusColor: HomeBankColor.red,
                              hintText: 'Название продукта',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextField(
                            style: TextStyle(
                              color: HomeBankColor.white,
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: HomeBankColor.white, width: 1.0),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: HomeBankColor.white, width: 1.0),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              hintStyle: TextStyle(color: HomeBankColor.white),
                              fillColor: HomeBankColor.red,
                              focusColor: HomeBankColor.red,
                              hintText: 'Стоимость',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextField(
                            minLines: 3,
                            maxLines: 5,
                            // allow user to enter 5 line in textfield
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(
                              color: HomeBankColor.white,
                            ),
                            decoration: const InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: HomeBankColor.white, width: 1.0),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: HomeBankColor.white, width: 1.0),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              hintStyle: TextStyle(color: HomeBankColor.white),
                              fillColor: HomeBankColor.red,
                              focusColor: HomeBankColor.red,
                              hintText: 'Описание продукта',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                color: HomeBankColor.white,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.add,
                                color: HomeBankColor.red,
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        backgroundColor: HomeBankColor.red,
        child: Icon(
          Icons.add,
          color: HomeBankColor.white,
        ),
      ),
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
