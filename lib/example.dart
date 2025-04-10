import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
void main()
{
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {

  Future<void> launchWebsite(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }
  Future<void> sendSMS(String phoneNumber, String message) async {
    final Uri smsUri = Uri(scheme: 'sms', path: phoneNumber, queryParameters: {'body': message});
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      throw 'Could not launch $smsUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
        appBar: AppBar(title: Text('Launcher Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => makePhoneCall('1234567890'),
                child: Text('Make a Call'),
              ),
              ElevatedButton(
                onPressed: () => sendSMS('1234567890', 'Hello from Flutter!'),
                child: Text('Send SMS'),
              ),
              ElevatedButton(
                onPressed: () => launchWebsite('https://flutter.dev'),
                child: Text('Open Flutter Website'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}