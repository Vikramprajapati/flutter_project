import 'package:flutter/material.dart';



void main()
{
  runApp(PermissionScreen());
}

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  // Future<void> _requestCameraPermission(BuildContext context) async {
  //   PermissionStatus status = await Permission.camera.request();
  //   if(status.isGranted)
  //     {
  //       print("permission granted");
  //     }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission Handling'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
          //  _requestCameraPermission(context);
          }, child: Text("Camera Permission")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {}, child: Text("Microphone Permission")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Location Permission")),
        ],
      )),
    );
  }
}
