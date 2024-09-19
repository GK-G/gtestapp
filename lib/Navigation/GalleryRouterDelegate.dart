import 'package:flutter/material.dart';
import '../Model/ImageModel.dart';
import '../Views/DetailsScreen.dart';
import '../Views/GalleryView.dart';


class GalleryRouterDelegate extends RouterDelegate<List<ImageModel>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey;
  List<ImageModel> galleryItems = [];
  ImageModel? selectedImage;

  GalleryRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    List<Page> stack = [];

    // Gallery Page
    stack.add(MaterialPage(
      key: const ValueKey('GalleryPage'),
      child: GalleryPage(
        onImageSelected: _handleImageSelected,
      ),
    ));

    // Detail Page (if an image is selected)
    if (selectedImage != null) {
      stack.add(MaterialPage(
        key: const ValueKey('DetailPage'),
        child: DetailScreen(image: selectedImage!),
      ));
    }

    return Navigator(
      key: navigatorKey,
      pages: stack,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        selectedImage = null;
        notifyListeners();
        return true;
      },
    );
  }

  /// Handles selecting an image in the gallery
  void _handleImageSelected(ImageModel image) {
    selectedImage = image;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(List<ImageModel> configuration) async {
    galleryItems = configuration;
  }

  @override
  List<ImageModel> get currentConfiguration => galleryItems;
}
