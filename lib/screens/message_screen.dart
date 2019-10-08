import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_dating_app/components/custom_app_bar.dart';

class MessageScreen extends StatefulWidget {
	
	final String chatDetails;

    const MessageScreen({Key key, this.chatDetails}) : super(key: key);
	
	@override
	MessageScreenState createState() {
		return MessageScreenState();
	}
}
class MessageScreenState extends State<MessageScreen> {
	
	final messageController = TextEditingController();
	
	bool isMessageInputEdited = false;
	
	@override
	void initState() {
		super.initState();
		// Start listening to changes in message textfield
		messageController.addListener(_messageInputChange);
	}
	@override
	void dispose() {
		super.dispose();
		messageController.dispose();
	}
	
	_messageInputChange() {
		if(messageController.text.length <= 0){
		
		}
		setState(() {
			 isMessageInputEdited = (messageController.text.length > 0);
		});
	}
	
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
						widget.chatDetails,
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
			body: Stack(
				children: <Widget>[
					Positioned.fill(
						child: Container(
							decoration: BoxDecoration(
								gradient: LinearGradient(
									begin: Alignment.bottomLeft,
									end: Alignment.bottomRight,
									colors: [
										Color.fromRGBO(220,20,60, 1.0),
										Color.fromRGBO(220,20,60, 1.0),
									],
								),
							),
						),
					),
					Column(
						mainAxisSize: MainAxisSize.max,
						children: <Widget>[
							messageListComponent(context),
							createMessageInputComponent(context),
						],
					),
				],
			),
		);
	}
	
	Widget circleAppBarImage () {
		// wrapped around a column so that the avatar doesn't stretch
		return Container(
			margin: EdgeInsets.only(right: 10),
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
	
	Widget messageListComponent (BuildContext context) {
		// wrapped around a column so that the avatar doesn't stretch
		return Expanded(
			flex: 1,
			child: Container(
				padding: EdgeInsets.fromLTRB(24, 8, 8, 24),
				decoration: BoxDecoration(
					color: Colors.white,
					borderRadius: BorderRadius.only(
						bottomLeft: Radius.circular(36.0),
						bottomRight: Radius.circular(36.0),
					),
				),
			),
		);
	}
	
	Widget createMessageInputComponent (BuildContext context) {
		// wrapped around a column so that the avatar doesn't stretch
		return Container(
			padding: EdgeInsets.fromLTRB(24, 16, 16, 12),
			decoration: BoxDecoration(
				color: Colors.transparent,
			),
			child: TextField(
				style: TextStyle(
					fontSize: 16.0,
					color: Colors.white,
				),
				cursorColor: Colors.white,
				controller: messageController,
				keyboardType: TextInputType.multiline,
				maxLines: null,
				autofocus:false,
				decoration: InputDecoration(
					contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
					prefixIcon: Icon(
						Icons.insert_emoticon,
						color: Colors.white.withOpacity(0.6),
					),
					suffixIcon: Icon(
						Icons.send,
						color: Colors.white.withOpacity(isMessageInputEdited ? 1.0 : 0.4),
					),
					hintText: "Type you message here",
					hintStyle: TextStyle(
						color: Colors.white.withOpacity(0.8),
					),
					border: OutlineInputBorder(
						borderSide: BorderSide(
							color: Colors.transparent,
							width: 1.0,
						),
						borderRadius: BorderRadius.circular(32.0),
					),
					fillColor: Color.fromRGBO(205,92,92, 0.8),
					filled: true,
					focusedBorder: OutlineInputBorder(
						borderSide: BorderSide(
							color: Colors.white.withOpacity(0.0),
							width: 0.5,
						),
						borderRadius: BorderRadius.circular(32.0),
					),
					
				),
			),
		);
	}
}