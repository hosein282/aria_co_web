// ignore_for_file: must_be_immutable
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Widgets/drawer.dart';
import 'package:flutter_application_1/Widgets/language.dart';
import 'package:mailto/mailto.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_strategy/url_strategy.dart';
import 'l10n/l10n.dart';
import 'widgets/SmallScreen.dart';
import 'Widgets/LargeScreen.dart';
import 'screens/about.dart';
import 'screens/contacts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter/material.dart';

import 'screens/Projects.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocalProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocalProvider>(context);
          return MaterialApp(
            initialRoute: '/',
            routes: {
              // When navigating to the "/" route, build the FirstScreen widget.
              '': (context) => MyHomePage(
                    title: 'Aria.Co',
                  ),

              '/contacts': (context) => Contacts(),
              '/projects': (context) => Projects(),
              '/about': (context) => AboutUsPage(),
            },
            debugShowCheckedModeBanner: false,
            title: 'AriaCo',
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
            home: MyHomePage(),
            locale: provider.locale,
            theme: ThemeData(
              // Define the default brightness and colors.
              brightness: Brightness.light,
              primaryColor: Color(0xFFe5e0f0),
              primaryColorLight: Color(0xFFf8f7fb),

              // Define the default font family.

              // Define the default `TextTheme`. Use this to specify the default
              // text styling for headlines, titles, bodies of text, and more.
            ),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);
  bool expand = true;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
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

  Color bgColor = Color(0xFFe5e0f0);
  Color bgWhiteColor = Color(0xFFf8f7fb);
  Color titleColor = Color(0xFF1d1d27);
  Color subTitleColor = Color(0xFF1d1d27);
  Color title = Color(0xFF123456);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double whiteContainer = 1266;
    return Scaffold(
      backgroundColor: bgColor,
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
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
              ),
              Positioned(
                bottom: -50,
                child: Image.asset(
                  'assets/images/index_low.png',
                  fit: BoxFit.fitHeight,
                  height:
                      screenSize.width > 1200 ? screenSize.height * 0.63 : 350,
                  width: screenSize.width > 800 ? whiteContainer + 50 : 1024,
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
                top: screenSize.width > 600 ? 180 : 200,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeTransition(
                        opacity: _animation,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            AppLocalizations.of(context).creative,
                            style: TextStyle(
                                fontFamily: Localizations.localeOf(context)
                                            .languageCode ==
                                        'fa'
                                    ? "IranSans"
                                    : "Montserrat",
                                fontSize: screenSize.width < 800 ? 24 : 45,
                                color: titleColor),
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _animation,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            AppLocalizations.of(context).bring,
                            style: TextStyle(
                                fontFamily: Localizations.localeOf(context)
                                            .languageCode ==
                                        'fa'
                                    ? "IranSans-light"
                                    : "Montserrat-light",
                                fontSize: screenSize.width < 800 ? 12 : 18,
                                color: subTitleColor),
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _animation,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 20, 0, 10),
                          child: SizedBox(
                            height: 45,
                            width: 150,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFF3d73ff)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      side:
                                          BorderSide(color: Color(0xFF3d73ff))),
                                ),
                              ),
                              onPressed: launchMailto,
                              child: Text(
                                AppLocalizations.of(context).contacts,
                                style: TextStyle(
                                  color: Color(0xFFcedcff),
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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

  launchMailto() async {
    final mailtoLink = Mailto(
      to: ['info@ariaco.org'],
      subject: 'Website Visitor',
      body: 'mailto Aria Co',
    );
    // Convert the Mailto instance into a string.
    // Use either Dart's string interpolation
    // or the toString() method.
    await launch('$mailtoLink');
  }
}
