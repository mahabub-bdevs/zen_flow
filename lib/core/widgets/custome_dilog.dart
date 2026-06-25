import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zen_flow/core/core.dart';

void customDialog({
  required String title,
  required String message,
  required VoidCallback onConfirm,
  String confirmText = 'Confirm',
  String cancelText = 'Cancel',
  Color confirmColor = Colors.red,
  IconData icon = Icons.logout,
}) {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      alignment: AlignmentGeometry.bottomCenter,
      icon: Icon(icon, size: AppDimensions.icon32.sp, color: AppColors.primary),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: Text(
        message,
        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
      ),
      actions: [
        // Cancel
        TextButton(onPressed: () => Get.back(), child: Text(cancelText)),

        // Confirm
        ElevatedButton(
          onPressed: () {
            Get.back();
            onConfirm();
          },
          style: ElevatedButton.styleFrom(backgroundColor: confirmColor),
          child: Text(confirmText, style: const TextStyle(color: Colors.white)),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
