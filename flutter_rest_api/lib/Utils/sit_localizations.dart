import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'l10n/messages_all.dart';

class SitLocalizations{
  static Future<SitLocalizations> load(Locale locale) async{
    final String localeName =
        locale.countryCode == null || locale.countryCode.isEmpty
            ? locale.languageCode
            : locale.toString();

    final String canonicalLocaleName = Intl.canonicalizedLocale(localeName);

    // Comment this before create l10n
    await initializeMessages(canonicalLocaleName);

    Intl.defaultLocale = canonicalLocaleName;

    return SitLocalizations();
  }

  static SitLocalizations of(BuildContext context) =>
      Localizations.of<SitLocalizations>(context, SitLocalizations);

  String get title => Intl.message(
    'Stay in Touch (i18n Demo)',
    name: 'title',
    desc: 'App title',
  );
}

class SitLocalizationsDelegate extends LocalizationsDelegate<SitLocalizations> {
  const SitLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pt'].contains(locale.languageCode);

  @override
  Future<SitLocalizations> load(Locale locale) => SitLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<SitLocalizations> old) => false;
}