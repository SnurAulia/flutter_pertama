// import 'dart:html';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utills/widget/header.dart';
import 'package:task_management_app/app/utills/widget/sidebar.dart';
import 'package:task_management_app/app/utills/widget/style/AppColors.dart';

import '../../../data/controller/auth_controller.dart';
import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
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
                        padding: const EdgeInsets.all(50),
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
                            const Text(
                              'My Task',
                              style: TextStyle(
                                color: AppColors.primarytext,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              //STREAM USER FOR TASK LIST
                              child: StreamBuilder<
                                      DocumentSnapshot<Map<String, dynamic>>>(
                                  stream: authCont.streamUsers(
                                      authCont.auth.currentUser!.email!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    //GET TASK ID
                                    var taskId = (snapshot.data!.data()
                                            as Map<String, dynamic>)['task_id']
                                        as List;
                                    return ListView.builder(
                                      clipBehavior: Clip.antiAlias,
                                      itemCount: taskId.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return StreamBuilder<
                                                DocumentSnapshot<
                                                    Map<String, dynamic>>>(
                                            stream: authCont
                                                .streamTask(taskId[index]),
                                            builder: (context, snapshot2) {
                                              if (snapshot2.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              }
                                              // DATA TASK
                                              var dataTask =
                                                  snapshot2.data!.data();

                                              // DATA USER PHOTO
                                              var dataUserList = (snapshot2
                                                          .data!
                                                          .data()
                                                      as Map<String, dynamic>)[
                                                  'asign_to'] as List;
                                              return GestureDetector(
                                                onLongPress: () {
                                                  Get.defaultDialog(
                                                      title:
                                                          dataTask!['tittle'],
                                                      content: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          TextButton.icon(
                                                            onPressed: () {
                                                              Get.back();
                                                              controller
                                                                      .tittleController
                                                                      .text =
                                                                  dataTask[
                                                                      'tittle'];
                                                              controller
                                                                      .descriptionController
                                                                      .text =
                                                                  dataTask[
                                                                      'description'];
                                                              controller
                                                                      .dueDateController
                                                                      .text =
                                                                  dataTask[
                                                                      'due_Date'];
                                                              addEditTask(
                                                                  context:
                                                                      context,
                                                                  type:
                                                                      'Update',
                                                                  docId: taskId[
                                                                      index]);
                                                            },
                                                            icon: const Icon(
                                                                Ionicons
                                                                    .pencil),
                                                            label: const Text(
                                                                'Update'),
                                                          ),
                                                          TextButton.icon(
                                                            onPressed: () {
                                                              controller
                                                                  .deleteTask(
                                                                      taskId[
                                                                          index]);
                                                            },
                                                            icon: const Icon(
                                                                Ionicons.trash),
                                                            label: const Text(
                                                                'Delete'),
                                                          ),
                                                        ],
                                                      ));
                                                  // addEditTask(
                                                  //     context: context,
                                                  //     type: 'Update',
                                                  //     docId:
                                                  //         '2022-12-24T19:11:11.131660');
                                                },
                                                child: Container(
                                                  // width: 400,
                                                  height: 200,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    color: AppColors.card,
                                                  ),
                                                  margin:
                                                      const EdgeInsets.all(10),
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 50,
                                                            child: Expanded(
                                                              child: ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                itemCount:
                                                                    dataUserList
                                                                        .length,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                shrinkWrap:
                                                                    true,
                                                                physics:
                                                                    const ScrollPhysics(),
                                                                itemBuilder:
                                                                    (context,
                                                                        index2) {
                                                                  return StreamBuilder<
                                                                          DocumentSnapshot<
                                                                              Map<String,
                                                                                  dynamic>>>(
                                                                      stream: authCont.streamUsers(
                                                                          dataUserList[
                                                                              index2]),
                                                                      builder:
                                                                          (context,
                                                                              snapshot3) {
                                                                        if (snapshot3.connectionState ==
                                                                            ConnectionState.waiting) {
                                                                          return const Center(
                                                                              child: CircularProgressIndicator());
                                                                        }

                                                                        // DATA USER PHOTO
                                                                        var dataUserImage = snapshot3
                                                                            .data!
                                                                            .data();

                                                                        return ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                          child:
                                                                              CircleAvatar(
                                                                            backgroundColor:
                                                                                Colors.amber,
                                                                            radius:
                                                                                20,
                                                                            foregroundImage:
                                                                                NetworkImage(dataUserImage!['photo']),
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
                                                            color: AppColors
                                                                .primaryBg,
                                                            child: Center(
                                                                child: Text(
                                                              '${dataTask!['status']}%',
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .primarytext,
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
                                                        color:
                                                            AppColors.primaryBg,
                                                        child: Center(
                                                            child: Text(
                                                          '${dataTask['total_task_finished']}/${dataTask['total_task']} Task',
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .primarytext,
                                                          ),
                                                        )),
                                                      ),
                                                      Text(
                                                        dataTask!['tittle'],
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .primarytext,
                                                            fontSize: 20),
                                                      ),
                                                      Text(
                                                        dataTask['description'],
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .primarytext,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: const Alignment(0.95, 0.95),
        child: FloatingActionButton.extended(
          onPressed: () {
            addEditTask(context: context, type: 'Add', docId: '');
          },
          label: const Text('Add Task'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }

  addEditTask({BuildContext? context, String? type, String? docId}) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          margin: context!.isPhone
              ? EdgeInsets.zero
              : const EdgeInsets.only(left: 150, right: 150),
          // height: Get.height,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              color: Colors.white),
          child: Form(
              key: controller.formKey,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Text(
                    '$type Task',
                    style: const TextStyle(
                        color: AppColors.primarytext,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.tittleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: 'Description',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                    controller: controller.descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DateTimePicker(
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    dateLabelText: 'Due Date',
                    decoration: InputDecoration(
                        hintText: 'Due Date',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                    controller: controller.dueDateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: Get.width, height: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.saveUpdateTask(
                          type: type,
                          tittle: controller.tittleController.text,
                          description: controller.descriptionController.text,
                          dueDate: controller.dueDateController.text,
                          docId: docId,

                          // controller.tittleController.text,
                          // controller.descriptionController.text,
                          // controller.dueDateController.text,
                          // docId!,
                          // type!,
                        );
                      },
                      child: Text(type!),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
