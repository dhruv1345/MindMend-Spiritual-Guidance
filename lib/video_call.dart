import 'package:bhagwat_gita_app/constants.dart';
import 'package:bhagwat_gita_app/login.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class MyCall extends StatelessWidget {
  const MyCall({super.key, required this.callID});

  final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID: MyConst
            .appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: MyConst
            .appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: MyLogin.userId,
        userName: MyLogin.name,
        callID: callID,
        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall());
  }
}

// import 'package:bhagwat_gita_app/constants.dart';
// import 'package:bhagwat_gita_app/login.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

// class MyCall extends StatefulWidget {
//   const MyCall({Key? key, required this.callID}) : super(key: key);

//   final String callID;

//   @override
//   _MyCallState createState() => _MyCallState();
// }

// class _MyCallState extends State<MyCall> {
//   late final FirebaseMessaging _firebaseMessaging;

//   @override
//   void initState() {
//     super.initState();

//     _firebaseMessaging = FirebaseMessaging.instance;
//     _firebaseMessaging.subscribeToTopic(widget.callID);

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       // Handle incoming FCM messages when the app is in the foreground
//       print("onMessage: $message");

//       // You can extract information from the message and show a notification
//       // or update the UI accordingly.
//       // For example, you might show a Snackbar or push a local notification.
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       // Handle when the app is launched by tapping the notification
//       print("onLaunch: $message");
//     });

//     FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

//     // Note: `onResume` is not available on iOS, so we use `onLaunch` for both scenarios
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       // Handle when the app is resumed from a terminated state by tapping the notification
//       print("onResume/onLaunch: $message");
//     });
//   }

//   Future<void> _handleBackgroundMessage(RemoteMessage message) async {
//     // Handle FCM messages when the app is in the background
//     print("onBackgroundMessage: $message");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ZegoUIKitPrebuiltCall(
//       appID: MyConst.appId,
//       appSign: MyConst.appSign,
//       userID: MyLogin.userId,
//       userName: MyLogin.name,
//       callID: widget.callID,
//       config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
//     );
//   }
// }
