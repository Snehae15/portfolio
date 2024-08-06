import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/constants/size.dart';
import 'package:flutter_portfolio/constants/sns_links.dart';
import 'package:flutter_portfolio/widgets/custom_text_field.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.bgLight1,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Get in touch",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary,
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth >= kMinDesktopWidth) {
                    return buildNameEmailFieldDesktop();
                  } else {
                    return buildNameEmailFieldMobile();
                  }
                },
              ),
            ),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: const CustomTextField(
                hintText: "Your Message",
                maxLines: 10,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Submit button pressed");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.yellowPrimary,
                padding: EdgeInsets.symmetric(
                  horizontal:
                      MediaQuery.of(context).size.width > 600 ? 100 : 60,
                  vertical: 15,
                ),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Divider(),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.github]);
                  },
                  child: Image.asset(
                    'assets/github.png',
                    width: 28,
                  ),
                ),
                InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.linkedIn]);
                  },
                  child: Image.asset(
                    'assets/linkedin.png',
                    width: 28,
                  ),
                ),
                InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.hackerRank]);
                  },
                  child: Image.asset(
                    'assets/hackerrank.png',
                    width: 28,
                  ),
                ),
                InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.instagram]);
                  },
                  child: Image.asset(
                    'assets/insta.png',
                    width: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNameEmailFieldDesktop() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomTextField(
            hintText: "Your Name",
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: CustomTextField(
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }

  Widget buildNameEmailFieldMobile() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          hintText: "Your Name",
        ),
        SizedBox(height: 15),
        CustomTextField(
          hintText: "Your Email",
        ),
      ],
    );
  }
}
