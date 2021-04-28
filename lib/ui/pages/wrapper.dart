part of "pages.dart";

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);
    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.read<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.read<UserBloc>().add(LoadUser(firebaseUser.uid));
        context.read<TicketBloc>().add(GetTickets(firebaseUser.uid));

        prevPageEvent = GoToMainPage();
        context.read<PageBloc>().add(prevPageEvent);
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnSignUpPage)
                    ? SignUpPage(pageState.registrationData)
                    : (pageState is OnPreferencePage)
                        ? PreferencePage(pageState.registrationData)
                        : (pageState is OnAccountConfirmationPage)
                            ? AccountConfirmationPage(
                                pageState.registrationData)
                            : (pageState is OnMovieDetailPage)
                                ? MovieDetailPage(pageState.movieModel)
                                : (pageState is OnSelectSchedulePage)
                                    ? SelectSchedulePage(
                                        pageState.movieDetailModel)
                                    : (pageState is OnSelectSeatPage)
                                        ? SelectSeatPage(pageState.ticketModel)
                                        : (pageState is OnCheckoutPage)
                                            ? CheckoutPage(
                                                pageState.ticketModel)
                                            : (pageState is OnSuccessPage)
                                                ? SuccessPage(
                                                    pageState.ticketModel,
                                                    pageState
                                                        .myFluttixTransactionModel)
                                                : (pageState
                                                        is OnTicketDetailPage)
                                                    ? TicketDetailPage(
                                                        pageState.ticketModel)
                                                    : (pageState
                                                            is OnProfilePage)
                                                        ? ProfilePage()
                                                        : (pageState
                                                                is OnTopUpPage)
                                                            ? TopUpPage(
                                                                pageState
                                                                    .pageEvent)
                                                            : MainPage());
  }
}
