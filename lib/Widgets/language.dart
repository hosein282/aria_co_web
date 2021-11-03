import 'package:flutter/material.dart';
import 'package:flutter_application_1/l10n/l10n.dart';
import 'package:provider/provider.dart';

class LocalProvider extends ChangeNotifier {
  Locale _locale;
  Locale get locale => _locale;
  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}

class LanguageWidget extends StatefulWidget {
  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  bool isfa = false;

  @override
  Widget build(BuildContext context) {
    final locale0 = L10n.all[0];
    final locale1 = L10n.all[1];
    final locale = Localizations.localeOf(context).languageCode;
    final flag = L10n.getFlag(locale);
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            final provider = Provider.of<LocalProvider>(context, listen: false);

            if (isfa) {
              provider.setLocale(locale0);
              boolToggle();
            } else {
              provider.setLocale(locale1);
              boolToggle();

            }
          });
        },
        child: CircleAvatar(
          radius: 12,
          backgroundColor: Color(0xFFe5e0f0),
          child: Text(
           isfa? L10n.getFlag("en"):L10n.getFlag("fa")
            ,
            style: TextStyle(fontSize: 12,fontFamily: "Montserrat",),
          ),
        ),
      ),
    );
  }

  void boolToggle() {
    isfa = !isfa;
  }
}
