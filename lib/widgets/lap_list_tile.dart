import 'package:flutter/material.dart';

class LapListTile extends StatelessWidget {
  const LapListTile({
    super.key,
    required this.leading,
    required this.trailing,
  });
  final Widget leading;
  final Widget trailing;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          visualDensity: const VisualDensity(vertical: -4),
          leading: leading,
          trailing: trailing,
        ),
        const Divider()
      ],
    );
  }
}
