import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Core
import 'package:whatsapp_clone/core/utils/colors_manager/colors.dart';

// Features
import 'package:whatsapp_clone/features/calls/presentaion/screens/calls_screen.dart';
import 'package:whatsapp_clone/features/communications/presentaion/screens/communications_screen.dart';
import 'package:whatsapp_clone/features/home/presentaion/screen/chats_List_screen.dart';
import 'package:whatsapp_clone/features/updates/presentaion/screens/updates_screen.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
    int currentIndex = 0;

  final List<Widget> screens =  [
    ChatsScreen(),
    UpdatesScreen(),
    CommunitiesScreen(), 
    CallsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          _buildNavItem(Icons.chat, 'Chats', 0),
          _buildNavItem(Icons.update, 'Updates', 1),
          _buildNavItem(Icons.groups_2, 'Communities', 2),
          _buildNavItem(Icons.call, 'Calls', 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      IconData icon, String label, int index) {
    final isSelected = currentIndex == index;

    return BottomNavigationBarItem(
      icon: isSelected
          ? Container(
            width: 50.w,
            height: 30.h,
              decoration: BoxDecoration(
                color: ColorsManager.accentColor.withValues(alpha: 0.3), 
                borderRadius:  BorderRadius.circular(
                  15.0.r,
                ),
              ),
              child: Icon(icon,),
            )
          : Icon(icon),
      label: label,
    );
  }

}
