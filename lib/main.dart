import 'package:flutter/material.dart';
import 'package:fortune/presentation/pages/home_page.dart';
import 'package:fortune/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.scaffoldColor),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
