import 'package:flutter/material.dart';

import '../../../shared/widget/custom_text_widget.dart';

class myStatus extends StatelessWidget {
  const myStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: customTextWidget(newtext: "My Status"),),
    );
  }
}
