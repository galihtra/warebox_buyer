import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class myWarehouseDetail extends StatefulWidget {
  const myWarehouseDetail({super.key});

  @override
  State<myWarehouseDetail> createState() => _myWarehouseDetailState();
}

class _myWarehouseDetailState extends State<myWarehouseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFCFCFC),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 297,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/image2.jpg"),
                        fit: BoxFit.cover)),
              ),
              Container(
                margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Joyonoro",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                color: const Color(0xFF1E2022),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/images/star.png"),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text(
                                    "(4.9)",
                                    style: GoogleFonts.plusJakartaSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1,
                                        color: const Color(0xFF77838F)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 171,
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Ruko Batu Aji komplek Gajah Mada No.13",
                            style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                letterSpacing: 1,
                                color: const Color(0xFF979797)),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Information",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              color: const Color(0xFF1E2022),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Start Rent",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  color: const Color(0xFF1E2022),
                                ),
                              ),
                              Text(
                                "12 September 2023",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  color: const Color(0xFF77838F),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "End Rent",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  color: const Color(0xFF1E2022),
                                ),
                              ),
                              Text(
                                "19 September 2023",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  color: const Color(0xFF77838F),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
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
                                  backgroundImage:
                                      AssetImage("assets/images/image1.jpg"),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Natalya Alifa",
                                    style: GoogleFonts.plusJakartaSans(
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
                                    "Owner",
                                    style: GoogleFonts.plusJakartaSans(
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
                                  style: GoogleFonts.plusJakartaSans(
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product list",
                            style: GoogleFonts.nunito(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              color: const Color(0xFF1E2022),
                            ),
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 15.0),
                                    width: 60,
                                    height: 60,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: const Color(0xFFF4F4F4)),
                                    child: SvgPicture.asset(
                                        "assets/images/box.svg"),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Sofa",
                                        style: GoogleFonts.nunito(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFF1F1F1F)),
                                      ),
                                      Text(
                                        "2 m",
                                        style: GoogleFonts.nunito(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFFC4C4C4)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 15.0),
                                    width: 60,
                                    height: 60,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: const Color(0xFFF4F4F4)),
                                    child: SvgPicture.asset(
                                        "assets/images/box.svg"),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Sofa",
                                        style: GoogleFonts.nunito(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFF1F1F1F)),
                                      ),
                                      Text(
                                        "3 m",
                                        style: GoogleFonts.nunito(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFFC4C4C4)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
