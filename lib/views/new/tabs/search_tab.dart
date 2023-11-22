import 'package:flutter/material.dart';

import '../../../shared/widget/custom_text_widget.dart';

class searchTap extends StatelessWidget {
  const searchTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: customTextWidget(newtext: "searchTap"),),
    );
  }
}
