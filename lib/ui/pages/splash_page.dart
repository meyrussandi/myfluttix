part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          },
          child: Text("Go To Sign In Page"),
        ),
      ),
    );
  }
}