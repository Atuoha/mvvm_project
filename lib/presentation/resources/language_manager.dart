// ignore_for_file: constant_identifier_names, non_constant_identifier_names

enum LanguageType {
  ENGLISH,
  FRENCH,
}

String ENGLISH = "en";
String FRENCH = "fr";

extension LanguageTypeExtension on LanguageType {
  String getLanguage() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.FRENCH:
        return FRENCH;
    }
  }
}
