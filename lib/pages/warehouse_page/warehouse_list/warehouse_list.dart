import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WarehouseListItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final String action;
  final bool isActive;

  WarehouseListItem({
    required this.imagePath,
    required this.title,
    required this.location,
    required this.action,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108,
      margin: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              bottomLeft: Radius.circular(12.0),
            ),
            child: Opacity(
              opacity: isActive? 1.0 : 0.3,
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: isActive? 1.0 : 0.3,
                  child: Text(
                    title,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      letterSpacing: 1,
                      color: const Color(0xFF1E2022),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Opacity(
                  opacity: isActive? 1.0 : 0.3,
                  child: Text(
                    location,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      letterSpacing: 1,
                      color: const Color(0xFF77838F),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 130.0),
                      child: Text(
                        action,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          letterSpacing: 1,
                          color: isActive? const Color(0xFF11A6A1) : const Color(0xFF77838F),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
