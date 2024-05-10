import 'package:flutter/material.dart';
import 'package:fasum/screens/camera_image_button.dart';
class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  void _handleImageCaptured(String imagePath) {
    // Lakukan apa pun yang Anda butuhkan dengan gambar yang telah diambil, misalnya menyimpannya atau menampilkannya
    print('Image captured at: $imagePath');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CameraImageButton(onImageCaptured: _handleImageCaptured),
            TextField(
              decoration: InputDecoration(
                hintText: 'Tulis sesuatu...',
                contentPadding: EdgeInsets.all(20),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk menyimpan post ke Firebase di sini
                Navigator.pop(context);
              },
              child: Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}