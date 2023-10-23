import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearcInput extends StatelessWidget {
  final TextEditingController searchController;

  SearcInput ({
    required this.searchController
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 18.0, right: 18.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: const Color(0xFFFFFFFF),
            ),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF11A6A1),
                  ),
                  hintText: "Search",
                  hintStyle: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                    color: const Color(0xFF77838F),
                  ),
                  contentPadding: const EdgeInsets.only(left: 10.0, top: 12.0)),
            ),
          ),
        ),
      ],
    );
  }
}
