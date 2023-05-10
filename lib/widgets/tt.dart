import 'package:flutter/material.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';

class TT extends StatelessWidget {
  const TT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = context.isSmallScreen;
    final style = TextStyle(
      color: AppColors.primaryText,
      fontSize: isSmallScreen ? 80 : 100,
    );
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
            right: isSmallScreen ? 40 : 50,
          ),
          child: Text(
            'T',
            style: style,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: isSmallScreen ? 40 : 50,
            top: isSmallScreen ? 90 : 110,
          ),
          child: Text(
            'T',
            style: style,
          ),
        )
      ],
    );
  }
}
