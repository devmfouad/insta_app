import 'package:flutter/material.dart';

import '../shared/theme/app_colors.dart';
import '../shared/widget/custom_text_widget.dart';
import 'new/tabs/add_posts_tap.dart';
import 'new/tabs/home_tap.dart';
import 'new/tabs/notifications_tap.dart';
import 'new/tabs/profile_tap.dart';
import 'new/tabs/search_tab.dart';


class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    homeTap(),
    searchTap(),
    addPostsTap(),
    notificationsTap(),
    profileTap()
  ];
  late PageController _Cotroller ;

  @override
  void initState() {
    super.initState();
    _Cotroller = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.white,
        title: Text(
          "Instagram",
          style: TextStyle(
              color: AppColors.black, fontFamily: 'myFont', fontSize: 28),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.send_outlined,
            color: AppColors.black,
          )
        ],
        leading: Icon(
          Icons.camera_alt_outlined,
          color: AppColors.black,
        ),
      ),
      body: PageView (
        controller: _Cotroller,
        onPageChanged: (index){
          setState(() {
            currentIndex = index ;
          });
        },
        children: screens,
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                    moveToSelectedTab();
                  });
                },
                icon: Icon(
                  Icons.home_outlined,
                  size: currentIndex == 0 ? 42 : 33,
                  color: currentIndex == 0 ? Colors.black : Colors.black87,

                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                    moveToSelectedTab();
                  });
                },
                icon: Icon(
                  Icons.search_outlined,
                  size: currentIndex == 1 ? 42 : 33,
                  color: currentIndex == 1 ? Colors.black : Colors.black87,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                    moveToSelectedTab();
                  });
                },
                icon: Icon(
                  Icons.add_box_outlined,
                  size: currentIndex == 2 ? 42 : 33,
                  color: currentIndex == 2 ? Colors.black : Colors.black87,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                    moveToSelectedTab();
                  });
                },
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: currentIndex == 3 ? 42 : 33,
                  color: currentIndex == 3 ? Colors.black : Colors.black87,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 4;
                    moveToSelectedTab();
                  });
                },
                icon: Icon(
                  Icons.person_outline_outlined,
                  size: currentIndex == 4 ? 42 : 33,
                  color: currentIndex == 4 ? Colors.black : Colors.black87,
                )),
          ],
        ),
      ),
    );
  }

  void moveToSelectedTab(){
    _Cotroller.animateToPage(currentIndex, duration: Duration(milliseconds: 200), curve: Curves.linear);
  }
}

Widget AppStory({required String storyUrl}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.all(5),
        child: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(storyUrl),
        ),
      ),
      customTextWidget(newtext: "name", textSize: 10),
    ],
  );
}


