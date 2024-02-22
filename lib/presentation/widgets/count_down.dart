import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune/presentation/bloc/fortune_bloc/fortune_bloc.dart';
import 'package:fortune/utils/colors.dart';
import 'package:fortune/utils/snackbar.dart';
import 'package:fortune/utils/static_strings.dart';

class CountDown extends StatefulWidget {
  const CountDown({
    super.key,
  });

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late Timer _timer;
  int _seconds = 5;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _resetCountdown(false);
      }
    });
  }

  void _resetCountdown(bool buttonClicked) {
    if (!buttonClicked) {
      CustomSnackBar.showCustomSnackBar(context, AppStrings.resetMessege);
      context.read<FortuneBloc>().add(ResetCountDownNotClickedEvent());
    }
    setState(() {
      _seconds = 5;
      buttonClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Transform.scale(
        scale: 3,
        child: BlocListener<FortuneBloc, FortuneState>(
          listener: (context, state) {
            if (state is ResetCountDownClickedState) {
              _resetCountdown(state.isClicked);
            }
          },
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey,
            strokeCap: StrokeCap.round,
            value: _seconds / 5,
            color: AppColors.buttonColor,
            strokeWidth: 3,
          ),
        ),
      ),
      Text(
        "${AppStrings.timerStatic}$_seconds",
        style: const TextStyle(fontSize: 26, color: Colors.black),
      )
    ]);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
