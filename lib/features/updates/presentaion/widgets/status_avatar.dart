import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusAvatar extends StatelessWidget {
  final String imagePath;
  final bool isViewed; // false = new status, true = already viewed

  const StatusAvatar({
    super.key,
    required this.imagePath,
    this.isViewed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.r), // مساحة الحلقة الخارجية
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isViewed ? Colors.grey : Colors.green, // لون الحلقة حسب الحالة
          width: 3.r,
        ),
      ),
      child: CircleAvatar(
        radius: 30.r,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
