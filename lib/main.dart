import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_dating_app/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Date Chat',
			debugShowCheckedModeBanner: false,
			theme: ThemeData(
				brightness: Brightness.dark,
				primarySwatch: Colors.blue,
				fontFamily: 'Oxygen',
			),
			home: HomeScreen(),
		);
	}
}