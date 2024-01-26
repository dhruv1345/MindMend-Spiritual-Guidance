import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Councelling extends StatefulWidget {
  const Councelling({Key? key}) : super(key: key);

  @override
  State<Councelling> createState() => _CouncellingState();
}

class _CouncellingState extends State<Councelling> {
  // Sample counselor data
  final List<Map<String, String>> counselorsData = [
    {
      'name': 'Adv. Kavya Budhiraja',
      'details': 'Youtuber | Being Krishna Conscious',
      'url': 'https://www.youtube.com/watch?v=C2sE8N6DwTg',
    },
    {
      'name': 'Medha Sharma',
      'details': 'Mental Health Practitioner | Building Communities',
      // 'url': 'https://example.com/medhasharma',
    },
    {
      'name': 'Dhruv Gupta',
      'details': 'Mental Health Startup Founder',
      'url': 'https://www.linkedin.com/in/dhruvgupta1312/',
    },
    {
      'name': 'Chhavi Jagota',
      'details':
          'Counselling Psychologist : Mental Health Practitioner : Counselling Service - Anxiety, Depression, Self-Awareness, Self-esteem, Relationships, Balancing life and work.',
      // 'url': 'https://example.com/chhavijagota',
    },
    {'name': 'Kshitija Ghan', 'details': 'Mental Health Practitioner'},
    {
      'name': 'Dr.Shalini Babbar',
      'details': 'Homoeopathic Physician and Mental Health Consultant',
      // 'url': 'https://example.com/drshalinibabbar',
    },
    {'name': 'Parika Bhatli', 'details': 'Mental Health Blogger'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counselors"),
      ),
      body: ListView.builder(
        itemCount: counselorsData.length,
        itemBuilder: (context, index) {
          return CounselorProfile(
            name: counselorsData[index]['name'] ?? '',
            details: counselorsData[index]['details'] ?? '',
            url: counselorsData[index]['url'],
          );
        },
      ),
    );
  }
}

class CounselorProfile extends StatelessWidget {
  final String name;
  final String details;
  final String? url;

  const CounselorProfile({
    Key? key,
    required this.name,
    required this.details,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(details),
                  if (url != null)
                    Text(
                      '$url',
                      style: TextStyle(fontSize: 15, color: Colors.deepPurple),
                    ),
                ],
              ),
            ),
            onTap: () {
              if (url != null) {
                // Open the URL when tapped
                // You can customize this based on your requirements
                launchURL(context, url!);
              } else {
                // Handle tap for counselor details if needed
              }
            },
          ),
        ),
      ),
    );
  }

  void launchURL(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not launch URL'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
