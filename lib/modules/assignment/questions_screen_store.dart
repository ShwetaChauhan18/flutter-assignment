import 'package:flutter_home_assignment/providers/questions.dart';
import 'package:mobx/mobx.dart';

part 'questions_screen_store.g.dart';

class QuestionsScreenStore = _QuestionsScreenStore with _$QuestionsScreenStore;

abstract class _QuestionsScreenStore with Store {
  @observable
  double questionProgress = 0;

  @observable
  int currentQuestionIndex = 0;

  @observable
  List<Question> questionList = [];

  @observable
  List<String> answerList = [];

  bool get isLastIndex => currentQuestionIndex == questionList.length - 1;

  @action
  Future<void> getQuestions() async {
    questionList.addAll(Questions().items);
  }

  @action
  Future<void> getAnswers() async {
    answerList.add(questionList[currentQuestionIndex].correct ?? '');
    answerList.addAll(
        questionList[currentQuestionIndex].incorrect?.toList(growable: true) ??
            []);
  }
}
