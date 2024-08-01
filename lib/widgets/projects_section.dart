import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/utils/project_util.dart';
import 'package:flutter_portfolio/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth =
        MediaQuery.of(context).size.width; // Correctly getting screen width

    return Container(
      width: screenWidth * 0.75, // Adjusted width based on screen width
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Projects",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 30,
              runSpacing: 30,
              children: myProjectUtils.map((project) {
                return ProjectCardWidget(
                    screenSize: Size(screenWidth,
                        double.infinity), // Use Size to avoid issues
                    project: project);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
