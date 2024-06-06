import 'package:fasum/screens/add_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fasum/screens/sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String username;
  final String time;
  final String description;
  final String imageUrl;

  Post({required this.username, required this.time, required this.description, required this.imageUrl});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SignInScreen()));
  }

  void _onKomenPressed() {
    print('Komen button pressed');
  }

  void _onLikePressed() {
    print('Like button pressed');
  }

  @override
  Widget build(BuildContext context) {
    final List<Post> posts = [
      Post(
        username: 'calfy',
        time: '5 menit lalu',
        description: 'Mickey mouse',
        imageUrl: 'https://3.bp.blogspot.com/-TfU796NTOhM/WIGCbYkq10I/AAAAAAAACC8/zi7ufs8Y7o0BZtco7rFAHg-VQb-FDOK9wCEw/s1600/VEKTOR+MICKEY+MOUSE.png',
      ),
      Post(
        username: 'Famskuy',
        time: '1 jam lalu',
        description: 'Tupaii berbicara',
        imageUrl: 'https://cdn.kibrispdr.org/data/396/gambar-kartun-png-hd-14.png',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              signOut(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    posts[index].username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 18.0,),
                  Text(
                    posts[index].time,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Image.network(
                    posts[index].imageUrl,
                    width: 300,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    posts[index].description,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: _onKomenPressed,
                    child: Icon(
                      Icons.comment,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _onLikePressed,
                    child: Icon(
                      Icons.thumb_up,
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPostScreen()),
          );
        },
        child: Center(
          child: Icon(
            Icons.add,
            size: 50,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}