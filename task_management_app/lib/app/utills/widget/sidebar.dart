import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/routes/app_pages.dart';
import 'package:task_management_app/app/utills/widget/style/AppColors.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 0,
        child: Container(
          height: Get.height,
          color: AppColors.primaryBg,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //LOGO
                Container(
                  height: 100,
                  padding: const EdgeInsets.only(top: 30),
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  child:
                      const Image(image: AssetImage('assets/icons/icon.png')),
                ),
                const SizedBox(
                  height: 50,
                ),

                // HOME
                SizedBox(
                  height: 100,
                  child: Center(
                    child: InkWell(
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            width: 100,
                            decoration: Get.currentRoute == '/home'
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.white)
                                : BoxDecoration(),
                            child: Icon(
                              Get.currentRoute == '/home'
                                  ? Icons.desktop_mac
                                  : Icons.desktop_mac_outlined,
                              color: AppColors.primarytext,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Home',
                            style: TextStyle(
                                color: AppColors.primarytext, fontSize: 16),
                          )
                        ],
                      ),
                      onTap: () => Get.toNamed(Routes.HOME),
                    ),
                  ),
                ),
                // TASK
                SizedBox(
                  height: 100,
                  child: Center(
                    child: InkWell(
                      child: Column(children: [
                        Container(
                          height: 40,
                          width: 100,
                          decoration: Get.currentRoute == '/task'
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white)
                              : BoxDecoration(),
                          child: Icon(
                            Get.currentRoute == '/task'
                                ? Icons.app_registration
                                : Icons.app_registration_outlined,
                            color: AppColors.primarytext,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Task',
                          style: TextStyle(
                              color: AppColors.primarytext, fontSize: 16),
                        )
                      ]),
                      onTap: () => Get.toNamed(Routes.TASK),
                    ),
                  ),
                ),
                // FRIENDS
                SizedBox(
                  height: 100,
                  child: Center(
                    child: InkWell(
                      child: Column(children: [
                        Container(
                          height: 40,
                          width: 100,
                          decoration: Get.currentRoute == '/friends'
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white)
                              : BoxDecoration(),
                          child: Icon(
                            Get.currentRoute == '/friends'
                                ? Icons.favorite
                                : Icons.favorite_outlined,
                            color: AppColors.primarytext,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Friends',
                          style: TextStyle(
                              color: AppColors.primarytext, fontSize: 16),
                        )
                      ]),
                      onTap: () => Get.toNamed(Routes.FRIENDS),
                    ),
                  ),
                ),
                // PROFILE
                SizedBox(
                  height: 100,
                  child: Center(
                    child: InkWell(
                      child: Column(children: [
                        Container(
                          height: 40,
                          width: 100,
                          decoration: Get.currentRoute == '/profile'
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white)
                              : BoxDecoration(),
                          child: Icon(
                            Get.currentRoute == '/profile'
                                ? Icons.person
                                : Icons.person_outline,
                            color: AppColors.primarytext,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Profile',
                          style: TextStyle(
                              color: AppColors.primarytext, fontSize: 16),
                        )
                      ]),
                      onTap: () => Get.toNamed(Routes.PROFILE),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
