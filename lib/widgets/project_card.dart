import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/utils/project_util.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCardWidget extends StatefulWidget {
  const ProjectCardWidget({
    super.key,
    required this.screenSize,
    required this.project,
  });

  final Size screenSize;
  final ProjectUtil project;

  @override
  _ProjectCardWidgetState createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: _isHovered ? 350 : 300,
        width: _isHovered ? 280 : 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CustomColor.bgLight2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image
            Image.asset(
              widget.project.image,
              height: 130,
              width: _isHovered ? 260 : 240,
              fit: BoxFit.cover,
            ),
            // Project name
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Text(
                widget.project.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            // Subtitle
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Text(
                widget.project.subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            const Spacer(),
            // Footer Section
            Container(
              width: double.infinity,
              color: CustomColor.bgLight1,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  const Text(
                    "Available on:",
                    style: TextStyle(
                      color: CustomColor.yellowSecondary,
                      fontSize: 10,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () async {
                      final url = widget.project.link;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
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
      ),
    );
  }
}
