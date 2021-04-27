part of 'services.dart';

class TicketServices {
  static CollectionReference ticketCollection =
      FirebaseFirestore.instance.collection("tickets");

  static Future<void> saveTicket(String idUser, TicketModel ticketModel) async {
    await ticketCollection.doc().set({
      "movieID": ticketModel.movieDetailModel.id ?? "",
      "userID": idUser ?? "",
      "theaterName": ticketModel.theater.name ?? 0,
      "time": ticketModel.time.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
      'bookingCode': ticketModel.bookingCode,
      "seats": ticketModel.seatsInString,
      "name": ticketModel.name,
      "totalPrice": ticketModel.totalPrice
    });
  }

  static Future<List<TicketModel>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.get();
    var documents =
        snapshot.docs.where((element) => element.data()["userID"] == userId);

    List<TicketModel> tickets = [];
    for (var element in documents) {
      MovieDetailModel movieDetailModel =
          await MovieServices.getMovieDetail(element.data()["movieID"]);
      tickets.add(TicketModel(
          movieDetailModel,
          TheaterModel(element.data()["theaterName"]),
          DateTime.fromMillisecondsSinceEpoch(element.data()["time"]),
          element.data()["bookingCode"],
          element.data()["seats"].toString().split(','),
          element.data()['name'],
          element.data()['totalPrice']));
    }

    return tickets;
  }
}
