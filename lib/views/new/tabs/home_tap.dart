import 'package:flutter/material.dart';
import 'package:insta_app/global.dart';
import 'package:insta_app/shared/widget/post_widget.dart';

import '../../../shared/widget/custom_text_widget.dart';
import '../../main_Screen.dart';


class homeTap extends StatefulWidget {
  const homeTap({super.key});

  @override
  State<homeTap> createState() => _homeTapState();
}

class _homeTapState extends State<homeTap> {

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  List<PostModel> posts = [];

  getPosts()async {
  var result = await  firebaseFirestore.collection(postsCollection).get();
  if(result.docs.isNotEmpty) {
    for (var doc in result.docs) {

    }}

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 7, left: 10),
            child: Text(
              "Stories",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 89,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                AppStory(storyUrl: "assets/images/Cap0.jpg"),
                AppStory(storyUrl: "assets/images/Cap1.PNG"),
                AppStory(storyUrl: "assets/images/Cap2.PNG"),
                AppStory(storyUrl: "assets/images/Cap3.JPEG"),
                AppStory(storyUrl: "assets/images/Cap0.jpg"),
                AppStory(storyUrl: "assets/images/Cap1.PNG"),
                AppStory(storyUrl: "assets/images/Cap2.PNG"),
                AppStory(storyUrl: "assets/images/Cap3.JPEG"),
                AppStory(storyUrl: "assets/images/Cap0.jpg"),
                AppStory(storyUrl: "assets/images/Cap1.PNG"),
                AppStory(storyUrl: "assets/images/Cap2.PNG"),
                AppStory(storyUrl: "assets/images/Cap3.JPEG"),
              ],
            ),
          ),
          ListWidget()
        ],
      ) ,
    );
  }
}
class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return PostModel();
        },
      ),
    );
  }
}

