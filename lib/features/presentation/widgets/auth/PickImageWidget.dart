import 'dart:io'; // ضروري عشان File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  final XFile? imageFile; // المتغير الذي يحمل الصورة
  final Function(XFile) onImagePicked; // الدالة

  const PickImageWidget({
    super.key,
    required this.onImagePicked,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 65,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: imageFile == null
                ? const AssetImage("assets/avatar.png") as ImageProvider
                : FileImage(File(imageFile!.path)),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: GestureDetector(
              onTap: () async {
                final pickedFile = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (pickedFile != null) {
                  onImagePicked(pickedFile);
                }
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.camera_alt_sharp,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
