import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({super.key});

  @override
  _MainMobileState createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -0.3, end: 0.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
        constraints: const BoxConstraints(
          minHeight: 500.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Waving hand animation
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
            const SizedBox(height: 20),
            // Image with ShaderMask and animation
            WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
                duration: const Duration(milliseconds: 1200),
              ),
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    colors: [
                      CustomColor.scaffoldBg.withOpacity(0.6),
                      CustomColor.scaffoldBg.withOpacity(0.6),
                    ],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: Center(
                  child: Image.asset(
                    'assets/img4.jpg',
                    width: screenSize.width / 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Intro text with entrance animation only
            TextAnimator(
              "I'm Sneha E",
              style: const TextStyle(
                fontSize: 30,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary,
              ),
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
                duration: Duration(milliseconds: 1000),
              ),
            ),
            const SizedBox(height: 5),
            TextAnimator(
              "Flutter Developer",
              style: const TextStyle(
                fontSize: 30,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary,
              ),
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
                duration: Duration(milliseconds: 1000),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "About",
              style: TextStyle(
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColor.bgLight2,
              ),
            ),
            const SizedBox(height: 15),
            // About text
            const Text(
              "I specialize in creating dynamic and responsive mobile applications using Flutter. "
              "With a keen eye for detail and a passion for innovative design, "
              "I strive to deliver user-friendly and aesthetically pleasing applications. "
              "I am always eager to learn new technologies and expand my skillset.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: CustomColor.whitePrimary,
              ),
            ),
            const SizedBox(height: 16),
            // Buttons with animation
            WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(
                duration: const Duration(milliseconds: 1000),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 190,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your action for "Get in Touch"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.yellowSecondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Get in Touch',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 210,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Action for downloading the resume
                        // Example: launch a URL to download the resume
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.yellowSecondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      icon: const Icon(Icons.download, color: Colors.white),
                      label: const Text(
                        'Resume',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
