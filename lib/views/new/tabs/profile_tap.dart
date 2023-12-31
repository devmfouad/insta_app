import 'package:flutter/material.dart';
import 'package:insta_app/shared/theme/app_colors.dart';
import 'package:insta_app/views/new/profile_taps/image_preview_screen.dart';

import '../../../global.dart';
import '../../../helpers/posts_helper.dart';
import '../../../models/post_model.dart';
import '../../../shared/widget/custom_text_widget.dart';
import '../profile_taps/my_photos.dart';
import '../profile_taps/status.dart';


class profileTap extends StatefulWidget {
  const profileTap({super.key});

  @override
  State<profileTap> createState() => _profileTapState();
}

class _profileTapState extends State<profileTap> {
  List<Widget> profileTaps = [
    myStatus(),
    myPhotos(),
  ];


  String displayType = 'grid';
  onChangeDisplayType(String type){
    displayType = type;
    setState(() {

    });
  }


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
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: customTextWidget(
                  newtext: "devmelbaz",
                  textSize: 33,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Cap1.PNG"),
                    radius: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      customTextWidget(
                        newtext: "1,487",
                      ),
                      customTextWidget(
                        newtext: "posts",
                      )
                    ],
                  ),
                  Column(
                    children: [
                      customTextWidget(
                        newtext: "1,898",
                      ),
                      customTextWidget(
                        newtext: "Followers",
                      )
                    ],
                  ),
                  Column(
                    children: [
                      customTextWidget(
                        newtext: "1.310",
                      ),
                      customTextWidget(
                        newtext: "Following",
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              customTextWidget(
                newtext: "Andrew Mundy",
                textSize: 21,
              ),
              customTextWidget(
                newtext:
                    "Most of these photos are developed and scanned at home by hand",
                textSize: 16,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 12,
                ),
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.white)),
                  onPressed: () {},
                  child: customTextWidget(newtext: "Edit Profile"),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                onChangeDisplayType("grid");
              },
              icon: Icon(
                Icons.border_all_outlined,
                size: 38,
                color: displayType == 'grid' ? AppColors.primartColor : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                onChangeDisplayType("list");
              },
              icon: Icon(
                Icons.list,
                size: 38,
                color: displayType == 'list' ? AppColors.primartColor : Colors.black,
              ),
            )
          ],
        ),
        displayType == "grid" ? buildGrid() : buildList(),
      ],
    );
  }


  Widget buildGrid() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return buildProfilePhotos(context,posts[index]);
      },
    );
  }
  Widget buildList() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context , index) {
        PostModel model = posts[index];

        return Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          child: ListTile(
            leading: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImagePreviewScreen(url: model.imageUrl!)));
                },
                onLongPress: (){
                  showDialog(context: context, builder: (context) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    );
                  });
                },
                child: Image.network(model.imageUrl!,width: 60,height: 60,)),
            title: Text(model.body!),
          ),
        );
      },
    );
  }
}

Widget buildProfilePhotos(BuildContext context , PostModel model) {
  return Container(
      margin: EdgeInsets.all(3),
      height: 100,
      width: MediaQuery.of(context).size.width / 3.18,
      child: Image.network(model.imageUrl!),
  );
}
