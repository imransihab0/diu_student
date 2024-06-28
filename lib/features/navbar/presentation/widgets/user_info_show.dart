import 'dart:ui';

import 'package:diu_student/core/resources/information_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfoShow extends StatelessWidget {
  const UserInfoShow({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    bool horizontal = h>w;
    double round = 20;


    bool isStudent = studentInfo.user != null;
    String Department = isStudent? "" : teacherInfo.department!;




    Row _row(String title, String sub){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              "$title : ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: "Madimi"
            ),
          ),
          Text(
              sub,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              fontFamily: "Madimi"
            ),
          ),
        ],
      );
    }



    Widget _information = isStudent?
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          Text(
            studentInfo.name!,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: "Madimi"
            ),
            textAlign: TextAlign.center,
          ),
          _row("Email" ,""),
          SizedBox(
            width: w,
            child: Text(
              studentInfo.email!,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  fontFamily: "Madimi"
              ),
              textAlign: TextAlign.start,
            ),
          ),
          _row("Student ID" ,studentInfo.id!),
          _row("Faculty" ,studentInfo.faculty!),
          _row("Department" ,studentInfo.department!),
          _row("Section" , "${studentInfo.batch!}-${studentInfo.section!}"),
        ],
      )
        :
        Column(

          children: [
            Text(
              teacherInfo.name!,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: "Madimi"
              ),
              textAlign: TextAlign.center,
            ),
            _row("Email" ,""),
            SizedBox(
              width: w,
              child: Text(
                teacherInfo.email!,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    fontFamily: "Madimi"
                ),
                textAlign: TextAlign.start,
              ),
            ),
            _row("Teacher Initial" ,teacherInfo.ti!),
            _row("Faculty" ,teacherInfo.faculty!),
            _row("Department" ,Department.split("-").length >1 ? "${Department.split("-")[0]}..." : Department),

          ],
        );


    return Container(
      width: horizontal ? w*.9 : h*.9,
      height: horizontal? isStudent ? h*.35 : h*.3 : w*.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(round)),
        color: Colors.blue.shade50,
        boxShadow: [BoxShadow(
          blurRadius: 20,
          spreadRadius: -10,
          offset: Offset(2,5)
        )]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w*.1 ,vertical: h*.03),
        child: _information,
      )
    );
  }
}
