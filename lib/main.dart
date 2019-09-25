import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_dating_app/components/bottom_bar.dart';
import 'package:flutter_chat_dating_app/components/custom_app_bar.dart';
import 'package:flutter_chat_dating_app/widgets/friends_list_item.dart';

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
			home: MyHomePage(),
		);
	}
}

class MyHomePage extends StatefulWidget {
	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	
	ScrollController scrollController = new ScrollController();
	
	ScrollController chatListSrollController = new ScrollController();
	
	List<String> lChatItems = ["Harry","Timothy","Frankine","Ronald","Sarah","2","Third","4"];
	
	@override
	void initState() {
		super.initState();
		SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
			statusBarColor: Colors.transparent,
			statusBarIconBrightness: Brightness.dark,
		));
	}
	
	@override
	void dispose() {
		super.dispose();
		scrollController.dispose();
		chatListSrollController.dispose();
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Stack(
				children: <Widget>[
					CustomAppBar(),
					Positioned.fill(
						child: Padding(
							padding: EdgeInsets.only(top: 60.0 + 20.0),
							child: Column(
								mainAxisSize: MainAxisSize.max,
								children: <Widget>[
									Padding(
										padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
										child: Container(
											height: MediaQuery.of(context).size.height * 0.14,
											child: ListView.builder(
												primary: false,
												shrinkWrap: true,
												physics: BouncingScrollPhysics(),
												scrollDirection: Axis.horizontal,
												itemCount: lChatItems == null ? 0 : lChatItems.length,
												controller: scrollController,
												itemBuilder: (BuildContext context, int index){
													return FriendsListItem(lChatItem: lChatItems[index],);
												},
											),
										),
									),
									Expanded(
										child: Container(
											child: ClipRRect(
												borderRadius: BorderRadius.only(
													topLeft: Radius.circular(32.0),
													topRight: Radius.circular(32.0),
												),
												child: Column(
													mainAxisSize: MainAxisSize.max,
													children: <Widget>[
														Expanded(
															child: Container(
																decoration: BoxDecoration(
																	color: Colors.white,
																),
																child: Column(
																	mainAxisSize: MainAxisSize.max,
																	children: <Widget>[
																		topContainer(),
																		chatListContainer(),
																	],
																),
															),
														),
														BottomBar(),
													],
												),
											),
										),
									),
								],
							),
						),
					),
				],
			),
		);
	}
	
	Widget topContainer() {
		return Padding(
			padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					Text(
						"Sunday",
						style: TextStyle(
							fontSize: 24,
							fontWeight: FontWeight.bold,
							color: Colors.black,
						),
					),
					Icon(
						Icons.more_horiz,
						size: 24,
						color: Colors.black,
					),
				],
			),
		);
	}
	
	Widget chatListContainer() {
		return Expanded(
			child: Container(
				height: double.infinity,
				margin: EdgeInsets.symmetric(horizontal: 4.0),
				child: ListView.separated(
					primary: false,
					shrinkWrap: true,
					physics: BouncingScrollPhysics(),
					scrollDirection: Axis.vertical,
					itemCount: lChatItems == null ? 0 : lChatItems.length,
					controller: chatListSrollController,
					separatorBuilder: (context, index) => _buildDashWidget(),
					itemBuilder: (BuildContext context, int index){
						return Padding(
							padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 16.0),
							child: Row(
								mainAxisAlignment: MainAxisAlignment.spaceEvenly,
								children: <Widget>[
									badgeCount(true),
									SizedBox(
										width: 8,
									),
									Expanded(
										child: Row(
											children: <Widget>[
												CircleAvatar(
													radius: 32.0,
													backgroundImage:NetworkImage(
														'https://via.placeholder.com/150',
													),
													backgroundColor: Colors.transparent,
												),
												SizedBox(
													width: 8,
												),
												Flexible(
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
												),
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
						);
					},
				),
			),
		);
	}
	
	

// this is the main widget
	Widget _buildDashWidget() {
		
		double _totalWidth = MediaQuery.of(context).size.width - 40, _dashWidth = 16, _emptyWidth = 16, _dashHeight = 0.5;
		Color _dashColor = Colors.grey.shade400;
		
		return Row(
			children: List.generate(
				_totalWidth ~/ (_dashWidth + _emptyWidth),
					(_) => Container(
					width: _dashWidth,
					height: _dashHeight,
					color: _dashColor,
					margin: EdgeInsets.only(left: _emptyWidth / 2, right: _emptyWidth / 2),
				),
			),
		);
	}
	
	Widget badgeCount(isShow){
		return !isShow ?
			null
			:
			Container(
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
			)
		;
	}
}
