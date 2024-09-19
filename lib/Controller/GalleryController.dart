import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Model/ImageModel.dart';

class GalleryController extends GetxController {
  var images = <ImageModel>[].obs;
  var isLoading = true.obs;

  // Pixabay API Key
  final String pixabayApiKey = '46076085-e0e106a0fd35fd784e210a47c';

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  /// Fetches images from the Pixabay API
  Future<void> fetchImages() async {
    isLoading(true);  // Set loading to true at the start
    try {
      final response = await http.get(Uri.parse(
          'https://pixabay.com/api/?key=$pixabayApiKey&image_type=photo'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Ensure 'hits' is not null and contains data
        if (data != null && data['hits'] != null) {
          final List<dynamic> hits = data['hits'];

          // Safely map the JSON to ImageModel
          images.value = hits.map((json) => ImageModel.fromJson(json)).toList();
        } else {
          throw Exception('No images found');
        }
      } else {
        throw Exception('Failed to load images: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching images: $e');
      // Show an empty state if something goes wrong
      images.clear();
    } finally {
      // Always set loading to false in the end
      isLoading(false);
    }
  }
}
