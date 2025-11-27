part of 'on_boarding_bloc.dart';

sealed class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();

  @override
  List<Object?> get props => [];
}

final class OnBoardingPageChangedEvent extends OnBoardingEvent {
  final int page;

  const OnBoardingPageChangedEvent(this.page);

  @override
  List<Object?> get props => [page];
}

final class OnBoardingNextPressedEvent extends OnBoardingEvent {}

final class OnBoardingSkipPressedEvent extends OnBoardingEvent {}
