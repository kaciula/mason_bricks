import 'dart:ui';

import 'package:auto_localized/auto_localized.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:logging/logging.dart';

class AppLocale {
  AppLocale._();

  static String get languageCode => currentLocale.languageCode;

  static Locale get currentLocale => AutoLocalization.instance.locale;

  static Future<void> init() async {
    await findSystemLocale();
    // The app only supports English
    if (!Intl.systemLocale.startsWith(englishLocale.languageCode)) {
      Intl.systemLocale = englishLocale.languageCode;
    }
    await initializeDateFormatting();

    _logger.fine('Current locale is $currentLocale');
  }

  static void updateLocale(Locale locale) {
    Intl.systemLocale = locale.toString();
    AutoLocalization.updateLocale(locale);
  }
}

{{#useEn}}const Locale englishLocale = Locale('en');{{/useEn}}
{{#useRo}}const Locale romanianLocale = Locale('ro');{{/useRo}}

// ignore: unused_element
final Logger _logger = Logger('AppLocale');
