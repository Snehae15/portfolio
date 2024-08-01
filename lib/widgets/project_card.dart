import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/utils/project_util.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget(
      {super.key, required this.screenSize, required this.project});

  final Size screenSize;
  final ProjectUtil project;
  @override
  Widget build(BuildContext context) {
    //work project card
    return Container(
      height: 300,
      width: 260,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: CustomColor.bgLight2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          //img
          Image.asset(
            project.image,
            height: 140,
            width: 240,
            fit: BoxFit.cover,
          ),
          //project name
          Padding(
            padding: EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: Text(
              project.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: CustomColor.whitePrimary),
            ),
          ),
          // Subtitle
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: TextStyle(fontSize: 12, color: CustomColor.whitePrimary),
            ),
          ),
          const Spacer(),
          //Footer Section
          Container(
            width: double.infinity,
            color: CustomColor.bgLight1,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Available on:",
                  style: TextStyle(
                    color: CustomColor.yellowSecondary,
                    fontSize: 10,
                  ),
                ),
                Spacer(),
                if (project.link != null)
                  InkWell(
                    onTap: () {
                      js.context.callMethod("open", [project.link]);
                    },
                    child: Image.asset(
                      "assets/github.png",
                      width: 17,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
