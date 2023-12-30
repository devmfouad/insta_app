import 'package:flutter/material.dart';


class ImagePreviewScreen extends StatelessWidget {
  final String url;
  const ImagePreviewScreen({super.key,required this.url});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Image.network(url,width: width,height: height,fit: BoxFit.contain,),
    );
  }
}
