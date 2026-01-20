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
    padding: EdgeInsets.all(10),
    child: Text(
      text, 
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        decoration: TextDecoration.none,
      ),
    ),
  );
}

class HomePage extends StatelessWidget{

  Widget build(BuildContext context){
    var appstate=context.watch<AppState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 400,
          width: 400 ,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6), 
              itemCount: 50,
              itemBuilder: (context, index) => Container(padding: EdgeInsets.all(6),child: Grid('${index+1}'))
            )
          ),
      ],
    );
  }
}
