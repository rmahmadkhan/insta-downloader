import 'package:flutter/material.dart';

class HorizontalSpacing extends StatelessWidget {
  final double of;
  const HorizontalSpacing(this.of, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: of);
  }
}
