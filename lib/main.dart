import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:bhagwat_gita_app/home_page.dart';
// import 'package:alan_voice/alan_voice.dart';

void main() {
  // AlanVoice.addButton(
  //   "aa52753a16404b7fcf69d3be5eed61172e956eca572e1d8b807a3e2338fdd0dc/stage",
  //   buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Wellness with Gita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<PaletteGenerator>(
        future: _generatePalette(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Text('Error loading palette');
          } else {
            final dominantColor = snapshot.data!.dominantColor?.color;

            return AnimatedSplashScreen(
              splash: Image.asset('assets/logo.png',
                  width: 800.0, // Adjust the width as needed
                  height: 800.0, // Adjust the height as needed
                  fit: BoxFit.contain), // Optional, adjust the fit as needed
              nextScreen: const HomePage(),
              splashTransition: SplashTransition.rotationTransition,
              backgroundColor: dominantColor ?? Colors.deepPurple,
            );
          }
        },
      ),
    );
  }

  Future<PaletteGenerator> _generatePalette(BuildContext context) async {
    return await PaletteGenerator.fromImageProvider(
      AssetImage('assets/logo.png'),
    );
  }
}
