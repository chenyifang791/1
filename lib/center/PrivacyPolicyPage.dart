import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00008B), Color(0xFF87CEEB)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 24,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Yuandong Sports',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00008B),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '1. Information We Collect',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00008B),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We collect information you provide directly to us and information generated as you use our services. This includes but is not limited to:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8),
            Text(
              '1. Your personal information, such as name and email address.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            Text(
              '2. Usage information, such as browsing history and search queries.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            Text(
              '3. Location information, such as real-time location while using our services.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 16),
            Text(
              '2. How We Use Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00008B),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We use the information collected for the following purposes:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8),
            Text(
              '1. To provide and maintain our services.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            Text(
              '2. To improve and optimize our services.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            Text(
              '3. To analyze how users utilize our services to better serve them.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 16),
            Text(
              '3. Information Security',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00008B),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We take reasonable measures to protect your personal information, but please understand that no security measures are absolutely secure.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 16),
            Text(
              '4. Your Rights',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00008B),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'You have the right to access, correct, and delete your personal information. You can contact our customer service for specific methods.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 16),
            Text(
              '5. Contact Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00008B),
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.email, color: Color(0xFF00008B)),
                SizedBox(width: 8),
                Text(
                  'Email: support@yuandongtiyu.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, color: Color(0xFF00008B)),
                SizedBox(width: 8),
                Text(
                  'Address: Building 108, Anhua Jixiangli, Chaoyang District, Beijing, China Postal Code: 100010',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              '© 2024 Yuandong Sports. All rights reserved.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
