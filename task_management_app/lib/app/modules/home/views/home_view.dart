import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:task_management_app/app/routes/app_pages.dart';
import 'package:task_management_app/app/utills/widget/header.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:task_management_app/app/routes/app_pages.dart';
import 'package:task_management_app/app/utills/widget/sidebar.dart';
import 'package:task_management_app/app/utills/widget/style/AppColors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const Sidebar(),
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
                              height: Get.height * 0.3,
                              child: Column(
                                children: [
                                  const Text(
                                    'My Task',
                                    style: TextStyle(
                                        color: AppColors.primarytext,
                                        fontSize: 30),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),

                            // MY TASK
                            SizedBox(
                              height: 400,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                children: [
                                  // CARD 1
                                  SizedBox(
                                    height: 200,
                                    child: Container(
                                      width: 400,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.card,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                child: const CircleAvatar(
                                                  backgroundColor: Colors.amber,
                                                  radius: 20,
                                                  foregroundImage: NetworkImage(
                                                      'https://withme.id/wp-content/uploads/2019/04/customer-service-adalah.jpg'),
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                child: const CircleAvatar(
                                                  backgroundColor: Colors.amber,
                                                  radius: 20,
                                                  foregroundImage: NetworkImage(
                                                      'https://withme.id/wp-content/uploads/2019/04/customer-service-adalah.jpg'),
                                                ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                height: 25,
                                                width: 80,
                                                color: AppColors.primaryBg,
                                                child: const Center(
                                                    child: Text(
                                                  '100%',
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primarytext,
                                                  ),
                                                )),
                                              )
                                            ],
                                          ),
                                          Spacer(),
                                          Spacer(),
                                          Container(
                                            height: 25,
                                            width: 80,
                                            color: AppColors.primaryBg,
                                            child: const Center(
                                                child: Text(
                                              '10 / 10 Task',
                                              style: TextStyle(
                                                color: AppColors.primarytext,
                                              ),
                                            )),
                                          ),
                                          const Text(
                                            'Pemrograman Mobile',
                                            style: TextStyle(
                                                color: AppColors.primarytext,
                                                fontSize: 20),
                                          ),
                                          const Text(
                                            'Deadline 2 hari lagi',
                                            style: TextStyle(
                                                color: AppColors.primarytext,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // UPCOMING
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SafeArea(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Upcoming Task',
                                              style: TextStyle(
                                                  color: AppColors.primarytext,
                                                  fontSize: 30),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            SizedBox(
                                              height: 200,
                                              child: ListView(
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                children: [
                                                  // CARD 1
                                                  Container(
                                                    height: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: AppColors.card,
                                                    ),
                                                    margin:
                                                        const EdgeInsets.all(
                                                            10),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                              child:
                                                                  const CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .amber,
                                                                radius: 20,
                                                                foregroundImage:
                                                                    NetworkImage(
                                                                        'https://withme.id/wp-content/uploads/2019/04/customer-service-adalah.jpg'),
                                                              ),
                                                            ),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                              child:
                                                                  const CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .amber,
                                                                radius: 20,
                                                                foregroundImage:
                                                                    NetworkImage(
                                                                        'https://withme.id/wp-content/uploads/2019/04/customer-service-adalah.jpg'),
                                                              ),
                                                            ),
                                                            const Spacer(),
                                                            Container(
                                                              height: 25,
                                                              width: 80,
                                                              color: AppColors
                                                                  .primaryBg,
                                                              child:
                                                                  const Center(
                                                                      child:
                                                                          Text(
                                                                '100%',
                                                                style:
                                                                    TextStyle(
                                                                  color: AppColors
                                                                      .primarytext,
                                                                ),
                                                              )),
                                                            )
                                                          ],
                                                        ),
                                                        Spacer(),
                                                        Spacer(),
                                                        Container(
                                                          height: 25,
                                                          width: 80,
                                                          color: AppColors
                                                              .primaryBg,
                                                          child: const Center(
                                                              child: Text(
                                                            '10 / 10 Task',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .primarytext,
                                                            ),
                                                          )),
                                                        ),
                                                        const Text(
                                                          'Pemrograman Mobile',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .primarytext,
                                                              fontSize: 20),
                                                        ),
                                                        const Text(
                                                          'Deadline 2 hari lagi',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .primarytext,
                                                              fontSize: 20),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'My Friends',
                                              style: TextStyle(
                                                  color: AppColors.primarytext,
                                                  fontSize: 30),
                                            ),
                                            const Text(
                                              'More',
                                              style: TextStyle(
                                                  color: AppColors.primarytext,
                                                  fontSize: 30),
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: AppColors.primarytext,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
