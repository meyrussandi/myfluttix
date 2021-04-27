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
                  : processingTopUp(),
              builder: (_, snapshot) =>
                  (snapshot.connectionState == ConnectionState.done)
                      ? ElevatedButton(
                          onPressed: () {
                            context.read<PageBloc>().add(GoToMainPage());
                          },
                          child: (Text("done")),
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

  Future<void> processingTopUp() async {}
}
