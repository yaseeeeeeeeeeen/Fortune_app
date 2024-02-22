import 'package:flutter/material.dart';
import 'package:fortune/utils/colors.dart';
import 'package:fortune/utils/textstyles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          fixedSize: Size(size.width - 40, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: AppColors.buttonColor),
      child: Text("CLICK HERE", style: FontStyles.buttontext),
    );
  }
}
