import 'package:flutter/material.dart';
import 'package:fortune/presentation/widgets/count_down.dart';
import 'package:fortune/presentation/widgets/result_widget.dart';
import 'package:fortune/presentation/widgets/time_show_widget.dart';
import 'package:fortune/utils/static_strings.dart';
import 'package:fortune/utils/textstyles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.appName, style: FontStyles.appnameStyle),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimeShowWiget(widget1: true, number: 10),
                  TimeShowWiget(widget1: false, number: 10)
                ],
              ),
              const ResultWidget(
                succsess: false,
                attempt: 10,
                succsessCount: 10,
              ),
              // SizedBox(height: size.height / 6),
              // ResultWidget(
              //   succsess: true,
              //   attempt: 5,
              //   succsessCount: 10,
              // )

              const CountDown(),
              ElevatedButton(onPressed: () {}, child: const Text("Click Here"))
            ],
          ),
        ),
      ),
    );
  }
}
