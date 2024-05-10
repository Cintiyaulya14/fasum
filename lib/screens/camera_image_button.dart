import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraImageButton extends StatelessWidget {
  const CameraImageButton({Key? key, required this.onImageCaptured})
      : super(key: key);

  final void Function(String imagePath) onImageCaptured;

  Future<void> _openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);

    if (pickedImage != null) {
      onImageCaptured(pickedImage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _openCamera(context);
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.camera_alt,
          size: 50,
          color: Colors.grey,
        ),
      ),
    );
  }
}