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
				fontFamily: 'RobotoMono',
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
			padding: EdgeInsets.all(20.0),
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
				decoration: BoxDecoration(
					color: Colors.blueAccent,
				),
			),
		);
	}
}
