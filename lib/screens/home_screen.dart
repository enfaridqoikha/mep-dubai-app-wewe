import 'package:flutter/material.dart';
import '../utils/app_settings.dart';
import 'daily_screen.dart';
import 'practice_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppLang _lang = AppLang.en;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final l = await AppSettings.getLang();
    setState(() => _lang = l);
  }

  @override
  Widget build(BuildContext context) {
    final dir = _lang.dir;
    return Scaffold(
      appBar: AppBar(title: Text(_lang == AppLang.en ? 'MEP Dubai AI' : 'ذكاء دبي للميكانيكا والكهرباء')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(child: ListTile(
              title: Text(_lang == AppLang.en ? 'Daily 25' : '25 سؤال يومياً', textDirection: dir),
              subtitle: Text(_lang == AppLang.en ? 'Fresh mixed questions' : 'أسئلة متنوعة يومياً', textDirection: dir),
              trailing: const Icon(Icons.today),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const DailyScreen())),
            )),
            const SizedBox(height: 12),
            Card(child: ListTile(
              title: Text(_lang == AppLang.en ? 'Practice Mode' : 'وضع التدريب', textDirection: dir),
              subtitle: Text(_lang == AppLang.en ? 'Endless practice sets' : 'مجموعات تدريب بلا حدود', textDirection: dir),
              trailing: const Icon(Icons.school),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const PracticeScreen())),
            )),
            const SizedBox(height: 12),
            Card(child: ListTile(
              title: Text(_lang == AppLang.en ? 'Settings' : 'الإعدادات', textDirection: dir),
              trailing: const Icon(Icons.settings),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const SettingsScreen())),
            )),
          ],
        ),
      ),
    );
  }
}
