import 'package:flutter/material.dart';
import 'package:fortune/utils/colors.dart';
import 'package:fortune/utils/static_strings.dart';
import 'package:fortune/utils/textstyles.dart';

class ResultWidget extends StatelessWidget {
  final bool succsess;
  final int attempt;
  final int succsessCount;
  const ResultWidget(
      {super.key,
      required this.succsess,
      required this.attempt,
      required this.succsessCount});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.all(10),
      height: size.height / 6,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: succsess ? AppColors.succsessColor : AppColors.failedColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          succsess
              ? Text(AppStrings.succsessTextOne,
                  style: FontStyles.resultTextStyle)
              : Text(AppStrings.failedTextOne,
                  style: FontStyles.resultTextStyle),
          Divider(color: AppColors.dividerColor),
          succsess
              ? Text("${AppStrings.succsessTextTwo} $succsessCount/$attempt",
                  style: FontStyles.resultTextStyle)
              : Text("${AppStrings.failedTextTwo} $attempt",
                  style: FontStyles.resultTextStyle)
        ],
      ),
    );
  }
}
