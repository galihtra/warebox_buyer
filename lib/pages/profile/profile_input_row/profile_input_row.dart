import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInputRow extends StatelessWidget {
  final String leftLabel;
  final TextEditingController leftController;
  final String rightLabel;
  final Widget rightDropdown;

  const ProfileInputRow({
    required this.leftLabel,
    required this.leftController,
    required this.rightLabel,
    required this.rightDropdown,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              leftLabel,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              width: 144,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: const Color(0xFFF2F2F2),
              ),
              child: TextFormField(
                controller: leftController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rightLabel,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              width: 144,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: const Color(0xFFF2F2F2),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: rightDropdown,
              ), // The custom dropdown widget
            ),
          ],
        ),
      ],
    );
  }
}




