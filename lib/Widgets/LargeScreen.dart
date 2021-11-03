// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/language.dart';
import 'constants.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class LargeScreen extends StatefulWidget {
  LargeScreen({Key key,  this.isDark}) : super(key: key);
  bool isDark;

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double _height = 50;
    double _width = screenSize.width * .98;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      width: _width,
      height: _height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    'assets/images/Asset.png',
                    height: 70,
                    isAntiAlias: true,
                  ),
                ),
                InkWell(
                   onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      AppLocalizations.of(context).ariaco,
                      style: TextStyle(
                          color: widget.isDark
                              ? Color(0xFFcedcff)
                              : Color(0xFF555461),
                          fontFamily:
                              Localizations.localeOf(context).languageCode == 'fa'
                                  ? "IranSans"
                                  : "Montserrat",
                          fontSize: 22),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: screenSize.width < 900 ? 5 : 30,
                    ),
                    Container(
                      height: 30,
                      width: 1,
                      color:
                          widget.isDark ? Color(0xFFe1e4e9) : Color(0xFFe1e4e9),
                    ),
                    SizedBox(
                      width: screenSize.width < 900 ? 15 : 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      onHover: (value) {
                        setState(() {
                          _isHovering[0] = value;
                        });
                      },
                      child: Text(
                        AppLocalizations.of(context).home,
                        style: TextStyle(
                            color: _isHovering[0]
                                ? Color(0XFF808285)
                                : widget.isDark
                                    ? Color(0xFFcedcff)
                                    : Color(0xFF555461),
                            fontFamily:
                                Localizations.localeOf(context).languageCode ==
                                        'fa'
                                    ? "IranSans-light"
                                    : "Montserrat-light",
                            fontSize: screenSize.width < 800 ? 14 : 16),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width < 900 ? 15 : 40,
                    ),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          _isHovering[1] = value;
                        });
                      },
                      onTap: () {
                        Navigator.pushNamed(context, '/about');
                        _height = 0;
                        _width = 0;
                      },
                      child: Text(
                        AppLocalizations.of(context).about,
                        style: TextStyle(
                            color: _isHovering[1]
                                ? Color(0XFF5DBEF4)
                                : widget.isDark
                                    ? Color(0xFFcedcff)
                                    : Color(0xFF555461),
                            fontFamily:
                                Localizations.localeOf(context).languageCode ==
                                        'fa'
                                    ? "IranSans-light"
                                    : "Montserrat-light",
                            fontSize: screenSize.width < 800 ? 14 : 16),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width < 900 ? 15 : 40,
                    ),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          _isHovering[3] = value;
                        });
                      },
                      child: Text(
                        AppLocalizations.of(context).contacts,
                        style: TextStyle(
                            color: _isHovering[3]
                                ? Color(0XFF5DBEF4)
                                : widget.isDark
                                    ? Color(0xFFcedcff)
                                    : Color(0xFF555461),
                            fontFamily:
                                Localizations.localeOf(context).languageCode ==
                                        'fa'
                                    ? "IranSans-light"
                                    : "Montserrat-light",
                            fontSize: screenSize.width < 800 ? 14 : 16),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/contacts');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 28.0,left: 28.0),
            child: SizedBox(
              height: 30,
              width: 30,
              child: LanguageWidget(),
            ),
          ),
          
        ],
      ),
    );
  }
}
