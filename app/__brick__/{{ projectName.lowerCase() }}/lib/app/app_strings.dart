import 'package:auto_localized/annotations.dart';

@AutoLocalized(
  locales: <AutoLocalizedLocale>[
    {{#useEn}}AutoLocalizedLocale(
      languageCode: 'en',
      translationsFiles: [
        'resources/lang/en.yaml',
        'resources/lang/en_generic.yaml',
      ],
    ),{{/useEn}}
    {{#useRo}}AutoLocalizedLocale(
      languageCode: 'ro',
      translationsFiles: [
        'resources/lang/ro.yaml',
        'resources/lang/ro_generic.yaml',
      ],
    ),{{/useRo}}
  ],
)
class $Strings {}
