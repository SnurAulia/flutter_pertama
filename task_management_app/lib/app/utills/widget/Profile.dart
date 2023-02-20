import 'package:flutter/material.dart';
import 'package:task_management_app/app/utills/widget/style/AppColors.dart';
import 'package:get/get.dart';

import '../../data/controller/auth_controller.dart';

class Profile extends StatelessWidget {
  final authConn = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: !context.isPhone
          ? Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 150,
                      foregroundImage:
                          NetworkImage(authConn.auth.currentUser!.photoURL!),
                    ),
                  ),
                ),

                // const SizedBox(
                //   height: 20,
                // ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authConn.auth.currentUser!.displayName!,
                        style: TextStyle(
                          color: AppColors.primarytext,
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        authConn.auth.currentUser!.email!,
                        style: TextStyle(
                          color: AppColors.primarytext,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 150,
                      foregroundImage:
                          NetworkImage(authConn.auth.currentUser!.photoURL!),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    authConn.auth.currentUser!.displayName!,
                    style: const TextStyle(
                      color: AppColors.primarytext,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    authConn.auth.currentUser!.email!,
                    style: const TextStyle(
                      color: AppColors.primarytext,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
