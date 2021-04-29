part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  final TicketModel ticketModel;
  final MyFluttixTransactionModel myFluttixTransactionModel;

  SuccessPage(this.ticketModel, this.myFluttixTransactionModel);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return;
        },
        child: Scaffold(
          body: FutureBuilder(
              future: ticketModel != null
                  ? processingTicketOrder(context)
                  : processingTopUp(context),
              builder: (_, snapshot) => (snapshot.connectionState ==
                      ConnectionState.done)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 150,
                            width: 150,
                            child: Icon(Icons.check_circle_outline_outlined,
                                size: 50, color: purpleMainColor)),
                        Text(
                            ticketModel == null
                                ? "Top Up Success!"
                                : "Happy Watching!",
                            style: blackTextFont.copyWith(fontSize: 20)),
                        SizedBox(height: 16),
                        Text(
                            ticketModel == null
                                ? "You have successfully\ntop up wallet"
                                : "You have successfully\nbought the ticket",
                            textAlign: TextAlign.center,
                            style: blackTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w300)),
                        Container(
                          height: 50,
                          width: 250,
                          margin: EdgeInsets.only(top: 70, bottom: 30),
                          child: ElevatedButton(
                            onPressed: () {
                              if(ticketModel == null){
                                context.read<PageBloc>().add(GoToWalletPage(GoToMainPage(bottomNavBar: 0)));
                              }else{
                                context.read<PageBloc>().add(GoToMainPage(bottomNavBar: 1));

                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: purpleMainColor),
                            child: Text(
                                ticketModel == null
                                    ? "My Wallet"
                                    : "My Tickets",
                                style: whiteTextFont.copyWith(fontSize: 20)),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Discovery new movie? ",
                                  style: greyTextFont.copyWith(
                                      fontWeight: FontWeight.w400)),
                              InkWell(
                                onTap: () {
                                  context.read<PageBloc>().add(GoToMainPage());
                                },
                                child: Text("Back to home ",
                                    style: purpleTextFont.copyWith(
                                        fontWeight: FontWeight.w400)),
                              ),
                            ]),
                      ],
                    )
                  : Center(
                      child: SpinKitFadingCircle(
                        color: purpleMainColor,
                        size: 50,
                      ),
                    )),
        ));
  }

  Future<void> processingTicketOrder(BuildContext context) async {
    context.read<UserBloc>().add(Purchase(ticketModel.totalPrice));
    context
        .read<TicketBloc>()
        .add(BuyTicket(ticketModel, myFluttixTransactionModel.userID));

    await MyFluttixTransactionServices.saveTransaction(
        myFluttixTransactionModel);
  }

  Future<void> processingTopUp(BuildContext context) async {
    context.read<UserBloc>().add(TopUp(myFluttixTransactionModel.amount));

    await MyFluttixTransactionServices.saveTransaction(
        myFluttixTransactionModel);
  }
}
