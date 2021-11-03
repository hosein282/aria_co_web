// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/Widgets/language.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class SmallScreen extends StatefulWidget {
  SmallScreen({Key key, @required this.isDark})
      : super(key: key);
  bool isDark;

  @override
  _SmallScreenState createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen> {
  @override
  void initState() => super.initState();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double _height = 50;
    double _width = screenSize.width - 50;
    return Container(
      margin: EdgeInsets.all(0),
      height: _height,
      width: _width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image.asset(
                    'assets/images/Asset.png',
                    isAntiAlias: true,
                    height: 35,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      AppLocalizations.of(context).ariaco,
                      style: TextStyle(
                          color: widget.isDark
                              ? Color(0xFFcedcff)
                              : Color(0xFF555461),
                          fontFamily:
                              Localizations.localeOf(context).languageCode ==
                                      'fa'
                                  ? "IranSans"
                                  : "Montserrat",
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Center(child: LanguageWidget()),
              Padding(
                padding: const EdgeInsets.only(right: 28.0, left: 28),
                child: InkWell(
                  child: Center(
                    child: Icon(
                      Icons.menu_rounded,
                      color: widget.isDark ? Color(0xFFcedcff) : Colors.black87,
                    ),
                  ),
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
