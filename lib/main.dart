import 'package:flutter/material.dart';
import 'package:simplecodegen/controller/feed_controller.dart';
import 'package:simplecodegen/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (context) => FeedController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OurApp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
