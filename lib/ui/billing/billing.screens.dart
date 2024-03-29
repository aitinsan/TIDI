import 'package:flutter/material.dart';
import 'package:homebank/controllers/basket.controller.dart';
import 'package:homebank/ui/item/item.screen.dart';
import 'package:homebank/ui/style/colors.dart';


class BillingScreen extends StatefulWidget {
  final BasketController ctrl;
  BillingScreen({Key key,@required this.ctrl}) : super(key: key);

  @override
  _BillingScreenState createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Мои счета',
          style: TextStyle(
            color: HomeBankColor.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: HomeBankColor.black,
          ),
        ),
        backgroundColor: HomeBankColor.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Номер договора',
                  style: TextStyle(color: HomeBankColor.silver)),
              SizedBox(
                height: 4,
              ),
              Text(
                '№129030',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Текущая карта',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 14,
              ),
              Image.asset('assets/image/im_card_hb.png'),
              SizedBox(
                height: 4,
              ),
              FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Все договоры ',
                      style: TextStyle(
                        fontSize: 16,
                        color: HomeBankColor.red,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: HomeBankColor.red,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'История',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 4),
                      Divider(
                        color: HomeBankColor.silver,
                      ),
                      SizedBox(height: 4),
                    ],
                  );
                },
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.ctrl.transactions.list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => widget.ctrl.transactions.list[index].isRefundable
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemScreen(
                                ctrl: widget.ctrl,
                                transaction: widget.ctrl.transactions.list[index],
                                item: widget.ctrl.transactions.list[index].item,
                                operation: OperationType.change,
                              ),
                            ))
                        : {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '№${widget.ctrl.transactions.list[index].id}',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            widget.ctrl.transactions.list[index].isRefundable
                                ? Container(
                                    color: Colors.yellow,
                                    child: Text('Переделать в рассрочку'),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Покупка ${widget.ctrl.transactions.list[index].item.name}',
                              style: TextStyle(
                                fontSize: 16,
                                color: HomeBankColor.lightGrey,
                              ),
                            ),
                            Text(
                              'TUE 22 Jun 2020',
                              style: TextStyle(
                                fontSize: 16,
                                color: HomeBankColor.lightGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}


