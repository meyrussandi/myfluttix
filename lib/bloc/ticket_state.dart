part of 'ticket_bloc.dart';

 class TicketState extends Equatable {
   final List<TicketModel> tickets;
  TicketState(this.tickets);

  @override
  List<Object> get props => [tickets];
}
