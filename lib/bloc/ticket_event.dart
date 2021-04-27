part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();
}

class GetTickets extends TicketEvent {
  final String userID;
  GetTickets(this.userID);
  @override
  List<Object> get props => [userID];
}

class BuyTicket extends TicketEvent {
  final TicketModel ticketModel;
  final String userID;

  BuyTicket(this.ticketModel, this.userID);
  @override
  List<Object> get props => [ticketModel, userID];
}
