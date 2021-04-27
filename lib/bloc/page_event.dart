part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSignUpPage extends PageEvent {
  final RegistrationData registrationData;
  GoToSignUpPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData registrationData;
  GoToPreferencePage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData registrationData;
  GoToAccountConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToMovieDetailPage extends PageEvent {
  final MovieModel movieModel;
  GoToMovieDetailPage(this.movieModel);

  @override
  List<Object> get props => [movieModel];
}

class GoToSelectSchedulePage extends PageEvent {
  final MovieDetailModel movieDetailModel;

  GoToSelectSchedulePage(this.movieDetailModel);
  @override
  List<Object> get props => [movieDetailModel];
}

class GoToSelectSeatPage extends PageEvent{
  final TicketModel ticketModel;
  GoToSelectSeatPage(this.ticketModel);

  @override
  List<Object> get props => [ticketModel];

}

class GoToCheckoutPage extends PageEvent{
  final TicketModel ticketModel;
  GoToCheckoutPage(this.ticketModel);
  @override
  List<Object> get props => [ticketModel];

}

class GoToSuccessPage extends PageEvent{
  final TicketModel ticketModel;
  final MyFluttixTransactionModel myFluttixTransactionModel;

  GoToSuccessPage(this.ticketModel, this.myFluttixTransactionModel);
  @override
  List<Object> get props => [ticketModel, myFluttixTransactionModel];
}
