import 'package:flutter/material.dart';
import 'package:insta_app/global.dart';
import 'package:insta_app/helpers/posts_helper.dart';
import 'package:insta_app/shared/widget/post_widget.dart';

import '../../../models/post_model.dart';
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
    posts = await PostsHelper.getPosts(userId: userId!);
    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          getPosts();
        },
        child: ListView(
          physics: BouncingScrollPhysics(),
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
            //stories
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
            //posts
            posts.isEmpty ? Center(child: CircularProgressIndicator()) :
            ListWidget(posts: posts,)
          ],
        ),
      ) ,
    );
  }
}


class ListWidget extends StatelessWidget {
  final List<PostModel> posts;
  ListWidget({required this.posts});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostWidget(model: posts[index],);
      },
    );
  }
}

