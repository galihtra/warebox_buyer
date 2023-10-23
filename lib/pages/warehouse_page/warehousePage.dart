import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:warebox_buyer/pages/warehouse_page/warehouse_list/warehouse_list.dart';
import 'package:warebox_buyer/pages/home/search_input/search_input.dart';
import 'package:warebox_buyer/pages/navbar/navbar.dart';

class warehousePage extends StatefulWidget {
  const warehousePage({super.key});

  @override
  State<warehousePage> createState() => _warehousePageState();
}

class _warehousePageState extends State<warehousePage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: Align(
          alignment: const AlignmentDirectional(0.00, 0.00),
          child: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
        title: Align(
          alignment: const AlignmentDirectional(0.00, 0.00),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
            child: Text(
              'My Warehouses',
              textAlign: TextAlign.start,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      drawer: Navbar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SearcInput(
              searchController: _searchController
            ),
            Column(
              children: [
               ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  WarehouseListItem(
                    imagePath: "assets/images/image2.jpg", 
                    title: "Joyonoro", 
                    location: "Batu Merah/Batam", 
                    action: "Active",
                    isActive: true,
                  ),
                  WarehouseListItem(
                    imagePath: "assets/images/image1.jpg", 
                    title: "Singgah Mampir", 
                    location: "Batu Merah/Batam",  
                    action: "Inactive",
                    isActive: false,
                  )
                ],
               )
              ]
            )
          ],
        ),
      )),
    );
  }
}
