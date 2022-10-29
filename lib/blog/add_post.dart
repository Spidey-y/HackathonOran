import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/Theme/buttons.dart';
import 'package:hackathon/models/models.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../notif/notifications.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late AppUser user = AppUser(
      score: 0,
      phoneNumber: "",
      id: "",
      firstName: "",
      familyName: "",
      email: "",
      address: "");
  void getUser() async {
    await FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((val) {
      for (var v in val.docs) {
        setState(() {
          user = AppUser(
              score: v["score"],
              phoneNumber: v["phoneNumber"],
              id: v["id"],
              firstName: v["firstName"],
              familyName: v["familyName"],
              email: v["email"],
              address: v["address"]);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  XFile? logo;
  final ImagePicker picker = ImagePicker();
  bool isLoading = false;
  TextEditingController cntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: Color.fromARGB(255, 3, 21, 33),
            ),
          ),
          backgroundColor: const Color(0xfff2f2f2),
          elevation: 0,
          shadowColor: null,
          centerTitle: true,
          // ignore: prefer_const_constructors
          title: AutoSizeText(
            "ADD POST",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromARGB(255, 3, 21, 33),
                fontWeight: FontWeight.bold),
          ),
          actions: [
            InkWell(
              onTap: () {
                pushNewScreen(context,
                    screen: const NotificationPage(), withNavBar: false);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Icon(
                  CupertinoIcons.bell,
                  size: 30,
                  color: Color.fromARGB(255, 3, 21, 33),
                ),
              ),
            )
          ],
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.4,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: logo == null
                                        ? Colors.grey.shade300
                                        : Colors.grey.shade100,
                                    border: logo == null
                                        ? null
                                        : Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 5),
                                    image: logo == null
                                        ? null
                                        : DecorationImage(
                                            image: FileImage(File(logo!.path)),
                                            fit: BoxFit.cover)),
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.4,
                                child: Center(
                                  child: AutoSizeText(
                                    logo != null ? "" : "Picture",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: InkWell(
                                  onTap: () async {
                                    logo = await picker.pickImage(
                                        source: ImageSource.camera,
                                        imageQuality: 50);
                                    if (logo != null) {}
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: TextFormField(
                            maxLength: 250,
                            minLines: 2,
                            keyboardType: TextInputType.multiline,
                            obscureText: false,
                            decoration: InputDecoration(
                                helperMaxLines: 2,
                                labelText: "Description",
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: const Icon(Icons.edit),
                                hintText: "Description"),
                            controller: cntrl,
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Button(
                            color: Theme.of(context).primaryColor,
                            text: "Publish",
                            textColor: Colors.white,
                            x: () async {
                              if (cntrl.text.isNotEmpty && logo != null) {
                                setState(() {
                                  isLoading = true;
                                });
                                var x = await FirebaseFirestore.instance
                                    .collection("Posts")
                                    .add({
                                  "id": "",
                                  "userId":
                                      FirebaseAuth.instance.currentUser!.uid,
                                  "userName": user.familyName + user.firstName,
                                  "date": DateTime.now(),
                                  "image": "",
                                  "upvote": 0,
                                  "downvote": 0,
                                });
                                final storageRef = FirebaseStorage.instance
                                    .ref("Posts/${x.id}");
                                await storageRef.putFile(File(logo!.path));
                                var t = await storageRef.getDownloadURL();
                                await FirebaseFirestore.instance
                                    .collection("Posts")
                                    .doc(x.id)
                                    .update({"id": x.id, "image": t});
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            }),
                      ],
                    ),
                  )
                ],
              ));
  }
}
