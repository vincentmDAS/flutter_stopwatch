import 'package:flutter/material.dart';
import 'package:flutter_stopwatch/utility/constant.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.displayText,
    required this.onPressed,
    this.isStartButton = false,
  });

  final String displayText;
  final VoidCallback onPressed;
  final bool isStartButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 90,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isStartButton
              ? AppColors.backgroundGreen
              : AppColors.backgroundRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          displayText,
          style: isStartButton
              ? AppStyles.buttonMainGreen
              : AppStyles.buttonMainRed,
        ),
      ),
    );
  }
}
