import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHistoryCard extends StatelessWidget {
  final String history;
  final String month;
  final String day;

  CustomHistoryCard({
    required this.history,
    required this.month,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(right: 15.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFF4F4F4),
                ),
                child: SvgPicture.asset("assets/images/box.svg"),
              ),
              Text(
                history,
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                month,
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFC4C4C4),
                ),
              ),
              Text(
                day,
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFC4C4C4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
