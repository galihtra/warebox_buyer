import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


import 'package:warebox_buyer/pages/product_list_detail/custom_history/custom_history.dart';


class productListDetail extends StatefulWidget {
  const productListDetail({super.key});

  @override
  State<productListDetail> createState() => _productListDetailState();
}

class _productListDetailState extends State<productListDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sofa",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF11A6A1),
                      )),
                  Container(
                    height: 169,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Image.asset("assets/images/sofa.png"),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: const Color(0xFFF2F5F9),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Space used",
                          style: GoogleFonts.nunito(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF1F1F1F)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          // Set the background color to be transparent
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF2E9496),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: LinearPercentIndicator(
                            width: 276,
                            lineHeight: 34,
                            animation: true,
                            percent: 0.5,
                            animationDuration: 1000,
                            center: Text(
                              "2 m2",
                              style: GoogleFonts.nunito(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            progressColor: const Color(0xFF2E9496),
                            barRadius: const Radius.circular(12.0),
                            backgroundColor: Colors.transparent,
                            padding: EdgeInsets.all(2.0),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good history",
                          style: GoogleFonts.nunito(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        CustomHistoryCard(
                          history: "Sent by sender", 
                          month: "Sep", 
                          day: "13"
                        ),
                        CustomHistoryCard(
                          history: "Arrived in warehouse", 
                          month: "Sep", 
                          day: "14"
                        ),
                        CustomHistoryCard(
                          history: "Receive by Galih", 
                          month: "Sep", 
                          day: "15"
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
