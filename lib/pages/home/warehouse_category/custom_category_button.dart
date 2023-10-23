import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomWarehouseItem extends StatelessWidget {
  final String imagePath;
  final String title1;
  final String title2;
  final Function() onTap;

  CustomWarehouseItem({
    required this.imagePath,
    required this.title1,
    required this.title2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 18, top: 10),
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xFFF2F5F9),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset(imagePath),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10.0, top: 8.0),
            child: Column(
              children: [
                Text(
                  title1,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF77838F),
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  title2,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF77838F),
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
