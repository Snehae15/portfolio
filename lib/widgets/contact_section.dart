import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/widgets/custom_text_field.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.bgLight1,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const Row(
            children: [
              Flexible(
                child: CustomTextField(
                  hintText: "Your Name",
                ),
              ),
              SizedBox(width: 15),
              Flexible(
                child: CustomTextField(
                  hintText: "Your Email",
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const CustomTextField(
            hintText: "Your Message",
            maxLines: 10,
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                print("Submit button pressed");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.yellowPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
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
          ),
        ],
      ),
    );
  }
}
