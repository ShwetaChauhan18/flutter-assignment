// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuestionStore on _QuestionStore, Store {
  late final _$currentQuestionAtom =
      Atom(name: '_QuestionStore.currentQuestion', context: context);

  @override
  QuestionDm? get currentQuestion {
    _$currentQuestionAtom.reportRead();
    return super.currentQuestion;
  }

  @override
  set currentQuestion(QuestionDm? value) {
    _$currentQuestionAtom.reportWrite(value, super.currentQuestion, () {
      super.currentQuestion = value;
    });
  }

  late final _$currentProgressAtom =
      Atom(name: '_QuestionStore.currentProgress', context: context);

  @override
  double get currentProgress {
    _$currentProgressAtom.reportRead();
    return super.currentProgress;
  }

  @override
  set currentProgress(double value) {
    _$currentProgressAtom.reportWrite(value, super.currentProgress, () {
      super.currentProgress = value;
    });
  }

  late final _$correctAnswersAtom =
      Atom(name: '_QuestionStore.correctAnswers', context: context);

  @override
  int get correctAnswers {
    _$correctAnswersAtom.reportRead();
    return super.correctAnswers;
  }

  @override
  set correctAnswers(int value) {
    _$correctAnswersAtom.reportWrite(value, super.correctAnswers, () {
      super.correctAnswers = value;
    });
  }

  @override
  String toString() {
    return '''
currentQuestion: ${currentQuestion},
currentProgress: ${currentProgress},
correctAnswers: ${correctAnswers}
    ''';
  }
}
