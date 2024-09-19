import 'package:flutter/material.dart';
import 'Navigation/GalleryRouteInformationParser.dart';
import 'Navigation/GalleryRouterDelegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Image Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: GalleryRouterDelegate(),
      routeInformationParser: GalleryRouteInformationParser(),
    );
  }
}
