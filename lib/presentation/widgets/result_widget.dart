import 'package:flutter/material.dart';
import 'package:fortune/domin/model/data_model.dart';
import 'package:fortune/utils/colors.dart';
import 'package:fortune/utils/static_strings.dart';
import 'package:fortune/utils/textstyles.dart';

class ResultWidget extends StatelessWidget {
  final bool succsess;
  final DataModel? dataModel;
  const ResultWidget({super.key, this.dataModel, required this.succsess});

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
              ? Text(
                  "${AppStrings.succsessTextTwo} ${dataModel?.successCount}/${dataModel?.attempts}",
                  style: FontStyles.resultTextStyle)
              : Text("${AppStrings.failedTextTwo} ${dataModel?.attempts ?? 0}",
                  style: FontStyles.resultTextStyle)
        ],
      ),
    );
  }
}
