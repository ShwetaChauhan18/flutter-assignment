import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/modules/assignment/questions_screen_store.dart';
import 'package:flutter_home_assignment/values/app_colors.dart';
import 'package:flutter_home_assignment/values/app_text_style.dart';
import 'package:flutter_home_assignment/views/app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../resources/resources.dart';
import '../../views/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late QuestionsScreenStore questionStore;

  @override
  void initState() {
    super.initState();
    //questionStore = Provider.of<QuestionsScreenStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    questionStore = Provider.of<QuestionsScreenStore>(context)..getQuestions();

    return Scaffold(
      appBar: DemoAppBar(
        title: '',
        titleKey: '',
        showProgressIndicator: true,
        progressValue: 0.5,
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          Image.asset(
            Images.brainLight,
            width: MediaQuery.of(context).size.width,
            height: 160,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: questionStore.questionList.length,
              onPageChanged: (index) => questionStore.currentQuestionIndex = index,
              itemBuilder: (BuildContext context, int index) {
                return Observer(
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              questionStore.questionList[index].text ?? '',
                              style: AppTextStyles.questionTextStyle,
                            ),
                            SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                (questionStore.questionList[index].incorrect
                                        ?.length ??
                                    0),
                                (indexAns) => AnswerButton(
                                  buttonColor: AppColors.color5D51CD,
                                  textKey: questionStore
                                      .questionList[index].incorrect![indexAns],
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
