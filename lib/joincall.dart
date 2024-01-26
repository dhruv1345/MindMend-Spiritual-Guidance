import 'package:bhagwat_gita_app/video_call.dart';
import 'package:flutter/material.dart';

class JoinCall extends StatelessWidget {
  const JoinCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact through video call"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyCall(
                          callID: "1",
                        )));
              },
              child: const Text("Join Call"),
            ),
          ],
        ),
      ),
    );
  }
}
