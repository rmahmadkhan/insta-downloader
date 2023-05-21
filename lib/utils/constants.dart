import 'package:flutter/material.dart';

/// Sizes
const double kDefaultRadius = 8;

/// Widgets & Functions
const kEmptyWidget = SizedBox.shrink();

void dismissKeyboard(BuildContext context) {
  final FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
}
