import 'package:flutter/material.dart';
import '../Model/ImageModel.dart';

class GalleryRouteInformationParser extends RouteInformationParser<List<ImageModel>> {
  @override
  Future<List<ImageModel>> parseRouteInformation(RouteInformation routeInformation) async {
    // In this case, we can just return an empty list or load from a source.
    return [];
  }

  @override
  RouteInformation? restoreRouteInformation(List<ImageModel> configuration) {
    return RouteInformation(location: '/');
  }
}
