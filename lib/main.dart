import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:ColorScheme.dark(primary: Colors.black),
        ),
        home: HomePage(),
      ),
    );
  }
}

class AppState extends ChangeNotifier{

}

Container Grid(String text) {
  return Container(
    color: const Color.fromARGB(255, 250, 250, 250),
    padding: EdgeInsets.all(8),
    child: Text(
      text, 
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 50,
      ),
    ),
  );
}

class HomePage extends StatelessWidget{

  Widget build(BuildContext context){
    var appstate=context.watch<AppState>();
    return Row(
      children: [
        Expanded(
          flex: 3,
          child:GridView.count(
            crossAxisCount: 4,
            padding: EdgeInsets.all(15),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Grid('1'),
              Grid('2'),
              Grid('3'),
              Grid('4'),
              Grid('5'),
              Grid('6'),
            ],
          ),
        ),
      ],
    );
  }
}
