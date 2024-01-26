import 'package:bhagwat_gita_app/login.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final buttonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    minimumSize: const Size(double.infinity, 48.0),
  );

  void launchWhatsApp() async {
    const phoneNumber =
        '+919958324711'; // Replace with the actual WhatsApp number
    final Uri whatsappLaunchUri = Uri.parse('https://wa.me/$phoneNumber');

    if (await canLaunch(whatsappLaunchUri.toString())) {
      await launch(whatsappLaunchUri.toString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Could not launch WhatsApp',
          ),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void launchGoogleForm() async {
    String googleFormUrl = 'https://forms.gle/ucwGNQEG1wLiJUMx6';

    if (await canLaunch(googleFormUrl)) {
      await launch(googleFormUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not launch Google Form'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void launchLinkedInCompanyPage() async {
    final linkedInCompanyPageUrl =
        Uri.parse('https://www.linkedin.com/company/mindmend4u/');

    if (await canLaunch(linkedInCompanyPageUrl.toString())) {
      await launch(linkedInCompanyPageUrl.toString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not launch LinkedIn Page'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contact Us",
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  launchGoogleForm();
                },
                icon: const Icon(Icons.web),
                label: const Text(
                  "Google Form",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                style: buttonStyle,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  launchLinkedInCompanyPage();
                },
                icon: const Icon(Icons.bookmark),
                label: const Text(
                  "LinkedIn Company",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                style: buttonStyle,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  launchWhatsApp();
                },
                icon: const Icon(Icons.chat),
                label: const Text(
                  "Chat on Whatsapp",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                style: buttonStyle,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MyLogin()));
                },
                icon: const Icon(Icons.call),
                label: const Text(
                  "Schedule a Video Call",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                style: buttonStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
