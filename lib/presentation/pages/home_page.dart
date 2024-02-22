import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune/presentation/bloc/fortune_bloc/fortune_bloc.dart';
import 'package:fortune/presentation/widgets/button_custom.dart';
import 'package:fortune/presentation/widgets/count_down.dart';
import 'package:fortune/presentation/widgets/result_widget.dart';
import 'package:fortune/presentation/widgets/time_show_widget.dart';
import 'package:fortune/utils/static_strings.dart';
import 'package:fortune/utils/textstyles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Hero(
              tag: "AppName",
              child: Text(AppStrings.appName, style: FontStyles.appnameStyle)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<FortuneBloc, FortuneState>(
                builder: (context, state) {
                  if (state is ValueGeneratedState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TimeShowWiget(
                            widget1: true,
                            number: state.datamodel.currentSecond),
                        TimeShowWiget(
                            widget1: false,
                            number: state.datamodel.randomNumber)
                      ],
                    );
                  } else {
                    return const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TimeShowWiget(widget1: true, number: 0),
                        TimeShowWiget(widget1: false, number: 0)
                      ],
                    );
                  }
                },
              ),
              BlocBuilder<FortuneBloc, FortuneState>(
                buildWhen: (previous, current) =>
                    current is! ResetCountDownClickedState,
                builder: (context, state) {
                  if (state is ValueGeneratedState) {
                    return ResultWidget(
                      succsess: state.ismatched,
                      dataModel: state.datamodel,
                    );
                  } else {
                    return const ResultWidget(
                      succsess: false,
                    );
                  }
                },
              ),
              const SizedBox(),
              const CountDown(),
              const SizedBox(),
              BlocListener<FortuneBloc, FortuneState>(
                listener: (context, state) {},
                child: CustomButton(
                  onPressed: () {
                    context.read<FortuneBloc>().add(ButtonClickedEvent());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
