// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:wassit_client/Theme/alerts.dart';

// ignore: must_be_immutable
class InputField extends StatefulWidget {
  InputField(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.hint,
      required this.keyboard,
      required this.isPass,
      this.extra = ""})
      : super(key: key);

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType keyboard;
  final bool isPass;
  String extra;
  @override
  // ignore: no_logic_in_create_state
  State<InputField> createState() => _InputFieldState(showPass: isPass);
}

class _InputFieldState extends State<InputField> {
  _InputFieldState({required this.showPass});
  bool showPass;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 20),
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        // maxLength: 30,
        keyboardType: widget.keyboard,
        obscureText: showPass,

        decoration: InputDecoration(
            helperText: widget.extra.isEmpty ? null : widget.extra,
            helperMaxLines: 2,
            labelText: widget.hint,
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.isPass
                ? InkWell(
                    child: showPass
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onTap: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                  )
                : widget.hint.contains("Address")
                    ? IconButton(
                        onPressed: () async {
                          // snack(context, "Obtention de la position actuelle");
                          // _determinePosition();
                          // Position position =
                          //     await Geolocator.getCurrentPosition(
                          //         desiredAccuracy: LocationAccuracy.high);
                          // List<Placemark> placemarks =
                          //     await placemarkFromCoordinates(
                          //         position.latitude, position.longitude);
                          // widget.controller.text =
                          //     // ignore: prefer_interpolation_to_compose_strings
                          //     placemarks[0].administrativeArea! +
                          //         ", " +
                          //         placemarks[0].subAdministrativeArea! +
                          //         ", " +
                          //         placemarks[0].street!;
                        },
                        icon: Icon(Icons.my_location_sharp))
                    : null,
            hintText: widget.hint),
        controller: widget.controller,
        maxLines: 1,
        validator: (value) {
          if (widget.hint.contains("Ajoute") ||
              widget.hint.contains("Maladie")) {
            return null;
          }
          if (value == null || value.isEmpty) {
            return 'Please fill in all the fields';
          }
          value = value.toString().trim();
          if (value.length >= 60) {
            return 'max length is 60';
          }
          if (widget.hint.toLowerCase().contains("phone")) {
            final exp = RegExp(
                r"^\s*(?:\+?(\d{0,3}))?[-. (]*(\d{1})[-. )]*(\d{2})[-. ]*(\d{2})[-. ]*(\d{2})[-. ]*(\d{2})\s*$");
            if (!exp.hasMatch(value)) {
              //replaceAll(RegExp(r'\D'), "")
              return "Please enter a valid phone number";
            }
          }
          if (widget.hint.toLowerCase().contains("mail")) {
            final exp = RegExp(r"^[a-zA-Z0-9.\-_]+@([\w-]+\.)+[\w-]{2,5}$");
            if (!exp.hasMatch(value)) {
              return "Please enter a valid email";
            }
          } else if (widget.hint.toLowerCase().contains("pass")) {
            if (value.length < 8) {
              return "Password too short";
            }
          }
          return null;
        },
      ),
    );
  }
}

// Future<Position> _determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }

//   return await Geolocator.getCurrentPosition();
// }
