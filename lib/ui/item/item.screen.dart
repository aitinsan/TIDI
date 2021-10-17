import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homebank/controllers/basket.controller.dart';
import 'package:homebank/data/entity/item.dart';
import 'package:homebank/data/entity/transaction.dart';
import 'package:homebank/ui/basket/basket.screen.dart';
import 'package:homebank/ui/style/colors.dart';

enum OperationType {
  add,
  delete,
  change,
}

class ItemScreen extends StatefulWidget {
  final BasketController ctrl;
  final Transaction transaction;
  final Item item;
  final int stars;
  final OperationType operation;

  ItemScreen(
      {Key key,
      @required this.ctrl,
      @required this.item,
      this.stars,
      this.operation = OperationType.add,
      this.transaction})
      : super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  bool isCredit = false;
  int currentCredit = 0;
  int shop = 0;
  int ship = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HomeBankColor.red,
        elevation: 0,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 16), child: Icon(Icons.ios_share))
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              "assets/icon/ic_custom_back.svg",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImage(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Вы оформляете",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  _buildContainer(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(widget.item.name),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFA800),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFA800),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFA800),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Штрихкод"),
                            Text(widget.item.barcode),
                          ],
                        )
                      ],
                    ),
                  ),
                  Text('Стоимость'),
                  _buildContainer(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(widget.item.cost.toString() + ' KZ'),
                          ],
                        ),
                        Text("В кредит 1978 тг x 24 мес"),
                      ],
                    ),
                  ),
                  Text('Срок'),
                  _buildContainer(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text('Оформить рассрочку на '),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              child: Container(
                                color: currentCredit == 1
                                    ? HomeBankColor.red
                                    : HomeBankColor.white,
                                child: Text(
                                  '6 ${currentCredit == 1 ? 'месяцев' : ''}',
                                  style: TextStyle(
                                      color: currentCredit == 1
                                          ? HomeBankColor.white
                                          : HomeBankColor.black),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  currentCredit = 1;
                                  isCredit = true;
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                color: currentCredit == 2
                                    ? HomeBankColor.red
                                    : HomeBankColor.white,
                                child: Text(
                                  '12 ${currentCredit == 2 ? 'месяцев' : ''}',
                                  style: TextStyle(
                                      color: currentCredit == 2
                                          ? HomeBankColor.white
                                          : HomeBankColor.black),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  currentCredit = 2;
                                  isCredit = true;
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                color: currentCredit == 3
                                    ? HomeBankColor.red
                                    : HomeBankColor.white,
                                child: Text(
                                  '24 ${currentCredit == 3 ? 'месяцев' : ''}',
                                  style: TextStyle(
                                      color: currentCredit == 3
                                          ? HomeBankColor.white
                                          : HomeBankColor.black),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  currentCredit = 3;
                                  isCredit = true;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text('Продавцы'),
                  _buildContainer(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Container(
                            color: shop == 1
                                ? HomeBankColor.red
                                : HomeBankColor.white,
                            child: Text(
                              ' Sulpak',
                              style: TextStyle(
                                  color: shop == 1
                                      ? HomeBankColor.white
                                      : HomeBankColor.black),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              shop = 1;
                            });
                          },
                        ),
                        InkWell(
                          child: Container(
                            color: shop == 2
                                ? HomeBankColor.red
                                : HomeBankColor.white,
                            child: Text(
                              'Technodom',
                              style: TextStyle(
                                  color: shop == 2
                                      ? HomeBankColor.white
                                      : HomeBankColor.black),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              shop = 2;
                            });
                          },
                        ),
                        InkWell(
                          child: Container(
                            color: shop == 3
                                ? HomeBankColor.red
                                : HomeBankColor.white,
                            child: Text(
                              'Mechta',
                              style: TextStyle(
                                  color: shop == 3
                                      ? HomeBankColor.white
                                      : HomeBankColor.black),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              shop = 3;
                            });
                          },
                        ),
                        InkWell(
                          child: Container(
                            color: shop == 4
                                ? HomeBankColor.red
                                : HomeBankColor.white,
                            child: Text(
                              'Alser',
                              style: TextStyle(
                                  color: shop == 4
                                      ? HomeBankColor.white
                                      : HomeBankColor.black),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              shop = 4;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Text('Доставка'),
                  _buildContainer(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Container(
                            color: ship == 0
                                ? HomeBankColor.red
                                : HomeBankColor.white,
                            child: Text(
                              'Доставка',
                              style: TextStyle(
                                  color: ship == 0
                                      ? HomeBankColor.white
                                      : HomeBankColor.black),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              ship = 0;
                            });
                          },
                        ),
                        InkWell(
                          child: Container(
                            color: ship == 1
                                ? HomeBankColor.red
                                : HomeBankColor.white,
                            child: Text(
                              'Самовывоз',
                              style: TextStyle(
                                  color: ship == 1
                                      ? HomeBankColor.white
                                      : HomeBankColor.black),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              ship = 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  _buildContainer(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Промокод',style: TextStyle(color: HomeBankColor.grey),)
                      ],
                    ),
                  ),
                  _buildButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
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
                widget.operation == OperationType.delete
                    ? 'Удалить из корзины'
                    : widget.operation == OperationType.change
                        ? 'Применить'
                        : 'Добавить в корзину',
                style: TextStyle(color: HomeBankColor.white, fontSize: 16),
              ),
            ),
          ),
        ),
        onTap: () {
          widget.item.isCredit = isCredit;
          widget.item.isRefundable = !isCredit;
          widget.operation == OperationType.delete
              ? widget.ctrl.removeItemFromBusket(widget.item)
              : widget.operation == OperationType.change
                  ? widget.ctrl.changeTransactionToCredit(widget.transaction)
                  : widget.ctrl.addItemToBusket(widget.item);
          int count = 0;

          widget.operation == OperationType.change
              ? Navigator.popUntil(context, (route) {
                  return count++ == 2;
                })
              : Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        color: HomeBankColor.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/image/im_product_big.png",
          ),
          Row(
            children: [
              Spacer(
                flex: 2,
              ),
              Container(
                width: 100,
                height: 2,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Container(
                          width: 8,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: index == 0 ? Colors.grey : Colors.white,
                          ),
                        ),
                      );
                    }),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(
                  Icons.open_in_full_rounded,
                  color: HomeBankColor.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
