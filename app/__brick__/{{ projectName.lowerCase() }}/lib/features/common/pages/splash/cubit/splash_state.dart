import 'package:{{ projectName.snakeCase() }}/features/common/ui/generic/utils/refresh_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  factory SplashState({
    required RefreshState refreshState,
  }) = _SplashState;

  factory SplashState.initial() {
    return SplashState(
      refreshState: RefreshState.inProgress(),
    );
  }
}
