import 'package:flutter/material.dart';

class customIconBottomWidget extends StatefulWidget {
  const customIconBottomWidget({super.key, required this.currentIndex});
final int currentIndex ;

  @override
  State<customIconBottomWidget> createState() => _customIconBottomWidgetState();
}

class _customIconBottomWidgetState extends State<customIconBottomWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
         widget.currentIndex;
        });
      },
      child: Icon(
        Icons.search_outlined,
        size: 33,
        color: Colors.black87,
      ),
    );
  }
}
