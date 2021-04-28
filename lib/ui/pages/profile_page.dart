part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  // final UserModel userModel;
  // ProfilePage(this.userModel);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>();
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: ListView(
                  children: [
                    BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                      if (userState is UserLoaded) {
                        UserModel userModel = userState.userModel;
                        return Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 74, bottom: 10),
                                width: 120,
                                height: 120,
                                child: Stack(
                                  children: [
                                    Center(
                                        child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitFadingCircle(
                                                color: purpleMainColor))),
                                    Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: (userModel
                                                            .profilePicture !=
                                                        "")
                                                    ? NetworkImage(userModel
                                                        .profilePicture)
                                                    : AssetImage(
                                                        "assets/user_pic.png"),
                                                fit: BoxFit.cover)))
                                  ],
                                )),
                            SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    2 * defaultMargin,
                                child: Text(userModel.name,
                                    style: blackTextFont.copyWith(fontSize: 18),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.clip)),
                            Container(
                              width: MediaQuery.of(context).size.width -
                                  2 * defaultMargin,
                              margin: EdgeInsets.only(top: 8, bottom: 30),
                              child: Text(
                                userModel.email,
                                style: greyTextFont.copyWith(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: SpinKitFadingCircle(
                              size: 50, color: purpleMainColor),
                        );
                      }
                    }),
                    Column(children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Divider(color: Colors.black)),
                      BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                        return InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 10),
                                Text("Edit Profile",
                                    style:
                                        blackTextFont.copyWith(fontSize: 16)),
                                Spacer(),
                                Icon(Icons.edit, size: 25),
                                SizedBox(width: 10),
                              ],
                            ));
                      }),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Divider(color: Colors.black)),
                      InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text("My Wallet",
                                  style: blackTextFont.copyWith(fontSize: 16)),
                              Spacer(),
                              Icon(Icons.account_balance_wallet,
                                  color: purpleMainColor, size: 25),
                              SizedBox(width: 10),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Divider(color: Colors.black)),
                      InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text("Change Language",
                                  style: blackTextFont.copyWith(fontSize: 16)),
                              Spacer(),
                              Icon(Icons.language,
                                  color: purpleMainColor, size: 25),
                              SizedBox(width: 10),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Divider(color: Colors.black)),
                      InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text("Help Center",
                                  style: blackTextFont.copyWith(fontSize: 16)),
                              Spacer(),
                              Icon(Icons.help_outline,
                                  color: purpleMainColor, size: 25),
                              SizedBox(width: 10),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Divider(color: Colors.black)),
                      InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text("Change Language",
                                  style: blackTextFont.copyWith(fontSize: 16)),
                              Spacer(),
                              Icon(Icons.rate_review_outlined,
                                  color: purpleMainColor, size: 25),
                              SizedBox(width: 10),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 16),
                          child: Divider(color: Colors.black)),
                      InkWell(
                          onTap: () {
                            context.read<UserBloc>().add(SignOut());
                            AuthServices.signOut();
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text("Sign Out",
                                  style: blackTextFont.copyWith(fontSize: 16)),
                              Spacer(),
                              Icon(MdiIcons.logout,
                                  color: purpleMainColor, size: 25),
                              SizedBox(width: 10),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 16),
                          child: Divider(color: Colors.black)),
                    ]),
                  ],
                )),
            SafeArea(
                child: Container(
              margin: EdgeInsets.only(top: 20, left: defaultMargin),
              child: GestureDetector(
                onTap: () {
                  context.read<PageBloc>().add(GoToMainPage());
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
