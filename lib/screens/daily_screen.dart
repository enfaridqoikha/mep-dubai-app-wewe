import 'package:flutter/material.dart';
import '../models/question.dart';
import '../services/question_service.dart';
import '../utils/app_settings.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({super.key});
  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  List<Question> _questions = [];
  int _index = 0;
  int _score = 0;
  bool _loading = true;
  AppLang _lang = AppLang.en;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final lang = await AppSettings.getLang();
    final qs = await QuestionService.loadDaily(lang);
    setState(() {
      _lang = lang;
      _questions = qs;
      _index = 0;
      _score = 0;
      _loading = false;
    });
  }

  void _answer(bool ok){
    if(ok) _score++;
    if(_index + 1 < _questions.length){
      setState(() => _index++);
    } else {
      _finish();
    }
  }

  void _finish(){
    showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        title: Text(_lang==AppLang.en ? 'Daily complete' : 'انتهى التمرين اليومي'),
        content: Text((_lang==AppLang.en ? 'Score: ' : 'النتيجة: ') + '$_score / ${_questions.length}'),
        actions: [
          TextButton(
            onPressed: (){ Navigator.pop(ctx); _load(); },
            child: Text(_lang==AppLang.en ? 'New set' : 'مجموعة جديدة')
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    if(_loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final q = _questions[_index];
    return Scaffold(
      appBar: AppBar(title: Text(_lang==AppLang.en ? 'Daily 25' : '25 سؤال يومياً')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(q.topic, style: Theme.of(context).textTheme.labelLarge, textDirection: _lang.dir),
            const SizedBox(height: 12),
            Text(q.text, style: Theme.of(context).textTheme.titleMedium, textDirection: _lang.dir),
            const SizedBox(height: 12),
            ...q.choices.map((c)=>Card(
              child: ListTile(
                title: Text('${c.id}. ${c.text}', textDirection: _lang.dir),
                onTap: ()=>_answer(c.isCorrect),
              ),
            )),
            const SizedBox(height: 12),
            Text('Ref: ${q.ref}', style: Theme.of(context).textTheme.bodySmall, textDirection: _lang.dir),
            if(q.explanation!=null)...[
              const SizedBox(height:8),
              Text('Note: ${q.explanation!}', style: Theme.of(context).textTheme.bodySmall, textDirection: _lang.dir),
            ]
          ],
        ),
      ),
    );
  }
}
