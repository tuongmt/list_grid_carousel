import 'package:flutter/material.dart';
import 'package:listview_grid_carousel/screens/carousel.dart';
import 'package:listview_grid_carousel/screens/grid.dart';
import 'package:listview_grid_carousel/screens/listview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyGrid(),
    );
  }
}
