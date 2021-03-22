import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'lang/applocale.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),

      //Change Langages
      localizationsDelegates: [
        //This delagate load or carry my langage
        AppLocale.delegate,
        //move widget to LTR (EN,..)  or   RTL(AR,....)
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale('en', ''), Locale('ar', '')],

      localeResolutionCallback: (currentLocal, supportedLocal) {
        if (currentLocal != null) {
          print(currentLocal.languageCode);
          for (Locale locale in supportedLocal)
            if (currentLocal.languageCode == locale.languageCode) {
              return currentLocal;
            }
        }

        return supportedLocal.first;
      },
    );
  }
}
