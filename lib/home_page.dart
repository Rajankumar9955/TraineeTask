import 'package:flutter/material.dart';
import 'package:trainee/data/session_manager.dart';
import 'package:trainee/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child:  Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: ListView(
          padding:  EdgeInsets.fromLTRB(16, 16, 16, 120), 
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
              
                Icon(Icons.arrow_back_ios_new, size: 20),
                TextButton(
                       onPressed: () {
                        if(SessionManager.getToken()!=null){
                          SessionManager.logOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('You are not logged in')),
                          );
                        }
                       },
                       style: TextButton.styleFrom(
                         foregroundColor: Colors.white,      
                         backgroundColor: Colors.red,       
                         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(12),
                         ),
                       ),
                       child: const Text(
                         "Submit",
                         style: TextStyle(fontSize: 16),
                       ),
                     ),
                Icon(Icons.search, size: 24),
              ],
            ),
             SizedBox(height: 24),
             Text(
              "Hi-Fi Shop & Service",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 6),
             Text(
              "Audio shop on Rustaveli Ave 57.\nThis shop offers both products and services",
              style: TextStyle(color: Colors.grey),
            ),
             SizedBox(height: 24),

       
            _buildSectionHeader("Products", 41),
             SizedBox(height: 12),
            _buildGrid([
              _buildGridItem(
                imagePath: "assets/th.jpg",
                title: "AKG N700NCM2 Wireless",
                price: "\$199.00",
              ),
              _buildGridItem(
                imagePath: "assets/thh.jpg",
                title: "AIAIAI TMA-2 Modular",
                price: "\$250.00",
              ),
            ]),

             SizedBox(height: 24),

      
            _buildSectionHeader("Accessories", 19),
             SizedBox(height: 12),
            _buildGrid([
              _buildGridItem(
                imagePath: "assets/preview_1.jpg",
                title: "AIAIAI 3.5mm Jack 2m",
                price: "\$25.00",
                availability: "Available",
                isAvailable: true,
              ),
              _buildGridItem(
                imagePath: "assets/aw220224.png",
                title: "AIAIAI 3.5mm Jack 1.5m",
                price: "\$15.00",
                availability: "Unavailable",
                isAvailable: false,
              ),
            ]),
          ],
        ),
      ),
    );
  }


  Widget _buildSectionHeader(String title, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title $count",
          style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
         Text(
          "Show all",
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }


  Widget _buildGrid(List<Widget> children) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.78,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: children,
    );
  }


  Widget _buildGridItem({
    required String imagePath,
    required String title,
    required String price,
    String? availability,
    bool? isAvailable,
  }) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color:  Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(16),
          ),
          padding:  EdgeInsets.all(12),
          child: Column(
            children: [
               SizedBox(height: 8),
              Image.asset(imagePath, width: 70, height: 70, fit: BoxFit.contain),
               SizedBox(height: 2),
              Text(
                title,
                style:  TextStyle(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
               SizedBox(height: 8),
              if (availability != null)
                Text(
                  availability,
                  style: TextStyle(
                    color: isAvailable! ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              if (availability != null)  SizedBox(height: 6),
              Text(price, style:  TextStyle(fontSize: 14)),
            ],
          ),
        ),
         Positioned(
          top: 8,
          right: 8,
          child: Icon(Icons.delete_outline),
        ),
      ],
    );
  }
}
