import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'toggle_user_name_url_state.dart';

class ToggleUserNameUrlCubit extends Cubit<ToggleUserNameUrlState> {
  ToggleUserNameUrlCubit() : super(const ToggleUserNameUrlInitial());

  void toggle() {
    emit(ToggleSocialUrl(isUrl: !state.isUrl));
  }
}
