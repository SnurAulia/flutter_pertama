import 'package:flutter/material.dart';

import 'style/AppColors.dart';

class UpcomingTask extends StatelessWidget {
  const UpcomingTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Upcoming Task',
              style: TextStyle(color: AppColors.primarytext, fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 400,
              child: ListView(
                clipBehavior: Clip.antiAlias,
                // scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  // CARD 1
                  Container(
                    // width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.card,
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 20,
                                foregroundImage: NetworkImage(
                                    'https://th.bing.com/th/id/R.4423b396783ee5e3c974c3f42d31a5d2?rik=B2TGBxm6KvE62Q&riu=http%3a%2f%2fi1.hdslb.com%2fbfs%2farchive%2f74188e89512904b3c99db99b5cd7eb4ed6876e80.jpg&ehk=w8PLQ5hrZzAC2zHbr2kFvq7R7YsE5GWxGBw6tP9KFis%3d&risl=&pid=ImgRaw&r=0'),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 20,
                                foregroundImage: NetworkImage(
                                    'https://th.bing.com/th/id/R.4423b396783ee5e3c974c3f42d31a5d2?rik=B2TGBxm6KvE62Q&riu=http%3a%2f%2fi1.hdslb.com%2fbfs%2farchive%2f74188e89512904b3c99db99b5cd7eb4ed6876e80.jpg&ehk=w8PLQ5hrZzAC2zHbr2kFvq7R7YsE5GWxGBw6tP9KFis%3d&risl=&pid=ImgRaw&r=0'),
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
                                  color: AppColors.primarytext,
                                ),
                              )),
                            ),
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
                              color: AppColors.primarytext, fontSize: 20),
                        ),
                        const Text(
                          'Deadline 2 hari lagi',
                          style: TextStyle(
                              color: AppColors.primarytext, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  // CARD 2
                  Container(
                    // width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.card,
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 20,
                                foregroundImage: NetworkImage(
                                    'https://th.bing.com/th/id/R.4423b396783ee5e3c974c3f42d31a5d2?rik=B2TGBxm6KvE62Q&riu=http%3a%2f%2fi1.hdslb.com%2fbfs%2farchive%2f74188e89512904b3c99db99b5cd7eb4ed6876e80.jpg&ehk=w8PLQ5hrZzAC2zHbr2kFvq7R7YsE5GWxGBw6tP9KFis%3d&risl=&pid=ImgRaw&r=0'),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 20,
                                foregroundImage: NetworkImage(
                                    'https://th.bing.com/th/id/R.4423b396783ee5e3c974c3f42d31a5d2?rik=B2TGBxm6KvE62Q&riu=http%3a%2f%2fi1.hdslb.com%2fbfs%2farchive%2f74188e89512904b3c99db99b5cd7eb4ed6876e80.jpg&ehk=w8PLQ5hrZzAC2zHbr2kFvq7R7YsE5GWxGBw6tP9KFis%3d&risl=&pid=ImgRaw&r=0'),
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
                                  color: AppColors.primarytext,
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
                              color: AppColors.primarytext, fontSize: 20),
                        ),
                        const Text(
                          'Deadline 2 hari lagi',
                          style: TextStyle(
                              color: AppColors.primarytext, fontSize: 20),
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
    );
  }
}
