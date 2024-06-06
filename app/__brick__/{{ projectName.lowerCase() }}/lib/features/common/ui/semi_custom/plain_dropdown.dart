import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:kozmoz/app/app_styles.dart';
import 'package:kozmoz/features/common/ui/generic/generic_app_icons.dart';
import 'package:kt_dart/kt.dart';

import 'plain_dropdown_item.dart';

class PlainDropdown extends StatelessWidget {
  const PlainDropdown({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    this.isEnabled = true,
    this.width = 96,
    this.height = 48,
    this.isExpanded = false,
    this.showDropdownIcon = true,
    this.dropdownIconPadding,
    this.color = AppColors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.selectedColor = AppColors.black,
    this.fontSize = 15,
    this.onTap,
    this.dropdownKey,
  });

  final KtList<PlainDropdownItem> items;
  final PlainDropdownItem? selectedItem;
  final bool isEnabled;
  final Color color;
  final BorderRadiusGeometry borderRadius;
  final double fontSize;
  final Color selectedColor;
  final double? width;
  final double height;
  final bool isExpanded;
  final bool showDropdownIcon;
  final EdgeInsets? dropdownIconPadding;
  final Function(PlainDropdownItem item) onChanged;
  final VoidCallback? onTap;
  final Key? dropdownKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      height: height,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          key: dropdownKey,
          isExpanded: isExpanded,
          valueListenable: ValueNotifier(selectedItem),
          items: _dropdownItems(context, items),
          iconStyleData: IconStyleData(
            icon: Icon(
              GenericAppIcons.arrowDropDown,
              size: showDropdownIcon ? 32 : 0,
              color: AppColors.grey242,
            ),
          ),
          buttonStyleData: ButtonStyleData(
            width: width,
            height: height,
            padding: dropdownIconPadding,
          ),
          menuItemStyleData: MenuItemStyleData(
            padding: EdgeInsets.all(0),
          ),
          selectedItemBuilder: (BuildContext context) =>
              _selectedDropdownMenuItems(context, items),
          onChanged: isEnabled
              ? (PlainDropdownItem? it) {
                  if (it != selectedItem) {
                    onChanged(it!);
                  }
                }
              : null,
          onMenuStateChange: (isOpen) {
            if (isOpen) {
              onTap?.call();
            }
          },
        ),
      ),
    );
  }

  List<DropdownItem<PlainDropdownItem>> _dropdownItems(
      BuildContext context, KtList<PlainDropdownItem> options) {
    return options
        .map(
          (PlainDropdownItem it) => DropdownItem<PlainDropdownItem>(
            value: it,
            height: height,
            child: SizedBox(
              width: width,
              child: Center(
                child: Text(
                  it.label,
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
          ),
        )
        .asList();
  }

  List<Widget> _selectedDropdownMenuItems(
      BuildContext context, KtList<PlainDropdownItem> options) {
    return options
        .map(
          (PlainDropdownItem it) => SizedBox(
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Center(
                child: Text(
                  it.label,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: selectedColor,
                  ),
                ),
              ),
            ),
          ),
        )
        .asList();
  }
}
