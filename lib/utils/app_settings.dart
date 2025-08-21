import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart';

enum AppLang { en, ar }

extension LangDir on AppLang {
  TextDirection get dir => this == AppLang.ar ? TextDirection.rtl : TextDirection.ltr;
}

class AppSettings {
  static const _keyLang = 'lang';

  static Future<AppLang> getLang() async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getString(_keyLang) ?? 'en';
    return v == 'ar' ? AppLang.ar : AppLang.en;
  }

  static Future<void> setLang(AppLang lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLang, lang == AppLang.ar ? 'ar' : 'en');
  }
}
