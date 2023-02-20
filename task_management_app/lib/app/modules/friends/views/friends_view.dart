import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:task_management_app/app/data/controller/auth_controller.dart';
import 'package:task_management_app/app/utills/widget/MyFriends.dart';
import 'package:task_management_app/app/utills/widget/PeopleYouMayKnow.dart';
import 'package:unicons/unicons.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utills/widget/header.dart';
import 'package:task_management_app/app/utills/widget/sidebar.dart';
import 'package:task_management_app/app/utills/widget/style/AppColors.dart';
import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
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
              child: Container(
                child: Column(
                  children: [
                    !context.isPhone
                        ? const header()
                        : Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      child: CircleAvatar(
                                        backgroundColor: Colors.amber,
                                        radius: 25,
                                        foregroundImage: NetworkImage(authCont
                                            .auth.currentUser!.photoURL!),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                context.isPhone
                                    ? TextField(
                                        onChanged: (value) =>
                                            authCont.searchFriends(value),
                                        controller:
                                            authCont.searchFriendsController,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 40, right: 10),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            prefixIcon: const Icon(
                                              Icons.search,
                                              color: Colors.black,
                                            ),
                                            hintText: 'Search'),
                                      )
                                    : const SizedBox()
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
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: !context.isPhone
                              ? BorderRadius.circular(50)
                              : BorderRadius.circular(30),
                        ),
                        child: Obx(
                          () => authCont.hasilCari.isEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'People You May Know',
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: AppColors.primarytext,
                                      ),
                                    ),
                                    PeopleYouMayKnow(),
                                    MyFriends(),
                                  ],
                                )
                              : ListView.builder(
                                  padding: EdgeInsets.all(8),
                                  itemCount: authCont.hasilCari.length,
                                  itemBuilder: (context, index) => ListTile(
                                    onTap: () => authCont.addFriends(
                                        authCont.hasilCari[index]['email']),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image(
                                        image: NetworkImage(
                                            authCont.hasilCari[index]['photo']),
                                        height: 200,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title:
                                        Text(authCont.hasilCari[index]['name']),
                                    subtitle: Text(
                                        authCont.hasilCari[index]['email']),
                                    trailing: Icon(Ionicons.add),
                                  ),
                                ),
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
