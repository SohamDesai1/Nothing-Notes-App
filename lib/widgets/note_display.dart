import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotesDisplay extends StatelessWidget {
  final String title;
  final String content;
  final Color color;
  final Color bgcolor;
  const NotesDisplay({
    super.key,
    required this.title,
    required this.content,
    required this.color,
    required this.bgcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 50.w,
      decoration: BoxDecoration(
          color: bgcolor,
          border: Border.all(color: color, width: 4),
          borderRadius: BorderRadius.circular(40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w, top: 3.h),
            child: Text(
              title,
              style: TextStyle(
                  color: color, fontSize: 28, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text(
              content,
              style: TextStyle(
                  color: color, fontSize: 14, fontWeight: FontWeight.w200),
            ),
          )
        ],
      ),
    );
  }
}
