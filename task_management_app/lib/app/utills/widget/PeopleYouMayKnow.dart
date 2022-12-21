import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/auth_controller.dart';

class PeopleYouMayKnow extends StatelessWidget {
  final authCont = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: FutureBuilder(
        future: authCont.getPeople(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var data = snapshot.data!.docs;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            clipBehavior: Clip.antiAlias,
            itemCount: data.length,
            itemBuilder: (context, index) {
              var hasil = data[index].data();
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image(
                        image: NetworkImage(hasil['photo']),
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 30,
                      child: Text(
                        hasil['name'],
                        style: const TextStyle(
                            color: Color.fromARGB(255, 252, 252, 252)),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: SizedBox(
                          height: 35,
                          width: 35,
                          child: ElevatedButton(
                              onPressed: () =>
                                  authCont.addFriends(hasil['email']),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Icon(Icons.add_circle_outline)),
                        ))
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
