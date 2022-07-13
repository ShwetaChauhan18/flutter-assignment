import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/modules/assignment/question_store.dart';
import 'package:flutter_home_assignment/values/app_colors.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../providers/questions.dart';
import '../../resources/resources.dart';
import '../../views/answer_widget.dart';
import '../../views/question_widget.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late QuestionStore store;

  @override
  void initState() {
    store = QuestionStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CloseButton(),
                Row(
                  children: [
                    Observer(builder: (context) {
                      return Text(store.correctAnswers.toString());
                    }),
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(Icons.star),
                  ],
                )
              ],
            ),
            Observer(builder: (context) {
              return LinearProgressIndicator(
                value: store.currentProgress,
                color: AppColors.colorA1E04D,
                backgroundColor: Colors.grey.shade300,
                minHeight: 5,
              );
            }),
            SizedBox(height: 24),
            Image.asset(
              Images.brainLight,
              width: MediaQuery.of(context).size.width,
              height: 160,
              fit: BoxFit.cover,
            ),
            Observer(builder: (context) {
              return store.currentQuestion != null
                  ? Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          QuestionWidget(
                            textKey: store.currentQuestion!.text ?? '',
                          ),
                          SizedBox(height: 16),
                          _getAnswers(store.currentQuestion!),
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            }),
          ],
        ),
      ),
    );
  }

  _getAnswers(QuestionDm question) {
    final options = [...question.incorrect, question.correct];
    options.shuffle();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        options.length,
        (index) => AnswerWidget(
          buttonColor: AppColors.color5D51CD,
          textKey: options[index] ?? '',
          onTap: () {
            if (options[index] == question.correct) {
              store.correctAnswers += 100;
            }
            store.updateNextQuestion();
          },
        ),
      ),
    );
  }
}
