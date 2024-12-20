import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart'; // Import the package
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentStep = 1;

  @override
  void initState() {
    super.initState();
    _simulateProgress();
  }

  // Simulate the progress over 3 seconds
  void _simulateProgress() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        currentStep = 2; // Update progress to 2
      });
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        currentStep = 4; // Update progress to 4
      });
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        currentStep = 6; // Update progress to full (6 steps)
      });
      // Navigate to HomeScreen once the progress is complete
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display logo image
            Image.asset("assets/images/logo.png"),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: LinearProgressBar(
                maxSteps: 6, // Total steps for the progress bar
                currentStep: currentStep, // Current step that is updated
                progressType: LinearProgressBar.progressTypeLinear,
                minHeight: 16, // Height of the progress bar
                progressColor: Colors.red, // Color of the progress bar
                backgroundColor: Colors.grey, // Background color of the progress bar
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
            ),
          ],
        ),
      ),
    );
  }
}
