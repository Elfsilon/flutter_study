import 'package:flutter/material.dart';
import 'package:studyapp1_firebase/theme.dart';

enum LabelType { warning, error, success }

class IconLabel extends StatelessWidget {
  const IconLabel({
    Key? key,
    required this.text,
    required this.type,
  }) : super(key: key);

  final String text;
  final LabelType type;

  IconData _pickIcon() {
    if (type == LabelType.error) return Icons.error;
    if (type == LabelType.warning) return Icons.warning;
    return Icons.done;
  }

  Color _pickTextColor() {
    if (type == LabelType.error) return AppColors.primary;
    if (type == LabelType.warning) return AppColors.warning;
    return AppColors.info;
  }

  Color _pickBgColor() {
    if (type == LabelType.error) return AppColors.secondary;
    if (type == LabelType.warning) return AppColors.warningBg;
    return AppColors.infoBg;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _pickBgColor(),
        borderRadius: Constants.borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(_pickIcon(), color: _pickTextColor()),
            ),
            Text(
              text,
              style: TextStyle(color: _pickTextColor()),  
            ),
          ],
        ),
      ),
    );
  }
}