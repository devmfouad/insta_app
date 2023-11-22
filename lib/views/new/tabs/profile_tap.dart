import 'package:flutter/material.dart';

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
              onPressed: () {},
              icon: Icon(
                Icons.border_all_outlined,
                size: 38,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_pin_outlined,
                size: 38,
              ),
            )
          ],
        ),
        Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.spaceEvenly,
            children: [
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
              buildProfilePhotos(context),
            ])
      ],
    );
  }
}

Widget buildProfilePhotos(BuildContext context) {
  return Container(
      margin: EdgeInsets.all(3),
      height: 100,
      width: MediaQuery.of(context).size.width / 3.18,
      color: Colors.blueGrey[700]);
}
