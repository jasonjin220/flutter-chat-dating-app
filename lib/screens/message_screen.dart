import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_dating_app/components/custom_app_bar.dart';

class MessageScreen extends StatelessWidget {
	
	final String chatDetails;
	final messageController = TextEditingController();
	
	MessageScreen({@required this.chatDetails});
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: PreferredSize(
				child: AppBar(
					elevation: 0.0,
					brightness: Brightness.light,
					backgroundColor: Colors.white,
					automaticallyImplyLeading: false,
					centerTitle: true,
					leading: IconButton(
						icon: Icon(
							Icons.arrow_back_ios,
							size: 28,
							color: Colors.black,
						),
						onPressed: () => Navigator.pop(context),
					),
					title: Text(
						chatDetails,
						style: TextStyle(
							color: Colors.black,
							fontWeight: FontWeight.bold,
						),
					),
					actions: <Widget>[
						circleAppBarImage()
					],
				),
				preferredSize: Size.square(kToolbarHeight),
			),
			body: SafeArea(
				child: Container(
					decoration: BoxDecoration(
						color: Colors.white
					),
				),
			),
		);
	}
	
	Widget circleAppBarImage () {
		// wrapped around a column so that the avatar doesn't stretch
		return Padding(
			padding: EdgeInsets.only(right: 10),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					CircleAvatar(
						radius: 20,
						backgroundImage: NetworkImage("https://via.placeholder.com/150")
					)
				],
			),
		);
	}
}