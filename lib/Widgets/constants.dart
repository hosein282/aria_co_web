import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorsPalette {
  static const Color bgColor = Color(0xFFe5e0f0);
  static const Color bgWhiteColor = Color(0xFFf8f7fb);
  static const Color titleColor = Color(0xFF1d1d27);
  static const Color subTitleColor = Color(0xFF1d1d27);
  static const Color title = Color(0xFF123456);
}

class Menu {
  const Menu({this.title,this.titleFa, this.route, this.value, this.file});
  final String title;

  final String titleFa;
  final int value;
  final String route;
  final String file;
}

class MenuList {
  final List<Menu> menus = [
    Menu(value: 0, title: 'Home',
     titleFa:"خانه",
     route: '/', file: 'assets/images/index.jpg'),
    Menu(
        value: 1,
        title: 'About',
        titleFa: 'درباره ما',
        route: "/about",
        file: 'assets/images/index2.jpg'),
    Menu(
        value: 2,
        title: 'Projects',
         titleFa: 'درباره ما',
        route: "/projects",
        file: 'assets/images/index2.jpg'),
    Menu(
        value: 3,
        title: 'Contacts',
         titleFa: 'تماس ',
        route: "/our",
        file: 'assets/images/index2.jpg'),
  ];
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Capital Market', icon: Icons.shop_2_rounded),
  const Choice(title: 'Insurance', icon: Icons.insert_chart_outlined_sharp),
  const Choice(title: 'Blockchain', icon: Icons.change_circle_outlined),
  const Choice(title: 'Technology Advisory', icon: Icons.computer_outlined),
  const Choice(title: 'Finance & Risk', icon: Icons.details_rounded),
  const Choice(title: 'Portfolio Management', icon: Icons.manage_accounts)
];

class Case {
  Case({this.img, this.txt, this.title});
  final String img;
  final String title;
  final String txt;
}

class CaseList {
  final List<Case> caseList = <Case>[
    Case(
        img: 'case (6)',
        title: 'Startup Funding',
        txt:
            'Providing insight-driven transformation to investment banks, wealth and asset managers, exchanges, clearing houses.'),
    Case(
        img: 'case (5)',
        title: 'Family Asset Management',
        txt:
            'Providing insight-driven transformation to investment banks, wealth and asset managers, exchanges, clearing houses.'),
    Case(
        img: 'case (4)',
        title: 'Accounting Advisory',
        txt:
            'Providing insight-driven transformation to investment banks, wealth and asset managers, exchanges, clearing houses.'),
    Case(
        img: 'case (3)',
        title: 'Merger & Acquisition',
        txt:
            'Providing insight-driven transformation to investment banks, wealth and asset managers, exchanges, clearing houses.'),
    Case(
        img: 'case (2)',
        title: 'Business Matching',
        txt:
            'Providing insight-driven transformation to investment banks, wealth and asset managers, exchanges, clearing houses.'),
    Case(
        img: 'case (1)',
        title: 'Bitcoin Farming Advisory',
        txt:
            'Providing insight-driven transformation to investment banks, wealth and asset managers, exchanges, clearing houses.')
  ];
}

