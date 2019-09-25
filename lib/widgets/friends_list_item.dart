import 'package:flutter/material.dart';

class FriendsListItem extends StatelessWidget{
	
	final String lChatItem;

    const FriendsListItem({Key key, this.lChatItem}) : super(key: key);
    
	@override
	Widget build(BuildContext context) {
		return InkWell(
			onTap: (){},
			child: Padding(
				padding: EdgeInsets.only(right: 16.0),
				child: Column(
					children: <Widget>[
						Stack(
							children: <Widget>[
								ClipOval(
									child: Image.network(
										"https://via.placeholder.com/150",
										height: MediaQuery.of(context).size.height * 0.10,
										width: MediaQuery.of(context).size.height * 0.10,
										fit: BoxFit.cover,
									),
								),
								Positioned.fill(
									child: ClipOval(
										child: Material(
											color: Colors.transparent,
											child: InkWell(
												splashColor: Colors.white.withOpacity(0.4),
												onTap: () {},
											),
										),
									),
								),
							],
						),
						Padding(
							padding: EdgeInsets.only(top: 8.0),
							child: Text(
								lChatItem,
								style: TextStyle(
									fontSize: 14.0,
									fontWeight: FontWeight.w300,
								),
								textAlign: TextAlign.center,
							),
						),
					],
				),
			),
		);
	}
}