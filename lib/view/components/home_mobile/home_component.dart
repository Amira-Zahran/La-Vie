import 'package:flutter/material.dart';

Widget customBtn(
    {required Color forColor,
    required Color backColor,
    required Color color,
    required Function() onPressed,
    required String text,
    required Color textColor}){
  return Padding(
    padding: const EdgeInsets.only(right: 4.0 , left: 4),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: forColor, backgroundColor: backColor,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(
              color: color,
              width: 1,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: textColor,fontWeight: FontWeight.bold,)),
    ),
  );
}