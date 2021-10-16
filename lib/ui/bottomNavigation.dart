import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homebank/controllers/basket.controller.dart';
import 'package:homebank/controllers/catalog.controller.dart';
import 'package:homebank/providers/controller_provider.dart';
import 'package:homebank/ui/basket/basket.screen.dart';
import 'package:homebank/ui/catalog/catalog.screen.dart';
import 'package:homebank/ui/home/home.screen.dart';
import 'package:homebank/ui/map/map.screen.dart';
import 'package:homebank/ui/profile/profile.screen.dart';
import 'package:homebank/ui/scanner/scanner.screen.dart';
import 'package:homebank/ui/style/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen =
      HomeScreen(ctrl: CatalogController()); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return ControllerProvider<CatalogController>(
      create: () => CatalogController(),
      builder: (context, ctrl) => Scaffold(
        body: currentScreen,
        floatingActionButton: FloatingActionButton(
          backgroundColor: HomeBankColor.red,
          child: Icon(Icons.qr_code_scanner, color: HomeBankColor.white),
          onPressed: () {
            setState(() {
              currentTab = 5;
              currentScreen = ScannerScreen(
                ctrl: ctrl,
              ); // if user taps on this dashboard tab will be active
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = HomeScreen(
                              ctrl: ctrl,
                            ); // if user taps on this dashboard tab will be active
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/icon/ic_home.svg',
                              color: currentTab == 0
                                  ? HomeBankColor.red
                                  : HomeBankColor.black,
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = CatalogScreen(
                              ctrl: ctrl,
                            ); // if user taps on this dashboard tab will be active
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.category_sharp,
                              color: currentTab == 1
                                  ? HomeBankColor.red
                                  : HomeBankColor.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // Right Tab bar icons

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = BasketScreen(
                              ctrl: ctrl,
                            ); // if user taps on this dashboard tab will be active
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/icon/ic_busket.svg',
                              color: currentTab == 2
                                  ? HomeBankColor.red
                                  : HomeBankColor.black,
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen =
                                ProfileScreen(); // if user taps on this dashboard tab will be active
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/icon/ic_account.svg',
                              color: currentTab == 3
                                  ? HomeBankColor.red
                                  : HomeBankColor.black,
                            ),
                          ],
                        ),
                      )
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
}
