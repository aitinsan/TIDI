import 'package:flutter/material.dart';
import 'package:homebank/ui/home/home.screen.dart';
import 'package:homebank/ui/style/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    // Dashboard(),
    // Chat(),
    // Profile(),
    // Settings(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HomeBankColor.red,
        child: Icon(Icons.qr_code_scanner, color: HomeBankColor.white),
        onPressed: () {},
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
                          // currentScreen =
                          //     Dashboard(); // if user taps on this dashboard tab will be active
                          // currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icon/ic_home.svg',
                            color: currentTab == 0? HomeBankColor.red: HomeBankColor.black,
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          // currentScreen =
                          //     Chat(); // if user taps on this dashboard tab will be active
                          // currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icon/ic_map.svg',
                            color: currentTab == 1? HomeBankColor.red: HomeBankColor.black,
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
                        // setState(() {
                        //   currentScreen =
                        //       Profile(); // if user taps on this dashboard tab will be active
                        //   currentTab = 2;
                        // });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icon/ic_busket.svg',
                            color: currentTab == 2? HomeBankColor.red: HomeBankColor.black,
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        // setState(() {
                        //   currentScreen =
                        //       Settings(); // if user taps on this dashboard tab will be active
                        //   currentTab = 3;
                        // });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icon/ic_account.svg',
                            color: currentTab == 3? HomeBankColor.red: HomeBankColor.black,
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
    );
  }
}
