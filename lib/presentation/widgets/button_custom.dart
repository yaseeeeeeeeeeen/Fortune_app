import 'package:flutter/material.dart';
import 'package:fortune/utils/colors.dart';
import 'package:fortune/utils/textstyles.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(size.width - 40, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: AppColors.buttonColor),
      child: Text("CLICK HERE", style: FontStyles.buttontext),
    );
  }
}
