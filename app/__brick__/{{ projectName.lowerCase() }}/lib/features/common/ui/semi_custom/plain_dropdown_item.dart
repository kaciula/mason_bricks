import 'package:freezed_annotation/freezed_annotation.dart';

part 'plain_dropdown_item.freezed.dart';

@freezed
class PlainDropdownItem<T> with _$PlainDropdownItem {
  factory PlainDropdownItem({
    required T? value,
    required String label,
  }) = _PlainDropdownItem;
}
