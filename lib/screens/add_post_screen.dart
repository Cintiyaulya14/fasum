import 'package:flutter/material.dart';
import 'package:fasum/screens/camera_image_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const LocationWidget(),
    );
  }
}

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  String _locationMessage = "";
  Position? _currentPosition;

  void _getCurrentLocation() async {
    final status = await Permission.location.status;
    if (!status.isGranted) {
      final result = await Permission.location.request();
      if (result != PermissionStatus.granted) {
        return;
      }
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
      _locationMessage = 'Latitude: ${position.latitude},Longitude: ${position.longitude}';
    });
  }

  Future<void> _showOnMap() async {
    if (_currentPosition != null) {
      Uri googleMapsUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${_currentPosition!.latitude},'
        '${_currentPosition!.longitude}');
      try {
        await launchUrl (googleMapsUrl);
      }catch (e){
        throw 'Could not launch $googleMapsUrl';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_locationMessage),
          const SizedBox(height: 10,),
          if(_currentPosition != null)
            ElevatedButton(onPressed: _showOnMap, child: const Text('Show On Map'),
            ),
        ],
      ),
    );
  }
}