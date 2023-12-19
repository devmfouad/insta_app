import 'dart:io' as io;
import 'dart:io';
import 'dart:typed_data';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
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
  XFile? pickedImage;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          pickedImage == null ?   GestureDetector(
            onTap: () {
              showAdaptiveActionSheet(
                context: context,
                title: const Text('Select Source'),
                androidBorderRadius: 30,
                actions: <BottomSheetAction>[
                  BottomSheetAction(
                    title: const Text('Camera'),
                    onPressed: (context) async {
                      Navigator.of(context).pop();
                      pickedImage = await imagePicker.pickImage(
                          source: ImageSource.camera);
                      if (pickedImage != null) {
                        print("from Camera");
                        print(pickedImage!.name);
                        setState(() {

                        });
                      }
                    },
                  ),
                  BottomSheetAction(
                    title: const Text('Gallery'),
                    onPressed: (context) async {
                      Navigator.of(context).pop();
                      pickedImage = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      if (pickedImage != null) {
                        print("from gallery");
                        print(pickedImage!.name);
                        setState(() {

                        });
                      }
                    },
                  ),
                ],
                cancelAction: CancelAction(
                    title: const Text(
                        'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Icon(
                Icons.add_a_photo_outlined,
                size: 150,
              ),
            ),
          ) :
          InkWell(
            onTap: () {
              showAdaptiveActionSheet(
                context: context,
                title: const Text('Select Source'),
                androidBorderRadius: 30,
                actions: <BottomSheetAction>[
                  BottomSheetAction(
                    title: const Text('Camera'),
                    onPressed: (context) async {
                      Navigator.of(context).pop();
                      pickedImage = await imagePicker.pickImage(
                          source: ImageSource.camera);
                      if (pickedImage != null) {
                        print("from Camera");
                        print(pickedImage!.name);
                        setState(() {

                        });
                      }
                    },
                  ),
                  BottomSheetAction(
                    title: const Text('Gallery'),
                    onPressed: (context) async {
                      Navigator.of(context).pop();
                      pickedImage = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      if (pickedImage != null) {
                        print("from gallery");
                        print(pickedImage!.name);
                        setState(() {

                        });
                      }
                    },
                  ),
                ],
                cancelAction: CancelAction(
                    title: const Text(
                        'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.file(File(pickedImage!.path),fit: BoxFit.contain,),
                  Align(alignment: Alignment.bottomCenter,child: TextButton(onPressed: (){
                    setState(() {
                      pickedImage = null;
                    });
                  }, child: Text("remove",style: TextStyle(color: Colors.red),)))
                ],
              )
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
              onPressed: () async {
                if (pickedImage != null) {
                  //imageUrl = await uploadImage();
                }
                imageUrl = "https://firebasestorage.googleapis.com/v0/b/insta-app-58710.appspot.com/o/posts%2F11030388_10205460352721668_6187722462551106610_n.jpg?alt=media&token=73b717f8-4931-4eb2-be35-0cdfba57ebfc";


                PostModel post = PostModel(
                  userId: userId!,
                  body: bodyCtrl.text.isEmpty ? null : bodyCtrl.text,
                  imageUrl: imageUrl,
                );

                await firebaseFirestore
                    .collection(postsCollection)
                    .add(post.toMap());
              },
              child: Text("Upload $userId"))
        ],
      ),
    );
  }

  uploadImage() async {
    //final _firebaseStorage = FirebaseStorage.instance;
    //final _imagePicker = ImagePicker();
    //PickedFile image;
    //Check Permissions
    //await Permission.photos.request();

    //var permissionStatus = await Permission.photos.status;

    //if (permissionStatus.isGranted){
    //Select Image
    // image = await imagePicker.getImage(source: ImageSource.gallery);
    var file = File(pickedImage!.path);
    //pickedImage.name

    var fileName = "${DateTime.now()}";

    //Upload to Firebase

    Reference ref = storage.ref();

    await ref.child('posts/$fileName').putFile(file);
    //var downloadUrl = await snapshot.ref.getDownloadURL();
    //return downloadUrl;
    String imageUrl = await ref.getDownloadURL();
    print(imageUrl);
    return imageUrl;

    // } else {
    print('Permission not granted. Try Again with permission access');
    // }
  }
}
