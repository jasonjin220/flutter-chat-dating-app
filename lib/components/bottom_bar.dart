import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget{
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>{
	
	int _currentIndex = 0;
	
	@override
	Widget build(BuildContext context) {
		return BottomAppBar(
			elevation: 2.0,
			color: Colors.white,
			child: Row(
				mainAxisSize: MainAxisSize.max,
				mainAxisAlignment: MainAxisAlignment.spaceAround,
				children: <Widget>[
					IconButton(
						icon: Icon(
							Icons.menu,
							color: _currentIndex == 0 ? Colors.red : Colors.black,
						),
						onPressed: () {
							setState(() {
								_currentIndex == 0;
							});
						},
					),
					IconButton(
						icon: Icon(
							Icons.message,
							color: _currentIndex == 1 ? Colors.red : Colors.black,
						),
						onPressed: () {
							setState(() {
								_currentIndex == 1;
							});
						},
					),
					IconButton(
						icon: Icon(
							Icons.person,
							color: _currentIndex == 2 ? Colors.red : Colors.black,
						),
						onPressed: () {
							setState(() {
								_currentIndex == 2;
							});
						},
					)
				],
			),
		);
	}
}