import 'package:flutter/material.dart';

import '/center/AboutUsPage.dart';
import '/center/ContactUsPage.dart';
import '/center/PrivacyPolicyPage.dart';
import '/center/TermsOfServicePage.dart';
import '/center/UsageHelpPage.dart';

class UserCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Center',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color(0xFF00008B),
                Color(0xFF87CEEB),
              ],
            ),
          ),
        ),
        toolbarHeight: 56.0,
      ),
      body: ListView(
        children: [
          Section(
            title: 'About',
            items: [
              SectionItem(
                title: 'About Us',
                icon: Icons.info,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()),
                  );
                },
              ),
              SectionItem(
                title: 'Usage Help',
                icon: Icons.help,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UsageHelpPage()),
                  );
                },
              ),
            ],
          ),
          Section(
            title: 'Contact Us',
            items: [
              SectionItem(
                title: 'Contact Us',
                icon: Icons.contact_mail,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactUsPage()),
                  );
                },
              ),
            ],
          ),
          Section(
            title: 'Privacy Policy',
            items: [
              SectionItem(
                title: 'Privacy Policy',
                icon: Icons.lock,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacyPolicyPage()),
                  );
                },
              ),
              SectionItem(
                title: 'Terms of Service',
                icon: Icons.description,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermsOfServicePage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List<SectionItem> items;

  Section({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...items,
        ],
      ),
    );
  }
}

class SectionItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  SectionItem({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
