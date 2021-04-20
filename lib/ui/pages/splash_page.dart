part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://image.flaticon.com/icons/png/512/3004/3004234.png",
                  height: 138,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "New Experience",
                  style: blackTextFont.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Watch a new movie easier\nthan any before",
                  textAlign: TextAlign.center,
                  style: greyTextFont.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(primary: purpleMainColor),
                    child: Text("Get Started", style: whiteTextFont.copyWith(fontSize: 20),),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Already have an Account? ", style: greyTextFont.copyWith(fontSize: 16),),
                  InkWell(
                      onTap: (){
                        context.read<PageBloc>().add(GoToLoginPage());
                      },
                      child: Text("Sign In ",style: purpleTextFont.copyWith(fontSize: 18)))
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
