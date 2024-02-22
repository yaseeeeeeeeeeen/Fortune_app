import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune/data/data_resourse/shared_preferance.dart';
import 'package:fortune/data/reposetory/fortune_repo.dart';
import 'package:fortune/presentation/bloc/fortune_bloc/fortune_bloc.dart';
import 'package:fortune/presentation/pages/splash_page.dart';
import 'package:fortune/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.instance.initSharedPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FortuneBloc(FortuneRepo()),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.scaffoldColor),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
