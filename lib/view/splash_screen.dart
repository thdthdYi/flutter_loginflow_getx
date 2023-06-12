import "package:flutter/material.dart";

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        //넓이 최대 > 가운데 정렬
        width: MediaQuery.of(context).size.width,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Splash_Screen'),
            SizedBox(
              height: 16.0,
            ),
            CircularProgressIndicator(
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
