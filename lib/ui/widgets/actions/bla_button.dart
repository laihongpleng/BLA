import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class BlaButton extends StatelessWidget {
  final String label;
  final IconData? leadingIcon;
  final bool primary;
  final bool isEnabled;
  final VoidCallback onTap;

  const BlaButton({
    super.key,
    required this.label,
    this.leadingIcon,
    this.primary = true,
    this.isEnabled = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color btnTextColor = primary ? Colors.white : BlaColors.neutral;

    return ElevatedButton(
      onPressed: isEnabled ? onTap : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: primary ? BlaColors.primary : BlaColors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null)
          Icon(leadingIcon, color: btnTextColor, size: 22),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: btnTextColor,
              fontSize: BlaTextStyles.button.fontSize,
              fontWeight: BlaTextStyles.button.fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
