import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/constants/size.dart';
import 'package:flutter_portfolio/widgets/drawer_mobile.dart';
import 'package:flutter_portfolio/widgets/headerdesktop.dart';
import 'package:flutter_portfolio/widgets/headermobile.dart';
import 'package:flutter_portfolio/widgets/main_desktop.dart';
import 'package:flutter_portfolio/widgets/main_mobile.dart';
import 'package:flutter_portfolio/widgets/skill_desktop.dart';
import 'package:flutter_portfolio/widgets/skill_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              : const DrawerMobile(),
          body: ListView(
            children: [
              // Header
              if (constraints.maxWidth >= kMinDesktopWidth)
                const Headerdesktop()
              else
                Headermobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              // Main Section
              if (constraints.maxWidth >= kMinDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),

              // Skill Section
              Container(
                width: screenSize.width < kMedDesktopWidth
                    ? screenSize.width
                    : screenSize.width / 2,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    const Text(
                      "What I Can Do",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 50),
                    // Platforms and skills
                    if (constraints.maxWidth >= kMedDesktopWidth)
                      const SkillDesktop()
                    else
                      const SkillMobile(),
                  ],
                ),
              ),
              // Project Section
              Container(
                width: screenSize.width / 2,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                child: Column(
                  children: [
                    //Work project title
                    const Text(
                      "What I Can Do",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary),
                    ),
                    //work projects cards
                    Container(
                      height: 280,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: CustomColor.bgLight2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //img
                          Image.asset(
                            "assets/projects/campus.png",
                            height: 140,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                          //project name
                          Padding(
                            padding: EdgeInsets.fromLTRB(12, 15, 12, 12),
                            child: const Text(
                              "Campus Recruitment",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: CustomColor.whitePrimary),
                            ),
                          ),
                          // Subtitle
                          Padding(
                            padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                            child: Text(
                              "An Application for College campus recruitment",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: CustomColor.whitePrimary),
                            ),
                          ),
                          const Spacer(),
                          //Footer Section
                          Container(
                            width: double.infinity,
                            color: CustomColor.bgLight1,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
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
                                InkWell(
                                  onTap: () {},
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
                    )
                  ],
                ),
              ),
              // Contact Section
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.blueGrey,
              ),
              //
              //Footer Section
            ],
          ),
        );
      },
    );
  }
}
