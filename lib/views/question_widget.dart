import 'package:flutter/material.dart';

import '../values/app_text_style.dart';

class QuestionWidget extends StatlessWidget {
  const QuestionWidget({
    Key? key,
    required this.textKey,
    this.textStyle,
  }) : super(key: key);

  final String textKey;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      textKey,
      style: textStyle ?? AppTextStyles.questionTextStyle,
    );
  }
}
