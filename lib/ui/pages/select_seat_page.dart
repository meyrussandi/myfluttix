part of 'pages.dart';

class SelectSeatPage extends StatefulWidget {
  final TicketModel ticketModel;
  SelectSeatPage(this.ticketModel);
  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  List<String> selectedSeats = [];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .read<PageBloc>()
              .add(GoToSelectSchedulePage(widget.ticketModel.movieDetailModel));
          return;
        },
        child: Scaffold(
            body: Stack(
          children: [
            Container(
              color: purpleAccentColor,
            ),
            SafeArea(
              child: Container(color: Colors.white),
            ),
            ListView(
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: defaultMargin),
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black.withOpacity(0.04)),
                          child: InkWell(
                              onTap: () {
                                context.read<PageBloc>().add(
                                    GoToSelectSchedulePage(
                                        widget.ticketModel.movieDetailModel));
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black)),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, right: defaultMargin),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 16),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    widget.ticketModel.movieDetailModel.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    style: blackTextFont.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(imageBaseURL +
                                            "w154" +
                                            widget.ticketModel.movieDetailModel
                                                .posterPath))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //NOTE : CINEMA SCREEN
                    Container(
                      width: 277,
                      margin: EdgeInsets.only(top: 30),
                      height: 84,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/screen.png"))),
                    ),

                    //NOTE: SEATS
                    generateSeats(),

                    // NOTE; NEXT BUTTON
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 30, bottom: 50),
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: selectedSeats.length > 0
                                  ? purpleMainColor
                                  : Color(0xffE4E4E4)),
                          onPressed: selectedSeats.length > 0
                              ? () {
                                  context.read<PageBloc>().add(GoToCheckoutPage(
                                      widget.ticketModel
                                          .copyWith(seats: selectedSeats)));
                                }
                              : null,
                          child: Text(
                            "NEXT",
                            style: whiteTextFont.copyWith(fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        )));
  }

  Column generateSeats() {
    List<int> numberOfSeats = [4, 6, 6,6, 6, 6];
    List<Widget> widgets = [];

    for (int i = 0; i < numberOfSeats.length; i++) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            numberOfSeats[i],
            (index) => Padding(
                  padding: EdgeInsets.only(
                      right: index < numberOfSeats[i] - 1 ? 16 : 0, bottom: 16),
                  child: SelectableBox(
                    "${String.fromCharCode(i + 65)}${index + 1}",
                    width: 40,
                    height: 40,
                    textStyle: whiteNumberFont.copyWith(color: Colors.black),
                    isSelected: selectedSeats
                        .contains("${String.fromCharCode(i + 65)}${index + 1}"),
                    onTap: () {
                      String seatNumber =
                          "${String.fromCharCode(i + 65)}${index + 1}";
                      setState(() {
                        if (selectedSeats.contains(seatNumber)) {
                          selectedSeats.remove(seatNumber);
                        } else {
                          selectedSeats.add(seatNumber);
                        }
                      });
                    },
                  ),
                )),
      ));
    }

    return Column(
      children: widgets,
    );
  }
}
