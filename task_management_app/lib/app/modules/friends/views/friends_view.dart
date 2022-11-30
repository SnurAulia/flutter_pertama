import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:task_management_app/app/utills/widget/MyFriends.dart';
import 'package:unicons/unicons.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utills/widget/header.dart';
import 'package:task_management_app/app/utills/widget/sidebar.dart';
import 'package:task_management_app/app/utills/widget/style/AppColors.dart';
import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
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
                                  width: 15,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
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
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: !context.isPhone
                              ? BorderRadius.circular(50)
                              : BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'People You May Know',
                              style: TextStyle(
                                fontSize: 30,
                                color: AppColors.primarytext,
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                clipBehavior: Clip.antiAlias,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: const Image(
                                            image: NetworkImage(
                                                'https://th.bing.com/th/id/R.4423b396783ee5e3c974c3f42d31a5d2?rik=B2TGBxm6KvE62Q&riu=http%3a%2f%2fi1.hdslb.com%2fbfs%2farchive%2f74188e89512904b3c99db99b5cd7eb4ed6876e80.jpg&ehk=w8PLQ5hrZzAC2zHbr2kFvq7R7YsE5GWxGBw6tP9KFis%3d&risl=&pid=ImgRaw&r=0'),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          left: 30,
                                          child: Text(
                                            'Alicia Jasmine',
                                            style: TextStyle(
                                                color: Color(0xFF000000)),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: SizedBox(
                                              height: 35,
                                              width: 35,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style: ElevatedButton.styleFrom(
                                                      padding: EdgeInsets.zero,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30))),
                                                  child: Icon(Icons
                                                      .add_circle_outline)),
                                            ))
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            MyFriends(),
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
