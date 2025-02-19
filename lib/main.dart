import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/gif_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GifProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Giphy Search',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
