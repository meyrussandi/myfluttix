part of 'pages.dart';

class TicketDetailPage extends StatelessWidget {
  final TicketModel ticketModel;
  TicketDetailPage(this.ticketModel);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          context.read<PageBloc>().add(GoToMainPage());
          return;
        },
        child: Scaffold(
          backgroundColor: Color(0xffF6F7F9),
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView(children: [
                Column(children: [

                ],)
              ],)

          ),
        ));
  }
}
