import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class RidePrefInput extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  final IconData? rightIcon;

  const RidePrefInput({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor;
    if (title.contains("Select")) {
      textColor = BlaColors.textLight;
    } else {
      textColor = BlaColors.textNormal;
    }


    Widget? trailingWidget;
    if (rightIcon != null) {
      trailingWidget = IconButton(
        icon: Icon(rightIcon, color: BlaColors.primary),
        onPressed: () {
        },
      );
    }

    return ListTile(
      onTap: onPressed,
      leading: Icon(icon, color: BlaColors.iconLight),
      title: Text(
        title,
        style: BlaTextStyles.button.copyWith(fontSize: 14, color: textColor),
      ),
      trailing: trailingWidget,
    );
  }
}
