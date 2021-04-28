part of 'pages.dart';

class TopUpPage extends StatefulWidget {
  final PageEvent pageEvent;

  TopUpPage(this.pageEvent);

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  TextEditingController amountController = TextEditingController(text: "IDR 0");

  @override
  Widget build(BuildContext context) {
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
                    controller: amountController,
                    decoration: InputDecoration(
                        labelStyle: greyTextFont,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Amount"),
                  ),
                ]),
              )
            ],
          ),
        ],
      )),
    );
  }
}
