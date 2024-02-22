import 'package:flutter/material.dart';
import 'package:fortune/utils/colors.dart';
import 'package:fortune/utils/static_strings.dart';
import 'package:fortune/utils/textstyles.dart';

class TimeShowWiget extends StatelessWidget {
  final bool widget1;
  final int number;
  const TimeShowWiget({super.key, required this.widget1, required this.number});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: widget1
                  ? AppColors.widgetOneColor
                  : AppColors.widgetTwoColor),
          borderRadius: BorderRadius.circular(10),
          color: widget1 ? AppColors.widgetOneColor : AppColors.widgetTwoColor),
      height: size.height / 8,
      width: size.width / 2 - 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget1
              ? Text(AppStrings.widgetOneText,
                  style: FontStyles.wiget1and2Style)
              : Text(AppStrings.widgetTwoText,
                  style: FontStyles.wiget1and2Style),
          Divider(
            color: AppColors.dividerColor,
          ),
          Text(number.toString())
        ],
      ),
    );
  }
}
