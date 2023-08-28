import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session5_task/providers/todoProvider.dart';
import 'package:session5_task/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TodoProvider(),
          ),

        ],

            child: MaterialApp(

                theme: ThemeData(
                useMaterial3: true,
              ),

              home: HomePage(),

              debugShowCheckedModeBanner: false,
            ),


    );

  }
}
