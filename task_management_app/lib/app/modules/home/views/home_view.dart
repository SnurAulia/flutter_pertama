import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utills/widget/header.dart';
import 'package:task_management_app/app/utills/widget/sidebar.dart';
import 'package:task_management_app/app/utills/widget/style/AppColors.dart';
import '../../../utills/widget/MyFriends.dart';
import '../../../utills/widget/MyTask.dart';
import '../../../utills/widget/UpcomingTask.dart';
import '../controllers/home_controller.dart';

// import 'package:ionicons/ionicons.dart';
// import 'package:task_management_app/app/routes/app_pages.dart';
class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(width: 150, child: Sidebar()),
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: Row(
          children: [
            !context.isPhone
                ? const Expanded(
                    flex: 2,
                    child: Sidebar(),
                  )
                : const SizedBox(),
            // header
            Expanded(
              flex: 15,
              child: Column(
                children: [
                  !context.isPhone
                      ? const header()
                      : Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _drawerKey.currentState!.openDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  color: AppColors.primarytext,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Task Management',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: AppColors.primarytext),
                                  ),
                                  Text(
                                    'Manage task mode easy',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primarytext),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.notifications,
                                color: AppColors.primarytext,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 25,
                                  foregroundImage: NetworkImage(
                                      'https://th.bing.com/th/id/R.4423b396783ee5e3c974c3f42d31a5d2?rik=B2TGBxm6KvE62Q&riu=http%3a%2f%2fi1.hdslb.com%2fbfs%2farchive%2f74188e89512904b3c99db99b5cd7eb4ed6876e80.jpg&ehk=w8PLQ5hrZzAC2zHbr2kFvq7R7YsE5GWxGBw6tP9KFis%3d&risl=&pid=ImgRaw&r=0'),
                                ),
                              )
                            ],
                          ),
                        ),

                  // content/isi
                  Expanded(
                    child: Container(
                      padding: !context.isPhone
                          ? const EdgeInsets.all(50)
                          : const EdgeInsets.all(20),
                      margin: !context.isPhone
                          ? const EdgeInsets.all(10)
                          : const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: !context.isPhone
                            ? BorderRadius.circular(50)
                            : BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            // height: Get.height * 0.1,
                            child: Column(
                              children: const [
                                Text(
                                  'My Task',
                                  style: TextStyle(
                                    color: AppColors.primarytext,
                                    fontSize: 30,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),

                          // MY TASK
                          MyTask(),

                          // UPCOMING
                          !context.isPhone
                              ? Expanded(
                                  child: Row(
                                    children: const [
                                      UpcomingTask(),
                                      MyFriends(),
                                    ],
                                  ),
                                )
                              : const UpcomingTask(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
