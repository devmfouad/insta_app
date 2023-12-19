import 'package:flutter/material.dart';
import 'package:insta_app/models/post_model.dart';

import 'custom_text_widget.dart';

class PostWidget extends StatelessWidget {
  final PostModel model;
  const PostWidget({super.key,required this.model});

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
            child: Image.network(model.imageUrl!),
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
