import 'package:flutter/material.dart';
import 'package:warebox_buyer/pages/home/home_screen.dart';
import 'package:warebox_buyer/pages/profile/profile.dart';
import 'package:warebox_buyer/pages/warehouse_page/warehousePage.dart';
import 'package:google_fonts/google_fonts.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const warehousePage(),
    const  ProfileScreenWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF2E9496),
        selectedLabelStyle: GoogleFonts.nunito(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF797979)
        ), // Warna ikon ketika aktif
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/homeIcon.png")
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/myWarehouseIcon.png")
            ),
            label: 'My Warehouse',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/profileIcon.png")
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
