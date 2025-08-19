import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/core/utils/colors_manager/colors.dart' show ColorsManager;


class WhatsAppSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final double height;
  final EdgeInsetsGeometry margin;
  final Color enabledColor;
  final Color disabledColor;

  const WhatsAppSearchBar({
    Key? key,
    required this.controller,
    this.onChanged,
    this.height = 40,
    this.margin = const EdgeInsets.symmetric(horizontal: 12),
    this.enabledColor = Colors.white,
    this.disabledColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height.h,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: 'Ask meta anything',
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14.sp),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade600, size: 20.sp),
          contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
          filled: true,
          fillColor: controller.text.isEmpty ? disabledColor.withOpacity(0.1) : enabledColor.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: ColorsManager.textColor, width: 1.sp),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: Colors.red, width: 1.sp),
          ),
        ),
      ),
    );
  }
}
