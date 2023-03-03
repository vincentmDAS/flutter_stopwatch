import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace(
    this.width, {
    Key? key,
  }) : super(key: key);

  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class VerticalSpace extends StatelessWidget {
  const VerticalSpace(
    this.height, {
    Key? key,
  }) : super(key: key);

  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
