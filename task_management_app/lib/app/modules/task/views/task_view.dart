import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utills/widget/header.dart';
import 'package:task_management_app/app/utills/widget/sidebar.dart';
import 'package:task_management_app/app/utills/widget/style/AppColors.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const Sidebar(),
      backgroundColor: AppColors.primaryBg,
      body: Row(
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
              child: Container(
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
                                          fontSize: 20,
                                          color: AppColors.primarytext),
                                    ),
                                    Text(
                                      'Manage task mode easy with friends',
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
                                  width: 15,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.amber,
                                    radius: 25,
                                    foregroundImage: NetworkImage(
                                        'https://withme.id/wp-content/uploads/2019/04/customer-service-adalah.jpg'),
                                  ),
                                )
                              ],
                            ),
                          ),

                    // content/isi
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(50),
                            margin: !context.isPhone
                                ? const EdgeInsets.all(10)
                                : const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: !context.isPhone
                                  ? BorderRadius.circular(50)
                                  : BorderRadius.circular(30),
                            )))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
