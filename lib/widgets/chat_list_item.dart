import 'package:flutter/material.dart';

class ChatListItem extends StatelessWidget{
	
	final int listPosition;

    const ChatListItem({Key key, this.listPosition}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return
			Material(
				child: InkWell(
					onTap: (){print("tapped");},
					child: Padding(
						padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 16.0),
						child: Row(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: <Widget>[
								badgeCount(listPosition.isOdd),
								Expanded(
									child: Row(
										children: <Widget>[
											_imageContent(),
											SizedBox(
												width: 8,
											),
											_textContent(),
										],
									),
								),
								SizedBox(
									width: 8,
								),
								Text(
									"8.24 PM",
									style: TextStyle(
										color: Colors.black,
										fontSize: 13.0,
									),
								),
							],
						),
					),
				),
				color: Colors.transparent,
			);
	}
	
	Widget badgeCount(isShow){
		return !isShow ?
			Container()
			:
			Container(
				margin: EdgeInsets.only(right: 8.0),
				padding: EdgeInsets.all(8.0),
				decoration: BoxDecoration(
					shape: BoxShape.circle,
					color: Colors.green,
				),
				child: Text(
					"4",
					style: TextStyle(
						color: Colors.white,
						fontSize: 14.0,
					),
				),
			);
	}
	
	Widget _imageContent() {
		return CircleAvatar(
			radius: 32.0,
			backgroundImage:NetworkImage(
				'https://via.placeholder.com/150',
			),
			backgroundColor: Colors.transparent,
		);
	}
	
	Widget _textContent() {
		return Flexible(
			child: Column(
				mainAxisSize: MainAxisSize.max,
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					Text(
						"James Martin",
						style: TextStyle(
							color: Colors.black,
							fontSize: 16.0,
							fontWeight: FontWeight.bold,
						),
					),
					SizedBox(height: 4.0,),
					RichText(
						textAlign: TextAlign.left,
						softWrap: true,
						overflow: TextOverflow.ellipsis,
						maxLines: 1,
						text: TextSpan(children:
						<TextSpan>[
							TextSpan(text:"You: ",
								style: TextStyle(
									color: Colors.blueGrey,
									fontWeight: FontWeight.bold,
									fontSize: 13.0,
								),
							),
							TextSpan(
								text:"Wrap?There's such a long text",
								style: TextStyle(
									color: Colors.grey,
									fontSize: 13.0,
								),
							),
						]
						),
					),
				],
			),
		);
	}
}