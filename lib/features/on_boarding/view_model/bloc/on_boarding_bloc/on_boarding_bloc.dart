import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final int totalPages = 3;

  OnBoardingBloc() : super(OnBoardingInitial()) {
    // When page is changed manually by swiping
    on<OnBoardingPageChangedEvent>((event, emit) {
      emit(OnBoardingPageChanged(event.page));
    });

    // When Next button pressed
    on<OnBoardingNextPressedEvent>((event, emit) {
      final next = state.currentPage + 1;

      if (next < totalPages) {
        emit(OnBoardingNextState(next));
      }
    });

    // When Skip pressed → jump to last
    on<OnBoardingSkipPressedEvent>((event, emit) {
      emit(OnBoardingSkipState(totalPages - 1));
    });
  }
}
