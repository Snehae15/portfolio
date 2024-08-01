import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: screenSize.height / 1.2,
      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Waving hand GIF with "Hi" text
                Row(
                  children: [
                    Image.asset(
                      'assets/waving-hand.gif',
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Hi',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Intro text with animation

                TextAnimator(
                  "I'm Sneha E",
                  style: const TextStyle(
                    fontSize: 30,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                  ),
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromLeft(
                    duration: Duration(milliseconds: 1000),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextAnimator(
                  "Flutter Developer",
                  style: const TextStyle(
                    fontSize: 30,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                  ),
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromLeft(
                    duration: Duration(milliseconds: 1000),
                  ),
                ),
                const SizedBox(height: 8),
                // About text
                const Text(
                  "Passionate about building beautiful and functional mobile applications. "
                  "Experienced in creating responsive and adaptive UI with Flutter. "
                  "Always eager to learn new technologies and improve skills.",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: CustomColor.whitePrimary,
                  ),
                ),
                const SizedBox(height: 16),
                // Button with animation
                WidgetAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromBottom(
                    duration: Duration(milliseconds: 1000),
                  ),
                  child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.yellowSecondary,
                      ),
                      child: const Text(
                        'Get in Touch',
                        style: TextStyle(
                          color: CustomColor.whitePrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Image with animation
          const SizedBox(width: 16),
          WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromRight(
              duration: Duration(milliseconds: 1500),
            ),
            child: Flexible(
              child: Image.asset(
                'assets/img4.jpg',
                fit: BoxFit.contain,
                width: screenSize.width / 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
