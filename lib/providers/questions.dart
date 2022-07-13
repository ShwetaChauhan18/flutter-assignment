class QuestionsList {
  final List<QuestionDm> questionDm;

  QuestionsList({required this.questionDm});

  QuestionsList.fromJson(Map<String, dynamic> json)
      : questionDm = (json['questions'] as List?)
            ?.map((e) => e == null
                ? <QuestionDm>[]
                : QuestionDm.fromJson(e as Map<String, dynamic>))
            .toList()
            .cast<QuestionDm>() as List<QuestionDm>;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_dm'] = questionDm.map((v) => v.toJson()).toList();
    return data;
  }
}

class QuestionDm {
  final List<String> incorrect;
  final String? text;
  final String? correct;
  bool isAnswerCorrect = false;

  QuestionDm({required this.incorrect, this.text, this.correct});

  QuestionDm.fromJson(Map<String, dynamic> json)
      : incorrect = json['incorrect'].cast<String>(),
        text = json['text'],
        correct = json['correct'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['incorrect'] = incorrect;
    data['text'] = text;
    data['correct'] = correct;
    return data;
  }
}
