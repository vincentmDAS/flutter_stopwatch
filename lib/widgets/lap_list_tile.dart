import 'package:flutter/material.dart';

import '../utility/constant.dart';

class LapListTile extends StatelessWidget {
  const LapListTile({
    super.key,
    required this.leadingText,
    required this.trailingText,
  });
  final String leadingText;
  final String trailingText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          visualDensity: const VisualDensity(vertical: -4),
          leading: Text(
            leadingText,
            style: AppStyles.tileTextBlack,
          ),
          trailing: Text(
            trailingText,
            style: AppStyles.tileTextBlack,
          ),
        ),
        const Divider()
      ],
    );
  }
}
