import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homebank/controllers/basket.controller.dart';
import 'package:homebank/data/entity/item.dart';
import 'package:homebank/ui/basket/basket.screen.dart';
import 'package:homebank/ui/style/colors.dart';

class ItemScreen extends StatelessWidget {
  final BasketController ctrl;
  final Item item;
  final int stars;
  final bool removeFromBusket;

  const ItemScreen(
      {Key key,
      @required this.ctrl,
      @required this.item,
      this.stars,
      this.removeFromBusket = false})
      : super(key: key);

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
            Container(
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
                                    color:
                                        index == 0 ? Colors.grey : Colors.white,
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
            ),
            Text(
              "Вы оформляете",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(item.name),
                      // ListView.builder(
                      //   itemBuilder: (context, index) {
                      //     return Flexible(
                      //       child: Icon(
                      //         Icons.star,
                      //         color: Color(0xFFFFA800),
                      //       ),
                      //     );
                      //   },
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   scrollDirection: Axis.horizontal,
                      //   itemCount: 3,
                      //   shrinkWrap: true,
                      // ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Штрихкод"),
                      Text(item.barcode),
                    ],
                  )
                ],
              ),
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
                        removeFromBusket
                            ? 'Удалить из корзины'
                            : 'Добавить в корзину',
                        style:
                            TextStyle(color: HomeBankColor.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  removeFromBusket
                      ? ctrl.removeItemFromBusket(item)
                      : ctrl.addItemToBusket(item);

                  Navigator.pop(context);
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
