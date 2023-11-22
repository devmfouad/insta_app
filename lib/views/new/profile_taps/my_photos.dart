import 'package:flutter/material.dart';

import '../../../shared/widget/custom_text_widget.dart';


class myPhotos extends StatelessWidget {
  const myPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: customTextWidget(newtext: "My Photos"),),
    );
  }
}
