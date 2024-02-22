import 'package:flutter/material.dart';
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
        body: const Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimeShowWiget(widget1: true, number: 10),
                  TimeShowWiget(widget1: false, number: 10)
                ],
              ),
              ResultWidget(
                succsess: false,
                attempt: 10,
                succsessCount: 10,
              ),
              ResultWidget(
                succsess: true,
                attempt: 5,
                succsessCount: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
