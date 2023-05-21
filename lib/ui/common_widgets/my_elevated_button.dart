import 'package:flutter/material.dart';
import 'package:insta_downloader/ui/common_widgets/my_text.dart';
import 'package:insta_downloader/utils/app_theme.dart';
import 'package:insta_downloader/utils/constants.dart';

class MyElevatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color buttonColor;
  final Color labelColor;
  final Color? iconColor;
  final IconData? icon;
  final bool isDisabled;
  final bool isExpanded;
  final double height;
  final double verticalPadding;
  final double horizontalPadding;
  final double fontSize;
  final double? iconSize;
  final double radius;

  const MyElevatedButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.buttonColor = AppTheme.primaryColor,
    this.labelColor = AppTheme.whiteColor,
    this.iconColor,
    this.icon,
    this.isDisabled = false,
    this.isExpanded = true,
    this.height = 40,
    this.fontSize = 14,
    this.verticalPadding = 10,
    this.horizontalPadding = 16,
    this.iconSize,
    this.radius = kDefaultRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : onTap,
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(
          color: buttonColor.withOpacity(isDisabled ? 0.5 : 1),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: Row(
          mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(icon,
                        size: iconSize ?? fontSize,
                        color: iconColor ?? labelColor),
                  )
                : kEmptyWidget,
            MyText(
              label,
              color: labelColor.withOpacity(isDisabled ? 0.5 : 1),
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
