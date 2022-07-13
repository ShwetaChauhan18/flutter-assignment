import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_home_assignment/question_dm.dart';
import 'package:mobx/mobx.dart';

part 'questions_store.g.dart';

class QuestionStore = _QuestionStore with _$QuestionStore;

abstract class _QuestionStore with Store {
  List<QuestionDm> questions = <QuestionDm>[];

  @observable
  QuestionDm? currentQuestion;

  int currentQuestionIndex = 0;

  @observable
  double currentProgress = 0.0;

  Timer? timer;

  _QuestionStore() {
    _loadData();
  }

  @observable
  int correctAnswers = 0;

  updateScore() {
    correctAnswers =
        questions.where((element) => element.isAnswerCorrect).length * 100;
  }

  _loadData() async {
    var myData = json.decode(await getJson());
    final result = Questions.fromJson(myData);
    questions.clear();
    questions.addAll(result.questionDm);
    currentQuestion = questions.first;
    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      currentProgress += 0.1;
      if (currentProgress >= 1.0) {
        timer?.cancel();
        timer = null;
        updateNextQuestion();
      }
    });
  }

  updateNextQuestion() {
    currentQuestionIndex += 1;
    if (currentQuestionIndex < questions.length) {
      currentProgress = 0.0;
      currentQuestion = questions[currentQuestionIndex];
      startTimer();
    } else {
      debugPrint('You won');
    }
  }

  Future<String> getJson() {
    return rootBundle.loadString('assets/questions.json');
  }
}
