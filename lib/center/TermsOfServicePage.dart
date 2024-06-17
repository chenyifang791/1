import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms of Service',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00008B), Color(0xFF87CEEB)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 24),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white, size: 24),
            onPressed: () {},
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Yuandong Sports',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Thank you for using our app. Please read the following terms of service carefully before using our services.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(height: 24),
            _buildSectionTitle('1. Acceptance of Terms'),
            _buildSectionContent(
                'By accessing and using Yuandong Sports, you indicate that you have read, understood, and agreed to comply with these terms of service. If you do not agree with these terms, please do not use our services.'),
            SizedBox(height: 24),
            _buildSectionTitle('2. Service Description'),
            _buildSectionContent(
                'Yuandong Sports, through an AI Q&A system, helps users solve various sports-related issues. We strive to provide accurate and up-to-date information but cannot guarantee the absolute accuracy of all content.'),
            SizedBox(height: 24),
            _buildSectionTitle('3. User Obligations'),
            _buildSectionContent(
                'Users must comply with all applicable laws and regulations when using this app. Users must not engage in any illegal activities or infringe upon the rights of others using this app.'),
            SizedBox(height: 24),
            _buildSectionTitle('4. Privacy Policy'),
            _buildSectionContent(
                'We highly value user privacy protection. Please read our privacy policy to understand how we collect, use, and protect your personal information.'),
            SizedBox(height: 24),
            _buildSectionTitle('5. Intellectual Property'),
            _buildSectionContent(
                'All content on Yuandong Sports, including but not limited to text, images, icons, buttons, databases, and software, is protected by intellectual property laws. Users may not copy, modify, distribute, or publicly display this content without authorization.'),
            SizedBox(height: 24),
            _buildSectionTitle('6. Disclaimer'),
            _buildSectionContent(
                'Yuandong Sports is not liable for any direct, indirect, incidental, special, or consequential damages arising from the use or inability to use this service. We make no guarantees about the accuracy, completeness, or availability of information or services provided by any third parties.'),
            SizedBox(height: 24),
            _buildSectionTitle('7. Changes to Terms'),
            _buildSectionContent(
                'We reserve the right to modify these terms of service at any time. The revised terms will be effective immediately upon posting on this page. Please check this page regularly for updates.'),
            SizedBox(height: 24),
            _buildSectionTitle('8. Contact Us'),
            _buildSectionContent(
                'If you have any questions or comments about these terms of service, please contact us at:'),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.email, color: Colors.blue.shade800),
                SizedBox(width: 8),
                Text(
                  'support@yuandong.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.blue.shade800),
                SizedBox(width: 8),
                Text(
                  'Building 108, Anhua Jixiangli, Chaoyang District, Beijing, China Postal Code: 100010',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue.shade600,
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade800,
      ),
    );
  }
}
