import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../Controller/GalleryController.dart';
import '../Model/ImageModel.dart';

class GalleryPage extends StatelessWidget {
  final void Function(ImageModel) onImageSelected;

  const GalleryPage({
    Key? key,
    required this.onImageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GalleryController controller = Get.put(GalleryController());

    return Scaffold(
      appBar: AppBar(title: const Text('Image Gallery')),
      body: Obx(() {
        // Check if loading
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Check if the images list is null or empty
        if (controller.images.isEmpty) {
          return const Center(
            child: Text('No images found'),
          );
        }

        // Safely build the grid
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: MasonryGridView.count(
            crossAxisCount: _getCrossAxisCount(context),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: controller.images.length,
            itemBuilder: (context, index) {
              final image = controller.images[index];
              // Ensure image is not null
              if (image == null) {
                return const SizedBox(); // Return an empty box for null entries
              }
              return GestureDetector(
                onTap: () => onImageSelected(image),
                child: _buildImageCard(image),
              );
            },
          ),
        );
      }),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return 6;
    } else if (screenWidth > 800) {
      return 4;
    } else if (screenWidth > 600) {
      return 3;
    } else {
      return 2;
    }
  }

  Widget _buildImageCard(ImageModel image) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(image.imageUrl, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Likes: ${image.likes}'),
                Text('Views: ${image.views}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
