import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class PostModel extends StatelessWidget {
  const PostModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 380,
      width: double.infinity,
      color: Colors.grey[50],
      child: Column(
        children: [
          Row(children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/Cap1.PNG"),
              radius: 30,
            ),
            SizedBox(
              width: 12,
            ),
            customTextWidget(newtext: "mahmoud&belal"),
            Spacer(),
            Icon(Icons.more_horiz_outlined)
          ]),
          Container(
            margin: EdgeInsets.only(top: 7,bottom: 7),
            height: 240,
            width: double.infinity,
            color: Colors.blueGrey[800],
          ),
          //Image(image: AssetImage("assets/images/Cap0.jpg")),
          Row(
            children: [
              Icon(Icons.favorite_border_outlined),
              Icon(Icons.messenger_outline_outlined),
              Icon(Icons.favorite_border_outlined),
            ],
          )
        ],
      ),
    );
  }
}
