import 'package:freezed_annotation/freezed_annotation.dart';

part '{{ name.snakeCase() }}_state.freezed.dart';

@freezed
class {{ name.pascalCase() }}State with  _${{ name.pascalCase() }}State {
  factory {{ name.pascalCase() }}State() = _{{ name.pascalCase() }}State;

  {{ name.pascalCase() }}State._();

  factory {{ name.pascalCase() }}State.initial() {
    return {{ name.pascalCase() }}State();
  }
}