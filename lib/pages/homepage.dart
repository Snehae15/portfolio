import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/constants/size.dart';
import 'package:flutter_portfolio/constants/skill_items.dart';
import 'package:flutter_portfolio/widgets/drawer_mobile.dart';
import 'package:flutter_portfolio/widgets/headerdesktop.dart';
import 'package:flutter_portfolio/widgets/headermobile.dart';
import 'package:flutter_portfolio/widgets/main_desktop.dart';
import 'package:flutter_portfolio/widgets/main_mobile.dart';

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
                width: screenSize.width / 2,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                height: 500,
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    const Text(
                      "What I can Do",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Platforms and skills
                    Container(
                      constraints: const BoxConstraints(maxWidth: 450),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          for (int i = 0; i < platformItems.length; i++)
                            Container(
                              width: 200,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: CustomColor.bgLight2,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                leading: Image.asset(
                                  platformItems[i]["img"],
                                  width: 26,
                                ),
                                title: Text(
                                  platformItems[i]["title"],
                                  style: const TextStyle(
                                    color: CustomColor.whitePrimary,
                                  ),
                                ),
                              ),
                            ),
                          // skills
                          Wrap(
                            children: [
                              for (int i = 0; i < skillItems.length; i++)
                                Chip(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16.0),
                                  label: Text(skillItems[i]["img"]),
                                  avatar: Image.asset(skillItems[i]["title"]),
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Project Section
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.blueGrey,
              ),
              // Contact Section
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.blueGrey,
              ),
              // Footer Section
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.blueGrey,
              ),
            ],
          ),
        );
      },
    );
  }
}
