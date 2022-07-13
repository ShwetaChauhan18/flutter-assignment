import 'package:flutter/material.dart';

import '../values/app_colors.dart';
import '../values/app_text_style.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    Key? key,
    required this.onTap,
    required this.textKey,
    this.extraTextKey = '',
    this.showBorder = false,
    this.buttonColor,
    this.textColor,
    this.textStyle,
    this.borderWidth,
    this.borderRadius,
    this.fontSize,
    this.enabled = true,
    this.buttonInnerPadding,
    this.borderColor,
    this.buttonOuterPadding,
    this.isLoading = false,
  }) : super(key: key);
  final void Function() onTap;
  final String textKey;
  final String extraTextKey;
  final bool showBorder;
  final Color? buttonColor;
  final Color? textColor;
  final double? borderWidth;
  final double? borderRadius;
  final double? fontSize;
  final bool enabled;
  final double? buttonInnerPadding;
  final TextStyle? textStyle;
  final double? buttonOuterPadding;
  final Color? borderColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: buttonOuterPadding ?? 8.0),
        child: ElevatedButton(
          onPressed: enabled ? onTap : null,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(buttonInnerPadding ?? 17),
            elevation: 0,
            onSurface: showBorder
                ? Colors.white
                : buttonColor ?? AppColors.colorPrimary,
            primary: showBorder
                ? Colors.white
                : buttonColor ?? AppColors.colorPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 6),
              side: BorderSide(
                width: borderWidth ?? 1.0,
                color: showBorder
                    ? borderColor ?? AppColors.colorPrimary
                    : Colors.transparent,
              ),
            ),
          ),
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: AppColors.colorPrimary,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  textKey,
                  style: textStyle ??
                      AppTextStyles.buttonStyle.copyWith(
                        color: showBorder
                            ? AppColors.colorPrimary
                            : textColor ?? Colors.white,
                        fontSize: fontSize,
                      ),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
