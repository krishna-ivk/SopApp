import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProgressIndicatorBar extends StatelessWidget {
  final double value; // 0.0 to 1.0
  final double height;
  final Color? color;

  const ProgressIndicatorBar({
    super.key,
    required this.value,
    this.height = 8,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final clampedValue = value.clamp(0.0, 1.0);
    final barColor = color ??
        (clampedValue >= 1.0
            ? AppTheme.successGreen
            : clampedValue >= 0.5
                ? AppTheme.accentAmber
                : AppTheme.dangerRed);

    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: LinearProgressIndicator(
        value: clampedValue,
        minHeight: height,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        valueColor: AlwaysStoppedAnimation<Color>(barColor),
      ),
    );
  }
}
