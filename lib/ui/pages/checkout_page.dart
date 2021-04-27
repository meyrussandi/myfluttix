part of 'pages.dart';

class CheckoutPage extends StatefulWidget {
  final TicketModel ticketModel;
  CheckoutPage(this.ticketModel);
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    int total = 26500 * widget.ticketModel.seats.length;

    return WillPopScope(
        onWillPop: () async {
          context.read<PageBloc>().add(GoToSelectSeatPage(widget.ticketModel));
          return;
        },
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                color: purpleAccentColor,
              ),
              SafeArea(
                child: Container(
                  color: Colors.white,
                ),
              ),
              ListView(
                children: [
                  Stack(
                    children: [
                      //NOTE : BACK BUTTON
                      Row(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, left: defaultMargin),
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black.withOpacity(0.04)),
                            child: InkWell(
                                onTap: () {
                                  context.read<PageBloc>().add(
                                      GoToSelectSeatPage(widget.ticketModel));
                                },
                                child: Icon(Icons.arrow_back,
                                    color: Colors.black)),
                          ),
                        ],
                      ),

                      BlocBuilder<UserBloc, UserState>(
                        builder: (context, userState) {
                          UserModel userModel =
                              (userState as UserLoaded).userModel;
                          return Column(
                            children: [
                              // NOTE: TITLE
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  "Checkout\nMovie",
                                  style: blackTextFont.copyWith(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              //NOTE : MOVIE DESCRIPTION
                              Row(
                                children: [
                                  Container(
                                    width: 70,
                                    height: 90,
                                    margin: EdgeInsets.only(
                                        left: defaultMargin, right: 20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(imageBaseURL +
                                                "w342" +
                                                widget
                                                    .ticketModel
                                                    .movieDetailModel
                                                    .posterPath))),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                (2 * defaultMargin) -
                                                70 -
                                                20,
                                        child: Text(
                                          widget.ticketModel.movieDetailModel
                                              .title,
                                          style: blackTextFont.copyWith(
                                              fontSize: 18),
                                          maxLines: 2,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              (2 * defaultMargin) -
                                              70 -
                                              20,
                                          margin:
                                              EdgeInsets.symmetric(vertical: 6),
                                          child: Text(
                                            widget.ticketModel.movieDetailModel
                                                .genresAndLanguage,
                                            style: greyTextFont.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          )),
                                      RatingStars(
                                        voteAverage: widget.ticketModel
                                            .movieDetailModel.voteAverage,
                                        color: greyColor,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: defaultMargin, vertical: 20),
                                child: Divider(
                                  color: Color(0xffE4E4E4),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Order ID",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      widget.ticketModel.bookingCode,
                                      style: whiteNumberFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Cinema",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        child: Text(
                                          widget.ticketModel.theater.name,
                                          textAlign: TextAlign.end,
                                          style: whiteNumberFont.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Date & Time",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      widget.ticketModel.time.dateAndTime,
                                      style: whiteNumberFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Seat Number",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.55,
                                      child: Text(
                                        widget.ticketModel.seatsInString,
                                        textAlign: TextAlign.end,
                                        style: whiteNumberFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Price",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text("IDR 25.000 X ${widget.ticketModel.seats.length}",
                                      style: whiteNumberFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Fee",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "IDR 1.500 X ${widget.ticketModel.seats.length}",
                                      style: whiteNumberFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      NumberFormat.currency(locale: 'id_ID', decimalDigits: 0, symbol: "IDR ").format(total),
                                      style: whiteNumberFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: defaultMargin, vertical: 20),
                                child: Divider(
                                  color: Color(0xffE4E4E4),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Your Wallet",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      NumberFormat.currency(locale: 'id_ID', decimalDigits: 0, symbol: "IDR ").format(userModel.balance),
                                      style: whiteNumberFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: userModel.balance >= total?Color(0xff3E9D9D) : Color(0XFFFF5C83)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30, bottom: 50),
                                height: 50,
                                width: 250,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(primary: userModel.balance >= total?Color(0xff3E9D9D) : purpleMainColor),
                                  onPressed: (){
                                    if(userModel.balance >= total){
                                      //uang cukup
                                      MyFluttixTransactionModel transaction = MyFluttixTransactionModel(
                                        userID: userModel.id,
                                        title: widget.ticketModel.movieDetailModel.title,
                                        subTitle: widget.ticketModel.theater.name,
                                        time: DateTime.now(),
                                        amount: -total,
                                        picture: widget.ticketModel.movieDetailModel.posterPath
                                      );

                                      context.read<PageBloc>().add(GoToSuccessPage(widget.ticketModel.copyWith(totalPrice: total), transaction));
                                    }else{
                                      //uang tidak cukup
                                    }
                                  },
                                  child: Text(userModel.balance >= total?"Checkout" : "Top Up My Wallet", style: whiteTextFont.copyWith(fontSize: 20),),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
