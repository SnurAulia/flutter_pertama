import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/app/data/controller/auth_controller.dart';
import 'package:task_management_app/app/routes/app_pages.dart';
import 'package:task_management_app/app/utills/widget/style/AppColors.dart';

class MyFriends extends StatelessWidget {
  final authCont = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'My Friends',
                  style: TextStyle(color: AppColors.primarytext, fontSize: 30),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.FRIENDS),
                  child: const Text(
                    'More',
                    style:
                        TextStyle(color: AppColors.primarytext, fontSize: 20),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primarytext,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              // height: 400,
              child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: authCont.streamFriends(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  var myFriends = (snapshot.data!.data()
                      as Map<String, dynamic>)['emailFriends'] as List;
                  return GridView.builder(
                      shrinkWrap: true,
                      itemCount: myFriends.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: context.isPhone ? 2 : 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        return StreamBuilder<
                                DocumentSnapshot<Map<String, dynamic>>>(
                            stream: authCont.streamUsers(myFriends[index]),
                            builder: (context, snapshot2) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              var data = snapshot2.data!.data();
                              return Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image(
                                      image: NetworkImage(data!['photo']),
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(data['name'],
                                      style: const TextStyle(
                                        color: AppColors.primarytext,
                                      ))
                                ],
                              );
                            });
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
