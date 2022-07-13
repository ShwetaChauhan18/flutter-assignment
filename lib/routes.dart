import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/modules/assignment/questions_screen.dart';
import 'package:flutter_home_assignment/modules/assignment/question_store.dart';
import 'package:flutter_home_assignment/utils/extensions.dart';

import 'values/strings.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    AppStrings.questionsScreen: (context) =>
        const QuestionsScreen().withProvider<QuestionStore>(QuestionStore()),
  };
}
