part of 'models.dart';

class TicketModel extends Equatable {
  final MovieDetailModel movieDetailModel;
  final TheaterModel theater;
  final DateTime time;
  final String bookingCode;
  final List<String> seats;
  final String name;
  final int totalPrice;

  TicketModel(this.movieDetailModel, this.theater, this.time, this.bookingCode,
      this.seats, this.name, this.totalPrice);

  TicketModel copyWith(
          {MovieDetailModel movieDetailModel,
          TheaterModel theaterModel,
          DateTime time,
          String bookingCode,
          List<String> seats,
          String name,
          int totalPrice}) =>
      TicketModel(
          movieDetailModel ?? this.movieDetailModel,
          theaterModel ?? this.theater,
          time ?? this.time,
          bookingCode ?? this.bookingCode,
          seats ?? this.seats,
          name ?? this.name,
          totalPrice ?? this.totalPrice);

  String get seatsInString{
    String s = '';
    for(var seat in seats){
      s += seat + ((seat != seats.last)? ", ":"");
    }

    return s;
  }

  @override
  List<Object> get props =>
      [movieDetailModel, theater, time, bookingCode, seats, name, totalPrice];
}
