import 'package:flutter/material.dart';
import '../utils/app_size_class.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final double? height;
  final double? borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.color,
    this.textColor,
    this.icon,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = Theme.of(context).textTheme.labelLarge ?? const TextStyle();

    return SizedBox(
      width: double.infinity,
      height: height ?? getHeight(AppDimensions.button52),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.disabled)) {
              return (color ?? context.appColors.primary).withValues(alpha: 0.6);
            }
            return color ?? context.appColors.primary;
          }),
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? getRadius(AppDimensions.radius12)),
            ),
          ),
          overlayColor: WidgetStateProperty.all(Colors.white.withValues(alpha: 0.1)),
        ),
        child: isLoading
            ? SizedBox(
          height: getRadius(AppDimensions.icon24),
          width: getRadius(AppDimensions.icon24),
          child: CircularProgressIndicator(
            color: textColor ?? Colors.white,
            strokeWidth: 2,
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor ?? Colors.white, size: getRadius(AppDimensions.icon20)),
              SizedBox(width: getWidth(AppDimensions.space8)),
            ],
            Text(
              text,
              style: defaultTextStyle.copyWith(
                fontSize: getSp(AppDimensions.font16),
                fontWeight: FontWeight.bold,
                color: textColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}