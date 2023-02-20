import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/app/utills/widget/MyTask.dart';
import 'package:task_management_app/app/utills/widget/style/AppColors.dart';

import '../../data/controller/auth_controller.dart';

addEditTask({BuildContext? context, String? type, String? docId}) {
  final authCont = Get.find<AuthController>();
  var controller;
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
            key: authCont.formKey,
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
                  controller: authCont.tittleController,
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
                  controller: authCont.descriptionController,
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
                  controller: authCont.dueDateController,
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
                      authCont.saveUpdateTask(
                        type: type,
                        tittle: authCont.tittleController.text,
                        description: authCont.descriptionController.text,
                        dueDate: authCont.dueDateController.text,
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
                SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
    ),
  );
}
