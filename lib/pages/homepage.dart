import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/constants/size.dart';
import 'package:flutter_portfolio/widgets/contact_section.dart';
import 'package:flutter_portfolio/widgets/drawer_mobile.dart';
import 'package:flutter_portfolio/widgets/headerdesktop.dart';
import 'package:flutter_portfolio/widgets/headermobile.dart';
import 'package:flutter_portfolio/widgets/main_desktop.dart';
import 'package:flutter_portfolio/widgets/main_mobile.dart';
import 'package:flutter_portfolio/widgets/projects_section.dart';
import 'package:flutter_portfolio/widgets/skill_desktop.dart';
import 'package:flutter_portfolio/widgets/skill_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

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
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    //function call
                  },
                ),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarKeys.first),
                // Header
                if (constraints.maxWidth >= kMinDesktopWidth)
                  Headerdesktop(
                    onNavMenuTap: (int navIndex) {
                      //function call
                    },
                  )
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
                  key: navbarKeys[1],
                  width: constraints.maxWidth < kMedDesktopWidth
                      ? screenSize.width
                      : screenSize.width * 0.75,
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
                ProjectsSection(key: navbarKeys[2]),
                // Contact Section
                ContactSection(key: navbarKeys[3]),

                // Footer Section
                Container(
                  color: CustomColor.bgLight1,
                  padding: const EdgeInsets.all(20),
                  child: const Center(
                    child: Text(
                      "© 2024 Your Portfolio",
                      style: TextStyle(
                        color: CustomColor.whitePrimary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      //open a blog page
      return;
    }
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
