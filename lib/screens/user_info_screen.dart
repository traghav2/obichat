import 'dart:io';

import 'package:obichat/models/user_model.dart';
import 'package:obichat/screens/home_screen.dart';
// import 'package:obichat/utils/image_util.dart';
import 'package:obichat/utils/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  File? image;
  final nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Circular avatar to pick a profile picture
                        GestureDetector(
                          onTap: () {},
                          child: image == null
                              ? const CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 60,
                                  child: Icon(
                                    CupertinoIcons.plus,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundImage: FileImage(image!),
                                  radius: 60,
                                ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        // Text field for name
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            cursorColor: Colors.green,
                            cursorHeight: 20,
                            cursorWidth: 1.3,
                            controller: nameController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent.shade200)),
                                hintText: "Your Name",
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10)),
                          ),
                        ),

                        SizedBox(
                          height: 50,
                          width: 110,
                          child: Material(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(40),
                            child: InkWell(
                                borderRadius: BorderRadius.circular(40),
                                onTap: () {},
                                splashColor: Colors.green.shade400,
                                child: const Center(
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
