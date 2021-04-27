import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfluttix/models/models.dart';

part 'page_state.dart';
part 'page_event.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage());

  @override
  Stream<PageState> mapEventToState(PageEvent event) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    } else if (event is GoToSignUpPage) {
      yield OnSignUpPage(event.registrationData);
    } else if (event is GoToPreferencePage) {
      yield OnPreferencePage(event.registrationData);
    } else if (event is GoToAccountConfirmationPage) {
      yield OnAccountConfirmationPage(event.registrationData);
    } else if (event is GoToMovieDetailPage) {
      yield OnMovieDetailPage(event.movieModel);
    } else if (event is GoToSelectSchedulePage) {
      yield OnSelectSchedulePage(event.movieDetailModel);
    } else if (event is GoToSelectSeatPage) {
      yield OnSelectSeatPage(event.ticketModel);
    } else if(event is GoToCheckoutPage){
      yield OnCheckoutPage(event.ticketModel);
    } else if(event is GoToSuccessPage){
      yield OnSuccessPage(event.ticketModel, event.myFluttixTransactionModel);
    }
  }
}
