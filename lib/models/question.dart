class Choice {
  final String id;
  final String text;
  final bool isCorrect;

  Choice({required this.id, required this.text, required this.isCorrect});

  factory Choice.fromJson(Map<String, dynamic> j) => Choice(
    id: j['id'] as String,
    text: j['text'] as String,
    isCorrect: j['isCorrect'] as bool,
  );
}

class Question {
  final String topic;
  final String text;
  final List<Choice> choices;
  final String ref;
  final String? explanation;

  Question({
    required this.topic,
    required this.text,
    required this.choices,
    required this.ref,
    this.explanation
  });

  factory Question.fromJson(Map<String, dynamic> j) => Question(
    topic: j['topic'] as String,
    text: j['text'] as String,
    choices: (j['choices'] as List).map((e) => Choice.fromJson(e)).toList(),
    ref: j['ref'] as String,
    explanation: j['explanation'] as String?,
  );
}
