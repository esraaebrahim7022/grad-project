import 'dart:io';

import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class BrainTumerPage extends StatefulWidget {
  static String id = 'BrainTumerPage';

  const BrainTumerPage({super.key});

  @override
  State<BrainTumerPage> createState() => _BrainTumerPageState();
}

class _BrainTumerPageState extends State<BrainTumerPage> {
  File? imageFile;
  final imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                CacheHelper.clearData().then((value) {
                  Navigator.pushReplacementNamed(context, 'Welcome Page');
                });

                print(token);
                print(role);
                print('loggedout');
              },
              icon: const Icon(Icons.logout))
        ],
        backgroundColor: Colors.lightBlue,
        title: const Center(
          child: Text(
            'BrainTumer Detection',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  getFromCamera();
                },
                child: Lottie.asset('assets/Animation - 1707828745411.json',
                    width: 300, height: 300),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Click and Point Your Phone in MIR',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('OR Drop Files Here :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 30,
            ),
            customtext2(
                text: 'Choose File',
                context: context,
                onPressed: () {
                  getFromGallery();
                })
          ],
        ),
      ),
    );
  }

  // get from gallery
  getFromGallery() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  // get from camera
  getFromCamera() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
