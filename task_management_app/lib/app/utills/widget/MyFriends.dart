import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/app/routes/app_pages.dart';
import 'package:task_management_app/app/utills/widget/style/AppColors.dart';

class MyFriends extends StatelessWidget {
  const MyFriends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'My Friends',
                    style:
                        TextStyle(color: AppColors.primarytext, fontSize: 30),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.FRIENDS),
                    child: Text(
                      'More',
                      style:
                          TextStyle(color: AppColors.primarytext, fontSize: 20),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primarytext,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: context.isPhone ? 2 : 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: const Image(
                              image: NetworkImage(
                                  'https://th.bing.com/th/id/R.4423b396783ee5e3c974c3f42d31a5d2?rik=B2TGBxm6KvE62Q&riu=http%3a%2f%2fi1.hdslb.com%2fbfs%2farchive%2f74188e89512904b3c99db99b5cd7eb4ed6876e80.jpg&ehk=w8PLQ5hrZzAC2zHbr2kFvq7R7YsE5GWxGBw6tP9KFis%3d&risl=&pid=ImgRaw&r=0'),
                            ),
                          ),
                          const Text('Alicia Jasmine',
                              style: TextStyle(
                                color: AppColors.primarytext,
                              ))
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
