import 'package:dataflu/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

button(context, VoidCallback onPressed){
  return Center(
    child: Container(
      width: 100.w,
      child: RaisedButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // <-- Radius
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text('Continue', style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500
          ),),
        ),
        color: appColorLight
        ,
      ),
    ),
  );
}

buttonSolid(context, VoidCallback onPressed){
  return Center(
    child: Container(
      width: 100.w,
      child: RaisedButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // <-- Radius
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text('Continue', style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500
          ),),
        ),
        color: Colors.indigoAccent.shade200
        ,
      ),
    ),
  );
}