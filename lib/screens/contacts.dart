// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/LargeScreen.dart';
import 'package:flutter_application_1/Widgets/SmallScreen.dart';
import 'package:flutter_application_1/Widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Contacts extends StatefulWidget {
  bool expand = true;

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<Contacts> with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controller1;
  Animation<double> _animation;
  Animation<double> animationSize;
  final scrollDirection = Axis.horizontal;

  initState() {
    super.initState();

    controller1 = AnimationController(
      duration: const Duration(seconds: 12),
      vsync: this,
      lowerBound: 1,
      upperBound: 1.2,
    )..repeat(reverse: true);

    controller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);

    _animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();
  }

  @override
  dispose() {
    super.dispose();
    controller.dispose();
    controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double whiteContainer = 1266;
    return Scaffold(
      backgroundColor: Color(0xFFe5e0f0),
      endDrawer: screenSize.width > 800
          ? null
          : Theme(
              data: Theme.of(context).copyWith(
                // Set the transparency here
                canvasColor: Colors.black.withAlpha(
                    200), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
              ),
              child: NavigationDrawerWidget(isDark: false),
            ),
      drawerEnableOpenDragGesture: true,
      body: Center(
        child: Container(
          width: 1366,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                height: screenSize.height,
                width: whiteContainer * .89,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(-1, -1),
                    ),
                  ],
                  //color: Color(0xFFe5e0f0),
                  gradient: LinearGradient(colors: [
                    Color(0xFF070920),
                    Color(0XFF1c1569),
                    Color(0xFF070920),
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Image.asset(
                  'assets/images/contact.png',
                  height: screenSize.width > 800
                      ? screenSize.height * 0.6
                      : screenSize.height * 0.3,
                  isAntiAlias: true,
                ),
              ),
              screenSize.width > 600
                  ? Positioned(
                      right: 120,
                      top: 50,
                      left: screenSize.width > 1200 ? 120 : 70,
                      child: LargeScreen(
                        isDark: true,
                      ))
                  : Positioned(
                      top: 70,
                      child: SmallScreen(
                        isDark: true,
                      )),
              Positioned(
                top: 160,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeTransition(
                        opacity: _animation,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            AppLocalizations.of(context).callus,
                            style: TextStyle(
                                fontFamily: Localizations.localeOf(context)
                                            .languageCode ==
                                        'fa'
                                    ? "IranSans"
                                    : "Montserrat",
                                fontSize: screenSize.width < 800 ? 35 : 45,
                                color: Color(0xFFcedcff)),
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _animation,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            AppLocalizations.of(context).getin,
                            style: TextStyle(
                                fontFamily: Localizations.localeOf(context)
                                            .languageCode ==
                                        'fa'
                                    ? "IranSans-light"
                                    : "Montserrat-light",
                                fontSize: screenSize.width < 800 ? 14 : 18,
                                color: Color(0xFFcedcff)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
                        child: SizedBox(
                          height: 45,
                          width: 150,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF3d73ff)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    side: BorderSide(color: Color(0xFF3d73ff))),
                              ),
                            ),
                            onPressed: () {
                              launch(('tel://${"02122469367"}'));
                            },
                            child: const Text(
                              'Call Now',
                              style: TextStyle(
                                color: Color(0xFFcedcff),
                                fontFamily: "Montserrat",
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: screenSize.width > 800 ? 500 : 300,
                  child: screenSize.width > 800
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                // margin: EdgeInsets.only(right: 50),
                                child: Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context).telName,
                                  style: TextStyle(
                                    color: Color(0xFFcedcff),
                                    fontFamily: Localizations.localeOf(context)
                                                .languageCode ==
                                            'fa'
                                        ? "IranSans"
                                        : "Montserrat",
                                    fontSize: screenSize.width < 800 ? 14 : 22,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  width: 300,
                                  child: Text(
                                    AppLocalizations.of(context).tel,
                                    style: TextStyle(
                                        fontFamily:
                                            Localizations.localeOf(context)
                                                        .languageCode ==
                                                    'fa'
                                                ? "IranSans"
                                                : "Montserrat",
                                        fontSize:
                                            screenSize.width < 800 ? 14 : 22,
                                        color: Color(0xFFcedcff)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )),
                            SizedBox(
                              width: 320,
                            ),
                            Container(
                                // margin: EdgeInsets.only(right: 50),
                                child: Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context).address,
                                  style: TextStyle(
                                    color: Color(0xFFcedcff),
                                    fontFamily: Localizations.localeOf(context)
                                                .languageCode ==
                                            'fa'
                                        ? "IranSans"
                                        : "Montserrat",
                                    fontSize: screenSize.width < 800 ? 14 : 22,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  width: 300,
                                  child: Text(
                                    AppLocalizations.of(context).addressDesc,
                                    style: TextStyle(
                                        fontFamily:
                                            Localizations.localeOf(context)
                                                        .languageCode ==
                                                    'fa'
                                                ? "IranSans-light"
                                                : "Montserrat-light",
                                        fontSize:
                                            screenSize.width < 800 ? 14 : 22,
                                        color: Color(0xFFcedcff)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                AppLocalizations.of(context).telName,
                                style: TextStyle(
                                  color: Color(0xFFcedcff),
                                  fontFamily: Localizations.localeOf(context)
                                              .languageCode ==
                                          'fa'
                                      ? "IranSans"
                                      : "Montserrat",
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(),
                                child: Text(
                                  AppLocalizations.of(context).tel,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat-light',
                                      fontSize: 18,
                                      color: Color(0xFFcedcff)),
                                )),
                            Container(
                                margin: EdgeInsets.only(),
                                child: Column(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).address,
                                      style: TextStyle(
                                          color: Color(0xFFcedcff),
                                          fontFamily:
                                              Localizations.localeOf(context)
                                                          .languageCode ==
                                                      'fa'
                                                  ? "IranSans"
                                                  : "Montserrat",
                                          fontSize: 20),
                                    ),
                                    Container(
                                      width: screenSize.width - 30,
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .addressDesc,
                                        style: TextStyle(
                                            fontFamily:
                                                Localizations.localeOf(context)
                                                            .languageCode ==
                                                        'fa'
                                                    ? "IranSans-light"
                                                    : "Montserrat-light",
                                            fontSize: 18,
                                            color: Color(0xFFcedcff)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
