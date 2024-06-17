import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
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
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white, size: 24),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: deepBlue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'If you have any questions or suggestions, please feel free to contact us. We will get back to you as soon as possible.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            ContactInfo(
              icon: Icons.email,
              title: 'Email',
              content: 'support@yuandongtiyu.com',
            ),
            ContactInfo(
              icon: Icons.phone,
              title: 'Phone',
              content: '+86 18699565548',
            ),
            ContactInfo(
              icon: Icons.location_on,
              title: 'Address',
              content:
                  'Building 108, Anhua Jixiangli, Chaoyang District, Beijing, China Postal Code: 100010',
            ),
            SizedBox(height: 40),
            Text(
              'We look forward to your feedback',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: deepBlue.withOpacity(0.8),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Please contact us through the above methods, and we will get back to you as soon as possible.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  const ContactInfo({
    Key? key,
    required this.icon,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: deepBlue,
            size: 30,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: deepBlue.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 5),
              Text(
                content,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const Color deepBlue = Color(0xFF0D47A1);
