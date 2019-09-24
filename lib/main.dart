import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_dating_app/widgets/custom_app_bar.dart';

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
			home: MyHomePage(title: 'Flutter Demo Home Page'),
		);
	}
}

class MyHomePage extends StatefulWidget {
	MyHomePage({Key key, this.title}) : super(key: key);
	final String title;
	
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
							padding: EdgeInsets.only(top: 60.0 + 40.0),
							child: Column(
								mainAxisSize: MainAxisSize.max,
								children: <Widget>[
									Padding(
										padding: EdgeInsets.all(16.0),
										child: Container(
											height: MediaQuery.of(context).size.height * 0.16,
											child: ListView.builder(
												primary: false,
												shrinkWrap: true,
												scrollDirection: Axis.horizontal,
												controller: scrollController,
												itemCount: lChatItems.length,
												itemBuilder: (BuildContext context, int index){
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
																			lChatItems[index],
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
												},
											),
										),
									),
									Expanded(
										child: Container(
											decoration: BoxDecoration(
												color: Colors.white,
												borderRadius: BorderRadius.only(
													topLeft: Radius.circular(32.0),
													topRight: Radius.circular(32.0),
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
}
