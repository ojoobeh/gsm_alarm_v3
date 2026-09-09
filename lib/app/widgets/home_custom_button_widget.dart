import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bestdroid/app/widgets/widgets.dart';

class HomeCustomButtonWidget extends StatelessWidget {
  final String param;
  final String iconData;
  final color;
  final textColor;
  final onTop;

  const HomeCustomButtonWidget({
    required this.param,
    required this.iconData,
    this.color=0,
    this.textColor=Colors.white,
    this.onTop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: (MediaQuery.of(context).size.width / 2) - 20,
      child:  InkWell(
        hoverColor: Colors.transparent,
        onTap: onTop,
        child: Container(
          color: color!=0?Color(color): context.theme.primaryColor,
            margin: EdgeInsets.only(top: 12),
            // style: NeumorphicStyle(
            //   color:color!=0?Color(color): context.theme.primaryColor,
            //   shape: NeumorphicShape.convex,
            //   boxShape:
            //   NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
            // ),
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children: [
                Center(
                  child: image(
                    iconData,
                    width: 48,
                    color: textColor.withOpacity(0.2),
                  ),
                ),
                Center(
                  child: Text(
                    param,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ).marginOnly(bottom: 8),
                ),
              ],
            ),),
      ),
    );
  }
}
