import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:warebox_buyer/pages/home/image_slider/image_slider.dart';
import 'package:warebox_buyer/pages/home/warehouse_category/custom_category_button.dart';
import 'package:warebox_buyer/pages/home/warehouse_list/custom_warehouse_itemlist.dart';

import '../auth/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _searchController = TextEditingController();

  final List<String> imageList = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
    "assets/images/image2.jpg",
    "assets/images/image5.jpg",
  ];

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    String? userEmail = _auth.currentUser!.email;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: Align(
          alignment: const AlignmentDirectional(0.00, 0.00),
          child: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () {},
          ),
        ),
        title: Align(
          alignment: const AlignmentDirectional(0.00, 0.00),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
            child: Text(
              'Home',
              textAlign: TextAlign.start,
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 18.0, right: 18.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: const Color(0xFFFFFFFF),
                    ),
                    child: TextField(
                      controller: _searchController,
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
                          contentPadding: const EdgeInsets.only(left: 10.0, top: 12.0)
                        ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18.0, right: 18.0, top: 25.0, bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recomended Warehouse",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: const Color(0xFF1E2022),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 220,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0)),
                        child: CustomImageSlider(
                          imageList: imageList,
                          carouselController: _carouselController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(18, 5, 0, 0),
                        child: Text(
                          'Choose Your Category Warehouse',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1E2022),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Row(
                      children: [
                        CustomWarehouseItem(
                          imagePath: "assets/images/gudangUmum.png",
                          title1: "Gudang",
                          title2: "Umum",
                          onTap: () {
                            // Handle onTap action here
                          },
                        ),
                        CustomWarehouseItem(
                          imagePath: "assets/images/gudangKhusus.png",
                          title1: "Gudang",
                          title2: "Khusus",
                          onTap: () {
                            // Handle onTap action here
                          },
                        ),
                        CustomWarehouseItem(
                          imagePath: "assets/images/gudangDingin.png",
                          title1: "Gudang",
                          title2: "Dingin",
                          onTap: () {
                            // Handle onTap action here
                          },
                        ),
                        CustomWarehouseItem(
                          imagePath: "assets/images/gudangEcommerce.png",
                          title1: "Gudang",
                          title2: "Ecommerce",
                          onTap: () {
                            // Handle onTap action here
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, right: 18.0, top: 23, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Picks",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: const Color(0xFF1E2022),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // click action
                        },
                        child: Text(
                          "See All",
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                              color: const Color(0xFF11A6A1)),
                        ),
                      )
                    ],
                  ),
                ),
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CustomListItem(
                      imagePath: "assets/images/image4.jpg",
                      title: "Singgah Mampir",
                      location: "Batu Merah / Batam",
                      price: "Rp.100,000",
                      rating: "(4.8)",
                    ),
                    CustomListItem(
                      imagePath: "assets/images/image5.jpg",
                      title: "Reno Gudang",
                      location: "Batu Merah / Batam",
                      price: "Rp.100,000",
                      rating: "(4.8)",
                    )
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
