import 'package:flutter/material.dart';
import '../utils/app_settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AppLang _lang = AppLang.en;

  @override
  void initState() {
    super.initState();
    AppSettings.getLang().then((l)=>setState(()=>_lang=l));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_lang==AppLang.en ? 'Settings' : 'الإعدادات')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(_lang==AppLang.en ? 'Language' : 'اللغة', textDirection: _lang.dir),
              subtitle: Text(_lang==AppLang.en ? 'English / Arabic' : 'العربية / الإنجليزية', textDirection: _lang.dir),
              trailing: SegmentedButton<AppLang>(
                segments: const [
                  ButtonSegment(value: AppLang.en, label: Text('EN')),
                  ButtonSegment(value: AppLang.ar, label: Text('AR')),
                ],
                selected: {_lang},
                onSelectionChanged: (s) async {
                  final v = s.first;
                  await AppSettings.setLang(v);
                  setState(()=>_lang=v);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
