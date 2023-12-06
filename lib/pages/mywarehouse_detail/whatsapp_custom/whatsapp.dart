import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomContactContainer extends StatelessWidget {
  final String name;
  final String role;
  final String phoneNumber; // Phone number to contact via WhatsApp

  const CustomContactContainer({
    Key? key,
    required this.name,
    required this.role,
    required this.phoneNumber,
  }) : super(key: key);

  void _openWhatsApp() async {
    final Uri whatsappUrl= Uri.parse("https://wa.me/$phoneNumber");
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openWhatsApp,
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: const Color(0xFFFFFFFF),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/image1.jpg"),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        color: const Color(0xFF202222),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      role,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                        color: const Color(0xFF959FA1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/WaIcon.svg",
                  height: 19,
                  width: 19,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Hubungi",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                      color: const Color(0xFF202222),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}