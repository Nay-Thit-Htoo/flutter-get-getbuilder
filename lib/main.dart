import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getbuilder_testing/controller/usercontroller.dart';
import 'package:flutter_getbuilder_testing/view/deleteUserList.dart';
import 'package:flutter_getbuilder_testing/view/updateUserList.dart';
import 'package:flutter_getbuilder_testing/view/userList.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
            title: const Text("Get Example With GetBuilder",
                style: TextStyle(fontSize: 18)),
            actions: [
              Row(
                children: [
                  GetBuilder<UserController>(
                    builder: (controller) => Badge(
                      position: BadgePosition.topEnd(top: 0, end: 3),
                      animationDuration: const Duration(milliseconds: 300),
                      animationType: BadgeAnimationType.slide,
                      badgeContent: Text(
                        controller.updatedUserCount.toString(),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      child: IconButton(
                          icon: const Icon(Icons.edit_notifications),
                          onPressed: () {
                            Get.to(UpdateUser());
                          }),
                    ),
                  ),
                  GetBuilder<UserController>(
                    builder: (controller) => Badge(
                      position: BadgePosition.topEnd(top: 0, end: 3),
                      animationDuration: const Duration(milliseconds: 300),
                      animationType: BadgeAnimationType.slide,
                      badgeContent: Text(
                        controller.deletedUserCount.toString(),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      child: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () {
                            Get.to(DeleteUser());
                          }),
                    ),
                  ),
                ],
              ),
            ]),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [userList()],
        ),
      ),
    );
  }
}
