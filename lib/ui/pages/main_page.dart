part of "pages.dart";

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) => (userState is UserLoaded)
                    ? Text(userState.userModel.name)
                    : SizedBox()),
            ElevatedButton(
                onPressed: () {
                  AuthServices.signOut();
                },
                child: Text("Sign Out")),
          ],
        ),
      ),
    );
  }
}
