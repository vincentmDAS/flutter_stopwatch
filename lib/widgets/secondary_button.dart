import 'package:flutter/material.dart';

import '../utility/constant.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.displayText,
    required this.onPressed,
    this.isEnabled = false,
  });

  final String displayText;
  final VoidCallback onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 90,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          disabledBackgroundColor: AppColors.backgroundGrey,
          backgroundColor: AppColors.backgroundGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          displayText,
          style:
              isEnabled ? AppStyles.buttonMainBlack : AppStyles.buttonMainGrey,
        ),
      ),
    );
  }
}
