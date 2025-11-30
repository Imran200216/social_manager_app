part of 'toggle_user_name_url_cubit.dart';

sealed class ToggleUserNameUrlState extends Equatable {
  final bool isUrl;

  const ToggleUserNameUrlState(this.isUrl);

  @override
  List<Object> get props => [isUrl];
}

final class ToggleUserNameUrlInitial extends ToggleUserNameUrlState {
  const ToggleUserNameUrlInitial() : super(false);
}

final class ToggleSocialUrl extends ToggleUserNameUrlState {
  const ToggleSocialUrl({required bool isUrl}) : super(isUrl);
}
