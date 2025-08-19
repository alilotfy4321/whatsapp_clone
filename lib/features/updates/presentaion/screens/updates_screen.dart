import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/core/utils/colors_manager/colors.dart';
import 'package:whatsapp_clone/features/updates/presentaion/widgets/status_avatar.dart';

class UpdatesScreen extends StatefulWidget {
  const UpdatesScreen({super.key});

  @override
  State<UpdatesScreen> createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  bool isViewed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElasticInDown(
          child: Text(
            'Updates',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? ColorsManager.textColor
                  : ColorsManager.whiteColor,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElasticInRight(
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Status',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  ElasticInLeft(
                    child: ListTile(
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundImage: AssetImage('assets/images/2.png'),
                          ),
                          Positioned(
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 15.r,
                              backgroundColor: ColorsManager.whiteColor,
                              child: CircleAvatar(
                                radius: 13.r,
                                backgroundColor: ColorsManager.accentColor,
                                child: Icon(
                                  Icons.add,
                                  color: ColorsManager.whiteColor,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        'Add my status',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      subtitle: Text(
                        'disappeared after 24 hours',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  ElasticInLeft(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 2, // Example count
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: StatusAvatar(
                            imagePath: 'assets/images/2.png',
                            isViewed: true,
                          ),
                          title: Text(
                            'User $index',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          subtitle: Text(
                            '2:10 pm',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Recent Status',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 20.h),
                  ElasticInRight(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: StatusAvatar(
                            imagePath: 'assets/images/2.png',
                            isViewed: false,
                          ),
                          title: Text(
                            'User $index',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          subtitle: Text(
                            '3:00 pm',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 90.h,
            right: 5.w,
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: SizedBox(
                height: 50.h,
                width: 40.w,
                child: FloatingActionButton(
                  backgroundColor: Colors.grey[100],
                  onPressed: () {},
                  child: Icon(
                    Icons.edit,
                    color: ColorsManager.textColor,
                    size: 24.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ElasticInUp(
        child: FloatingActionButton(
          backgroundColor: ColorsManager.accentColor,
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: Image.asset(
              'assets/images/add-photo.png',
              width: 24.w,
              height: 24.h,
              color: ColorsManager.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
