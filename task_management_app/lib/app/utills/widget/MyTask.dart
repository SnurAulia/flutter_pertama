import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/data/controller/auth_controller.dart';
import 'package:task_management_app/app/utills/widget/prosesTask.dart';
import 'package:task_management_app/app/utills/widget/style/AppColors.dart';

class MyTask extends StatelessWidget {
  final authCont = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //STREAM USER FOR TASK LIST
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Task',
            style: TextStyle(
              color: AppColors.primarytext,
              fontSize: 30,
            ),
          ),
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: authCont.streamUsers(authCont.auth.currentUser!.email!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                //GET TASK ID
                var taskId = (snapshot.data!.data()
                    as Map<String, dynamic>)['task_id'] as List;
                return ListView.builder(
                  clipBehavior: Clip.antiAlias,
                  itemCount: taskId.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return StreamBuilder<
                            DocumentSnapshot<Map<String, dynamic>>>(
                        stream: authCont.streamTask(taskId[index]),
                        builder: (context, snapshot2) {
                          if (snapshot2.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          // DATA TASK
                          var dataTask = snapshot2.data!.data();

                          // DATA USER PHOTO
                          var dataUserList = (snapshot2.data!.data()
                              as Map<String, dynamic>)['asign_to'] as List;
                          return GestureDetector(
                            onLongPress: () {
                              Get.defaultDialog(
                                  title: dataTask!['tittle'],
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton.icon(
                                        onPressed: () {
                                          Get.back();
                                          authCont.tittleController.text =
                                              dataTask['tittle'];
                                          authCont.descriptionController.text =
                                              dataTask['description'];
                                          authCont.dueDateController.text =
                                              dataTask['due_Date'];
                                          addEditTask(
                                              context: context,
                                              type: 'Update',
                                              docId: taskId[index]);
                                        },
                                        icon: const Icon(Ionicons.pencil),
                                        label: const Text('Update'),
                                      ),
                                      TextButton.icon(
                                        onPressed: () {
                                          authCont.deleteTask(taskId[index]);
                                        },
                                        icon: const Icon(Ionicons.trash),
                                        label: const Text('Delete'),
                                      ),
                                    ],
                                  ));
                            },
                            child: Container(
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
                                      SizedBox(
                                        height: 30,
                                        child: Expanded(
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            itemCount: dataUserList.length,
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            physics: const ScrollPhysics(),
                                            itemBuilder: (context, index2) {
                                              return StreamBuilder<
                                                      DocumentSnapshot<
                                                          Map<String,
                                                              dynamic>>>(
                                                  stream: authCont.streamUsers(
                                                      dataUserList[index2]),
                                                  builder:
                                                      (context, snapshot3) {
                                                    if (snapshot3
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return const Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }

                                                    // DATA USER PHOTO
                                                    var dataUserImage =
                                                        snapshot3.data!.data();

                                                    return ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.amber,
                                                        radius: 20,
                                                        foregroundImage:
                                                            NetworkImage(
                                                                dataUserImage![
                                                                    'photo']),
                                                      ),
                                                    );
                                                  });
                                            },
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 25,
                                        width: 80,
                                        color: AppColors.primaryBg,
                                        child: Center(
                                            child: Text(
                                          '${dataTask!['status']}%',
                                          style: const TextStyle(
                                            color: AppColors.primarytext,
                                          ),
                                        )),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Spacer(),
                                  Container(
                                    height: 25,
                                    width: 80,
                                    color: AppColors.primaryBg,
                                    child: Center(
                                        child: Text(
                                      '${dataTask['total_task_finished']}/${dataTask['total_task']} Task',
                                      style: const TextStyle(
                                        color: AppColors.primarytext,
                                      ),
                                    )),
                                  ),
                                  Text(
                                    dataTask!['tittle'],
                                    style: const TextStyle(
                                        color: AppColors.primarytext,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    dataTask['description'],
                                    style: const TextStyle(
                                        color: AppColors.primarytext,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                );
              }),
        ],
      ),
    );
  }
}
