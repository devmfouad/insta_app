import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_app/global.dart';
import 'package:insta_app/models/post_model.dart';
import 'package:insta_app/shared/widget/custom_text_form_field_widget.dart';


class addPostsTap extends StatefulWidget {
  const addPostsTap({super.key});

  @override
  State<addPostsTap> createState() => _addPostsTapState();
}

class _addPostsTapState extends State<addPostsTap> {
  TextEditingController bodyCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Icon(
              Icons.add_a_photo_outlined,
              size: 150,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
              height: 120,
              child: CustomTextFormFieldWidget(
                hintText: "Add Post",
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: bodyCtrl,
                expanded: true,
              ),
          ),
          SizedBox(
            height: 12.h,
          ),
          ElevatedButton(
              onPressed: ()async{

            PostModel post = PostModel(
              userId: userId!,
              body: bodyCtrl.text.isEmpty ? null : bodyCtrl.text,
              imageUrl: "https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcQuAfbQZJnZJs9wfY2gi7F3JhKAOJTAocbbnDEs21qW50qqIG__-zAJACf0RjKu8ACZvgvDyK5Nu_2OEG70vBXKXi9B8MGoJ5JzvRwZA04CcW8dWznj9U4VB0lQW7xI-G8QWXb6W49xMQ",
            );



            await firebaseFirestore.collection(postsCollection).add(post.toMap());



          }, child: Text("Upload $userId"))

        ],
      ),
    );
  }
}
