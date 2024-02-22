import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune/presentation/bloc/fortune_bloc/fortune_bloc.dart';
import 'package:fortune/presentation/pages/home_page.dart';
import 'package:fortune/utils/colors.dart';
import 'package:fortune/utils/static_strings.dart';
import 'package:fortune/utils/textstyles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Center(
        child: Text(AppStrings.appName, style: FontStyles.splashTitle),
      ),
    );
  }

  Future<void> fetchData() async {
    context.read<FortuneBloc>().add(FetchDataEvent());
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    }
  }
}
