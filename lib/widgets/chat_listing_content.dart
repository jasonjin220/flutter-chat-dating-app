import 'package:flutter/material.dart';

class ChatListingContent extends StatelessWidget{
	@override
	Widget build(BuildContext context) {
		return Stack(
			children: <Widget>[
				Container(
					decoration: BoxDecoration(
						color: Colors.blueAccent.withOpacity(0.2),
						borderRadius: BorderRadius.only(
							topLeft: Radius.circular(32.0),
							topRight: Radius.circular(32.0),
						),
					),
				),
			],
		);
	}
}