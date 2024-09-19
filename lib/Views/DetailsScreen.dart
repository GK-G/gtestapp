import 'package:flutter/material.dart';
import '../Model/ImageModel.dart';

class DetailScreen extends StatelessWidget {
  final ImageModel image;

  const DetailScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Details'),
      ),
      body: Column(
        children: [
          Image.network(image.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Likes: ${image.likes}', style: const TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Views: ${image.views}', style: const TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
