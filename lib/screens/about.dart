// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/LargeScreen.dart';
import 'package:flutter_application_1/Widgets/SmallScreen.dart';
import 'package:flutter_application_1/Widgets/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class AboutUsPage extends StatefulWidget {
  bool expand = true;

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage>
    with TickerProviderStateMixin {
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
    var screenSize = MediaQuery.of(context).size;
    double whiteContainer = 1266;

    return Scaffold(
        endDrawer: screenSize.width > 800
          ? null
          : Theme(
      data: Theme.of(context).copyWith(
       // Set the transparency here
       canvasColor: Colors.black.withAlpha(200), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
      ),
      child: NavigationDrawerWidget(isDark: false),
    ),
        backgroundColor: Color(0xFFe5e0f0),
        body: Center(
            child: Container(
                width: 1366,
                child: Stack(alignment: Alignment.center, children: [
                  
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
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                  ),
                  Positioned(
                    bottom:screenSize.height>800?0:-100,
                    child: Container(
                      width: screenSize.width > 600 ? 800 : 300,
                      margin: EdgeInsets.only(top: 0),
                      child: Wrap(
                        spacing: screenSize.width > 600 ? 20 : 5,
                        alignment: WrapAlignment.spaceAround,
                        children: [
                          cardGen(
                              size: screenSize,
                              img: "assets/images/design.jpg",
                              title: AppLocalizations.of(context).designing,
                              subTitle:
                                  AppLocalizations.of(context).designingDesc),
                          cardGen(
                              size: screenSize,
                              img: "assets/images/developing.jpg",
                              title: AppLocalizations.of(context).developing,
                              subTitle:
                                  AppLocalizations.of(context).developingDesc),
                          cardGen(
                              size: screenSize,
                              img: "assets/images/launching.jpg",
                              title: AppLocalizations.of(context).launching,
                              subTitle:
                                  AppLocalizations.of(context).launchingDesc),
                        ],
                      ),
                    ),
                  ),
                 screenSize.width > 600
                  ? Positioned(
                      right: 120,
                      top: 50,
                      left: screenSize.width > 1200 ? 120 : 70,
                      child: LargeScreen(
                        isDark: false,
                      ))
                  : Positioned(
                      top: 70,
                      child: SmallScreen(
                        isDark: false,
                      )),
                  Positioned(
                    top: screenSize.width > 600 ? 160 : 160,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeTransition(
                            opacity: _animation,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Text(
                                AppLocalizations.of(context).whatwedo,
                                style: TextStyle(
                                    fontFamily: Localizations.localeOf(context)
                                                .languageCode ==
                                            'fa'
                                        ? "IranSans"
                                        : "Montserrat",
                                    fontSize: screenSize.width < 800 ? 28 : 45,
                                    color: Color(0xFF1d1d27)),
                              ),
                            ),
                          ),
                          FadeTransition(
                            opacity: _animation,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Text(
                                AppLocalizations.of(context).thisisexactcly,
                                style: TextStyle(
                                    fontFamily: Localizations.localeOf(context)
                                                .languageCode ==
                                            'fa'
                                        ? "IranSans-light"
                                        : "Montserrat-light",
                                    fontSize: screenSize.width < 800 ? 14 : 18,
                                    color: Color(0xFF1d1d27)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                ]))));
  }

  Widget cardGen({Size size, String img, String title, String subTitle}) {
    return Container(
      width: size.width > 800 ? 250 : 120,
      height: size.width > 600 ? 600 : 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width > 800 ? 180 : 80,
            height:size.width > 800 ? 180 : 80,
            child: Image.asset(
              img,
              fit: BoxFit.fitHeight,
              width: 120,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: TextStyle(
                  fontFamily:
                      Localizations.localeOf(context).languageCode == 'fa'
                          ? "IranSans"
                          : "Montserrat",
                  fontSize: size.width > 800 ? 24 : 16,
                  color: Color(0xFF1d1d27)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Text(
              subTitle,
              style: TextStyle(
                fontFamily: Localizations.localeOf(context).languageCode == 'fa'
                    ? "IranSans-light"
                    : "Montserrat-light",
                fontSize: size.width > 800 ? 14 : 10,
                color: Color(0xFF616472),
                height: size.width > 600 ? 2 : 1,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
