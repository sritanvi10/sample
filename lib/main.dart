import 'package:flutter/material.dart';
import 'package:sample/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(246, 246, 246, 1)),
        primaryColor: Colors.white60,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage()
      ),
    );
  }
}

// Container Grid(String text) {
//   return Container(
//     color: const Color.fromARGB(255, 250, 250, 250),
//     padding: EdgeInsets.all(10),
//     child: Text(
//       text,
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         color: Colors.black,
//         fontSize: 25,
//         decoration: TextDecoration.none,
//       ),
//     ),
//   );
// }

