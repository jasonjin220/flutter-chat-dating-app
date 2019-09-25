import 'package:flutter/material.dart';

class DashedListDivider extends StatelessWidget{
	final double totalWidth;
	final double dashWidth;
	final double emptyWidth;
	final double dashHeight;
	final Color dashColor;

    const DashedListDivider({Key key, this.totalWidth, this.dashWidth, this.emptyWidth, this.dashHeight, this.dashColor}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return Row(
			children: List.generate(
				totalWidth ~/ (dashWidth + emptyWidth),
					(_) => Container(
					width: dashWidth,
					height: dashHeight,
					color: dashColor,
					margin: EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
				),
			),
		);
	}
}