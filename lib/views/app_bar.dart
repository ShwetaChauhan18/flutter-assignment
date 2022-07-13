import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/resources.dart';
import '../utils/extensions.dart';
import '../values/app_colors.dart';

class DemoAppBar extends StatelessWidget implements PreferredSizeWidget {
  DemoAppBar({
    Key? key,
    required this.titleKey,
    this.showElevation = false,
    this.crossIconPadding,
    this.backIconPadding,
    this.titleTextStyle,
    this.elevationPadding,
    this.title,
    this.showProgressIndicator = false,
    this.progressValue,
    this.onCloseTap,
    this.backgroundColor,
  }) : super(key: key);

  final String titleKey;
  final String? title;
  final AppBar appBar = AppBar();
  final bool showElevation;
  final EdgeInsets? crossIconPadding;
  final EdgeInsets? backIconPadding;
  final TextStyle? titleTextStyle;
  final double? elevationPadding;
  final bool showProgressIndicator;
  final double? progressValue;
  final void Function()? onCloseTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: 0,
      actions: [],
      bottom: PreferredSize(
        child: showElevation
            ? Container(
                margin: EdgeInsets.symmetric(
                  horizontal: elevationPadding ?? 23,
                ),
                color: AppColors.color656674,
                height: 1.4,
              )
            : showProgressIndicator
                ? LinearProgressIndicator(
                    value: progressValue,
                    color: AppColors.colorA1E04D,
                    backgroundColor: Colors.grey.shade300,
                    minHeight: 5,
                  )
                : SizedBox(),
        preferredSize: Size.fromHeight(1.5),
      ),
      leading: IconButton(
        padding: crossIconPadding ?? const EdgeInsets.all(12.0),
        icon: SvgPicture.asset(Vectors.close),
        onPressed: onCloseTap ?? context.pop,
      ),
      centerTitle: true,
      title: Text(
        title ?? titleKey,
        style: titleTextStyle ??
            TextStyle(
              color: AppColors.colorAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 0.09,
            ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
