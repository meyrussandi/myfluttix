import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myfluttix/models/models.dart';
import 'package:myfluttix/services/services.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketState([]));

  @override
  Stream<TicketState> mapEventToState(
    TicketEvent event,
  ) async* {
    if(event is BuyTicket){
      await TicketServices.saveTicket(event.userID, event.ticketModel);

      List<TicketModel> tickets = state.tickets + [event.ticketModel];
      yield TicketState(tickets);
    }else if(event is GetTickets){
      List<TicketModel> tickets = await TicketServices.getTickets(event.userID);

      yield TicketState(tickets);
    }
  }
}
