import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int? maxLines;

  const ProfileTextField({
    required this.label,
    required this.controller,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: const Color(0xFFF2F2F2),
          ),
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(12.0), // Add padding
            ),
          ),
        ),
      ],
    );
  }
}