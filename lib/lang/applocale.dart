import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocale {
  Locale locale;

  AppLocale(this.locale);

  Map<String, String> _loadedLocalizationValues;

  static AppLocale of(BuildContext context) {
    return Localizations.of(context, AppLocale);
  }

  Future loadLang() async {
    String _langFile =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');

    Map<String, dynamic> _loadValue = jsonDecode(_langFile);

    _loadedLocalizationValues =
        _loadValue.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslated(String key) {
    return _loadedLocalizationValues[key];
  }

  static const LocalizationsDelegate<AppLocale> delegate = _AppLocale();
}

class _AppLocale extends LocalizationsDelegate<AppLocale> {
  const _AppLocale();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    AppLocale appLocale = AppLocale(locale);
    await appLocale.loadLang();
    return appLocale;
  }

  @override
  bool shouldReload(_AppLocale old) => false;
}
