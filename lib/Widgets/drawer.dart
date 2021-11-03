import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_application_1/l10n/l10n.dart';

import 'package:flutter/widgets.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({Key key, this.controller1, @required this.isDark})
      : super(key: key);
  AnimationController controller1;
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    List _isHovering = [false, false, false, false];
    var locale = Localizations.localeOf(context).languageCode;

    return Container(
      
      color: Colors.white,
      width: 280,
      child: Container(
        decoration: BoxDecoration(
        color: Colors.transparent
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            color: Colors.transparent,
            height: 30,
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
                color: Color(0xFFe5e0f0),
                borderRadius: locale == "en"
                    ? BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20),)
                    : BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 30.0),
                  child: Image.asset(
                    'assets/images/Asset.png',
                    height: 55,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    AppLocalizations.of(context).ariaco,
                    style: TextStyle(
                        color: Color(0xFF555461),
                        fontFamily:
                            Localizations.localeOf(context).languageCode == 'fa'
                                ? "IranSans"
                                : "Montserrat",
                        fontSize: 26),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFe5e0f0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(38.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        child: Text(
                          AppLocalizations.of(context).home,
                          style: TextStyle(
                              color: Color(0xFF555461),
                              fontFamily:
                                  Localizations.localeOf(context).languageCode ==
                                          'fa'
                                      ? "IranSans-light"
                                      : "Montserrat-light",
                              fontSize: 16),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/');
                        },
                        onHover: (value) {
                          _isHovering[0] = value;
                        },
                      ),
                    ),
                    Divider(
                      thickness: .5,
                      color: Colors.grey[400],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        child: Text(
                          AppLocalizations.of(context).about,
                          style: TextStyle(
                              color: Color(0xFF555461),
                              fontFamily:
                                  Localizations.localeOf(context).languageCode ==
                                          'fa'
                                      ? "IranSans-light"
                                      : "Montserrat-light",
                              fontSize: 16),
                        ),
                        onHover: (value) {
                          _isHovering[1] = value;
                        },
                        onTap: () {
                          Navigator.pushNamed(context, '/about');
                        },
                      ),
                    ),
                    Divider(
                      thickness: .5,
                      color: Colors.grey[400],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        child: Text(
                          AppLocalizations.of(context).contacts,
                          style: TextStyle(
                              color: Color(0xFF555461),
                              fontFamily:
                                  Localizations.localeOf(context).languageCode ==
                                          'fa'
                                      ? "IranSans-light"
                                      : "Montserrat-light",
                              fontSize: 16),
                        ),
                        onHover: (value) {
                          _isHovering[3] = value;
                        },
                        onTap: () {
                          Navigator.pushNamed(context, '/contacts');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
