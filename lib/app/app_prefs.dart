// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/language_manager.dart';

const PREF_APP_LANG = "PREF_APP_LANG";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLang() async {
    String language = _sharedPreferences.getString(PREF_APP_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getLanguage();
    }
  }

  Future<String> setAppLang(String language) async {
   _sharedPreferences.setString(PREF_APP_LANG, language);
  }
}
