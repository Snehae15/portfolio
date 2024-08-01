import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/constants/nav_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close, color: CustomColor.whitePrimary),
              ),
            ),
          ),
          // Iterate over navIcons and navTitles to create ListTiles with dividers
          for (int i = 0; i < navIcons.length; i++) ...[
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
              titleTextStyle: const TextStyle(
                color: CustomColor.whitePrimary,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              onTap: () {
                // Add your onTap logic here
              },
              leading: Icon(navIcons[i], color: CustomColor.whitePrimary),
              title: Text(navTitles[i]),
            ),
            // Add a divider after each ListTile except the last one
            if (i < navIcons.length - 1)
              const Divider(
                color: CustomColor.whitePrimary,
                thickness: 0.5,
                indent: 30,
                endIndent: 30,
              ),
          ]
        ],
      ),
    );
  }
}
