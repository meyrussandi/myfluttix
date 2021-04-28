part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignUpPage extends PageState {
  final RegistrationData registrationData;
  OnSignUpPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnPreferencePage extends PageState {
  final RegistrationData registrationData;
  OnPreferencePage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData registrationData;
  OnAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnMovieDetailPage extends PageState {
  final MovieModel movieModel;
  OnMovieDetailPage(this.movieModel);
  @override
  List<Object> get props => [movieModel];
}

class OnSelectSchedulePage extends PageState {
  final MovieDetailModel movieDetailModel;

  OnSelectSchedulePage(this.movieDetailModel);
  @override
  List<Object> get props => [movieDetailModel];
}

class OnSelectSeatPage extends PageState{
  final TicketModel ticketModel;

  OnSelectSeatPage( this.ticketModel);
  @override
  List<Object> get props => [ticketModel];

}

class OnCheckoutPage extends PageState{
  final TicketModel ticketModel;
  OnCheckoutPage(this.ticketModel);
  @override
  List<Object> get props => [ticketModel];

}

class OnSuccessPage extends PageState{
  final TicketModel ticketModel;
  final MyFluttixTransactionModel myFluttixTransactionModel;

  OnSuccessPage(this.ticketModel, this.myFluttixTransactionModel);
  @override
  List<Object> get props => [ticketModel, myFluttixTransactionModel];
}

class OnTicketDetailPage extends PageState{
  final TicketModel ticketModel;
  OnTicketDetailPage(this.ticketModel);
  @override
  List<Object> get props => [ticketModel];

}

class OnProfilePage extends PageState{

  @override
  List<Object> get props => [];

}

