import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:task_management_app/app/utills/widget/PeopleYouMayKnow.dart';
import 'package:unicons/unicons.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utills/widget/header.dart';
import 'package:task_management_app/app/utills/widget/sidebar.dart';
import 'package:task_management_app/app/utills/widget/style/AppColors.dart';
import '../../../data/controller/auth_controller.dart';
import '../../../utills/widget/MyFriends.dart';
import '../../../utills/widget/MyTask.dart';
import '../../../utills/widget/UpcomingTask.dart';
import '../controllers/home_controller.dart';

// import 'package:ionicons/ionicons.dart';
// import 'package:task_management_app/app/routes/app_pages.dart';
class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authCont = Get.find<AuthController>();
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
                                child: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 25,
                                  foregroundImage: NetworkImage(
                                      authCont.auth.currentUser!.photoURL!),
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
                                  'People You May Know',
                                  style: TextStyle(
                                    color: AppColors.primarytext,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // MY TASK
                          PeopleYouMayKnow(),

                          // UPCOMING
                          !context.isPhone
                              ? Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyTask(),
                                      MyFriends(),
                                    ],
                                  ),
                                )
                              : MyTask(),
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
