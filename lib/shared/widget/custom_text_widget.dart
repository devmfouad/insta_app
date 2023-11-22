import 'package:flutter/material.dart';

class customTextWidget extends StatefulWidget {
  const customTextWidget({
    super.key,
    required this.newtext,
    this.textWeight = FontWeight.w500,
    this.textSize = 19,
    this.textcolor = Colors.black87,
  });
  final FontWeight textWeight;
  final String newtext;
  final double textSize;
  final Color textcolor;

  @override
  State<customTextWidget> createState() => _customTextWidgetState();
}

class _customTextWidgetState extends State<customTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      //TextAlign.end ,
      widget.newtext,
      style: TextStyle(
        fontSize: widget.textSize,
        fontWeight: widget.textWeight,
        color: widget.textcolor,
      ),
    );
  }
}
