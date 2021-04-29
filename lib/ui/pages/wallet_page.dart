part of 'pages.dart';

class WalletPage extends StatelessWidget {
  final PageEvent pageEvent;

  WalletPage(this.pageEvent);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(pageEvent);
        return;
      },
      child: Scaffold(
          body: Stack(
        children: [
          Container(color:purpleAccentColor),
          SafeArea(child: Container(
            color: Colors.white,
          ),),
          // NOTE : CONTENT
          SafeArea(
            child: Container(
                margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
                child: ListView(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top:20),
                          child: InkWell(
                              onTap: () {
                                context.read<PageBloc>().add(pageEvent);
                              },
                              child: Icon(Icons.arrow_back, color: Colors.black)),
                        ),
                        BlocBuilder<UserBloc, UserState>(
                            builder: (context, userState) {
                          return Column(
                            children: [
                              SizedBox(height:20),
                              Text("My Wallet",
                                  style: blackTextFont.copyWith(fontSize: 20)),
                              Container(
                                height: 185,
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(vertical: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xff382A74),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54,
                                          blurRadius: 10,
                                          spreadRadius: 0,
                                          offset: Offset(0, 5))
                                    ]),
                                child: Stack(
                                  children: [
                                    ClipPath(
                                      clipper: CardReflectionClipper(),
                                      child: Container(
                                          height: 185,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomRight,
                                              end: Alignment.topLeft,
                                              colors: [
                                                Colors.white.withOpacity(0.1),
                                                Colors.white.withOpacity(0)
                                              ],
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xffFFF2CB)),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: yellowColor),
                                              )
                                            ],
                                          ),
                                          Text(
                                            NumberFormat.currency(
                                                    locale: 'id_ID',
                                                    symbol: "IDR ",
                                                    decimalDigits: 0)
                                                .format((userState as UserLoaded)
                                                    .userModel
                                                    .balance),
                                            style: whiteNumberFont.copyWith(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Card Holder",
                                                    style: greyTextFont.copyWith(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                  SizedBox(
                                                    width: (MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            4 * defaultMargin) /
                                                        2,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                            width: (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    4 * defaultMargin -
                                                                    30 -
                                                                    14) /
                                                                2,
                                                            child: Text(
                                                              (userState
                                                                      as UserLoaded)
                                                                  .userModel
                                                                  .name,
                                                              style: whiteTextFont
                                                                  .copyWith(
                                                                      fontSize:
                                                                          12),
                                                              maxLines: 1,
                                                              textAlign:
                                                                  TextAlign.start,
                                                            )),
                                                        Icon(
                                                          Icons
                                                              .check_circle_outline_sharp,
                                                          color:
                                                              Colors.greenAccent,
                                                          size: 14,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Card ID",
                                                    style: greyTextFont.copyWith(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        (userState as UserLoaded)
                                                            .userModel
                                                            .id
                                                            .substring(0, 10)
                                                            .toUpperCase(),
                                                        style: whiteNumberFont
                                                            .copyWith(
                                                                fontSize: 12),
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .check_circle_outline_sharp,
                                                        color: Colors.greenAccent,
                                                        size: 14,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Recent Transaction", style: blackTextFont,)),
                              SizedBox(height: 12,),
                              FutureBuilder(
                                future: MyFluttixTransactionServices.getTransaction((userState as UserLoaded).userModel.id),
                                builder: (context, snapshot){
                                  if(snapshot.connectionState == ConnectionState.done){
                                    return generateTransactionList(snapshot.data, MediaQuery.of(context).size.width - 2 *defaultMargin);
                                  }else{
                                    return SizedBox();
                                  }

                                }
                              ),
                              SizedBox(height: 75,)
                            ],
                          );
                        })
                      ],
                    ),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:
            Container(width: 250,height: 50,
            margin: EdgeInsets.only(bottom: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: purpleMainColor),
              onPressed: (){
                context.read<PageBloc>().add(GoToTopUpPage(GoToWalletPage(pageEvent)));
              },
              child: Text("Top Up My Wallet", style: whiteTextFont.copyWith(fontSize: 20),),
            ),
            )
            ,)
        ],
      )),
    );
  }

  Column generateTransactionList(List<MyFluttixTransactionModel> transaction,double width){
    transaction.sort((t1, t2)=> t2.time.compareTo(t1.time));
    return Column(
      children: transaction.map((e) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: TransactionCard(myFluttixTransactionModel: e,width: width,),
      )
      ).toList(),
    );
  }
}

class CardReflectionClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 15);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
