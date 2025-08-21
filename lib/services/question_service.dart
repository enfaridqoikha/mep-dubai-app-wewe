import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;
import '../models/question.dart';
import '../utils/app_settings.dart';

class QuestionService {
  static final _rand = Random();

  static Future<List<Question>> _loadFile(String path) async {
    final txt = await rootBundle.loadString(path);
    final data = jsonDecode(txt) as List;
    return data.map((e) => Question.fromJson(e)).toList();
  }

  static Future<List<Question>> _loadAll(AppLang lang) async {
    final code = lang == AppLang.ar ? 'ar' : 'en';
    final files = [
      'assets/questions/electrical_\$code.json',
      'assets/questions/hvac_\$code.json',
      'assets/questions/plumbing_\$code.json',
      'assets/questions/fire_\$code.json',
      'assets/questions/general_\$code.json',
    ];
    List<Question> all = [];
    for (final f in files) {
      all.addAll(await _loadFile(f));
    }
    all.shuffle(_rand);
    return all;
  }

  static Future<List<Question>> loadDaily(AppLang lang) async {
    final all = await _loadAll(lang);
    return all.take(25).toList();
  }

  static Future<List<Question>> loadPractice(AppLang lang, {int count = 20}) async {
    final all = await _loadAll(lang);
    return all.take(count).toList();
  }
}
