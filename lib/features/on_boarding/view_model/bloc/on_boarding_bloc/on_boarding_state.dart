part of 'on_boarding_bloc.dart';

sealed class OnBoardingState extends Equatable {
  final int currentPage;

  const OnBoardingState(this.currentPage);

  @override
  List<Object?> get props => [currentPage];
}

// Initial State
final class OnBoardingInitial extends OnBoardingState {
  const OnBoardingInitial() : super(0);
}

// When user swipes or page changes
final class OnBoardingPageChanged extends OnBoardingState {
  const OnBoardingPageChanged(super.page);
}

// When Next is pressed
final class OnBoardingNextState extends OnBoardingState {
  const OnBoardingNextState(super.page);
}

// When Skip is pressed (jump to last page)
final class OnBoardingSkipState extends OnBoardingState {
  const OnBoardingSkipState(super.page);
}
