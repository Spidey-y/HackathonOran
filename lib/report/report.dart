import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hackathon/Theme/buttons.dart';
import 'package:hackathon/Theme/headers.dart';
import 'package:image_picker/image_picker.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  bool isLoading = false;
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      key: _scaffoldKey,
      drawer: const drwr(),
      appBar: nav(context, "REPORT", _scaffoldKey),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SvgPicture.asset(
                    "assets/icons/report_svg.svg",
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Button(
                            color: const Color(0xff2E6503),
                            text: "TAKE A PICTURE",
                            textColor: Colors.white,
                            x: () async {
                              photo = await picker.pickImage(
                                  source: ImageSource.camera, imageQuality: 50);
                              if (photo == null) return;
                              setState(() {
                                isLoading = true;
                              });
                              await _determinePosition();
                              Position position =
                                  await Geolocator.getCurrentPosition(
                                      desiredAccuracy: LocationAccuracy.high);
                              List<Placemark> placemarks =
                                  await placemarkFromCoordinates(
                                      position.latitude, position.longitude);
                              // ignore: prefer_interpolation_to_compose_strings
                              var s = placemarks[0].administrativeArea! +
                                  ", " +
                                  placemarks[0].subAdministrativeArea! +
                                  ", " +
                                  placemarks[0].street!;
                              var x = await FirebaseFirestore.instance
                                  .collection("Reports")
                                  .add({
                                "id": "",
                                "userId":
                                    FirebaseAuth.instance.currentUser!.uid,
                                "location": s,
                                "image": ""
                              });
                              final storageRef = FirebaseStorage.instance
                                  .ref("Reports/${x.id}");
                              await storageRef.putFile(File(photo!.path));
                              var t = await storageRef.getDownloadURL();
                              await FirebaseFirestore.instance
                                  .collection("Reports")
                                  .doc(x.id)
                                  .update({"id": x.id, "image": t});
                              setState(() {
                                isLoading = false;
                              });
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

// ignore: camel_case_types
class drwr extends StatelessWidget {
  const drwr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text("Logout"))
        ],
      ),
    );
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}
