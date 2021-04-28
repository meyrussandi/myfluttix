part of 'pages.dart';

class TopUpPage extends StatefulWidget {
  final PageEvent pageEvent;

  TopUpPage(this.pageEvent);

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  TextEditingController amountController = TextEditingController(text: "IDR 0");
  int selectedAmount = 0;

  @override
  Widget build(BuildContext context) {
    context.read<ThemeBloc>().add(
        ChangeTheme(ThemeData().copyWith(primaryColor: Color(0xffE4E4E4))));

    //width untuk 3 spase kartu
    double cardWidth =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 40) / 3;
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(widget.pageEvent);
        return;
      },
      child: Scaffold(
          body: ListView(
        children: [
          Stack(
            children: [
              // NOTE: BACK BUTTON
              SafeArea(
                  child: Container(
                      margin: EdgeInsets.only(left: defaultMargin, top: 20),
                      child: InkWell(
                          onTap: () async {
                            context.read<PageBloc>().add(widget.pageEvent);
                          },
                          child: Icon(Icons.arrow_back, color: Colors.black)))),

              // NOTE: CONTENT
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(children: [
                  SizedBox(height: 20),
                  Text("Top Up", style: blackTextFont.copyWith(fontSize: 20)),
                  SizedBox(height: 30),
                  TextField(
                    onChanged: (text) {
                      String temp = '';

                      for (int i = 0; i < text.length; i++) {
                        temp += text.isDigit(i) ? text[i] : '';
                      }

                      setState(() {
                        selectedAmount = int.tryParse(temp) ?? 0;
                      });

                      amountController.text = NumberFormat.currency(
                              locale: 'id_ID', symbol: "IDR ", decimalDigits: 0)
                          .format(selectedAmount);

                      amountController.selection = TextSelection.fromPosition(
                          TextPosition(offset: amountController.text.length));
                    },
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    decoration: InputDecoration(
                        labelStyle: greyTextFont,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Amount"),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 14),
                        child:
                            Text("Choose by template", style: blackTextFont)),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 14,
                    children: [
                      makeMoneyCard(amount: 50000, width: cardWidth),
                      makeMoneyCard(amount: 100000, width: cardWidth),
                      makeMoneyCard(amount: 150000, width: cardWidth),
                      makeMoneyCard(amount: 200000, width: cardWidth),
                      makeMoneyCard(amount: 250000, width: cardWidth),
                      makeMoneyCard(amount: 500000, width: cardWidth),
                      makeMoneyCard(amount: 1000000, width: cardWidth),
                      makeMoneyCard(amount: 1250000, width: cardWidth),
                      makeMoneyCard(amount: 5000000, width: cardWidth),
                    ],
                  ),
                  SizedBox(height: 100),
                  Container(
                      width: 250,
                      height: 50,
                      child: BlocBuilder<UserBloc, UserState>(
                          builder: (context, userState) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: purpleMainColor),
                              onPressed: (selectedAmount > 0)
                                  ? () {
                                      context.read<PageBloc>().add(GoToSuccessPage(
                                          null,
                                          MyFluttixTransactionModel(
                                              userID: (userState as UserLoaded)
                                                  .userModel
                                                  .id,
                                              amount: selectedAmount,
                                              title: "Top Up Wallet",
                                              subTitle:
                                                  "${DateTime.now().dayName}, ${DateTime.now().day} ${DateTime.now().monthName} ${DateTime.now().year}",
                                              time: DateTime.now())));
                                    }
                                  : null,
                              child: Text("Top Up Wallet",
                                  style:
                                      whiteTextFont.copyWith(fontSize: 20)))))
                ]),
              )
            ],
          ),
        ],
      )),
    );
  }

  MoneyCard makeMoneyCard({int amount, double width}) {
    return MoneyCard(
        amount: amount,
        width: width,
        isSelected: amount == selectedAmount,
        onTap: () {
          setState(() {
            if (selectedAmount != amount) {
              selectedAmount = amount;
            } else {
              selectedAmount = 0;
            }

            amountController.text = NumberFormat.currency(
                    locale: 'id_ID', decimalDigits: 0, symbol: "IDR ")
                .format(selectedAmount);

            amountController.selection = TextSelection.fromPosition(
                TextPosition(offset: amountController.text.length));
          });
        });
  }
}
