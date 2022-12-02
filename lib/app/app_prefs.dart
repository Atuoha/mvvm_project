// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart' as shared_prefs;

import '../presentation/resources/language_manager.dart';

const PREF_APP_LANG = "PREF_APP_LANG";
const PREF_KEY_ONBOARDING_VIEWED = "PREF_KEY_ONBOARDING_VIEWED";
const PREF_KEY_IS_USER_LOGGED_IN = "PREF_KEY_IS_LOGGED_IN";

class AppPreferences {
  final shared_prefs.SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLang() async {
    String language = _sharedPreferences.getString(PREF_APP_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getLanguage();
    }
  }

  Future<void> setOnBoardingScreenViewed() async {
    await _sharedPreferences.setBool(PREF_KEY_ONBOARDING_VIEWED, true);
  }

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(PREF_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> getIsOnBoardingScreenViewed()async{
    return _sharedPreferences.getBool(PREF_KEY_ONBOARDING_VIEWED) ?? false;
  }

  Future<bool> getIsUserLoggedIn()async{
    return _sharedPreferences.getBool(PREF_KEY_IS_USER_LOGGED_IN) ?? false;
  }

// Future<String> setAppLang(String language) async {
//  _sharedPreferences.setString(PREF_APP_LANG, language);
// }
}
