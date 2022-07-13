import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/question_dm.dart';
import 'package:flutter_home_assignment/questions_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late QuestionStore store;

  @override
  void initState() {
    store = QuestionStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
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
                const Divider(
                  thickness: 2,
                  height: 10,
                ),
                Observer(builder: (context) {
                  return LinearProgressIndicator(value: store.currentProgress);
                }),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/quiz.png',
                  height: 150,
                  width: 150,
                ),
                Observer(builder: (context) {
                  return store.currentQuestion != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                store.currentQuestion!.text ?? '',
                                textAlign: TextAlign.center,
                              ),
                              _getAnswers(store.currentQuestion!)
                            ],
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                })
              ],
            ),
          ),
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
          (index) => _getAnswerButton(
              answer: options[index] ?? '',
              onPressed: () {
                if (options[index] == question.correct) {
                  store.correctAnswers += 100;
                }
              })),
    );
  }

  _getAnswerButton({required String answer, required VoidCallback onPressed}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: MaterialButton(
            onPressed: onPressed,
            color: Colors.blue,
            child: Text(answer),
          ),
        ),
      );
}
