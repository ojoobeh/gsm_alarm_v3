import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:bestdroid/app/core/get.dart';
import 'package:bestdroid/app/extensions/extension.dart';
import 'package:bestdroid/app/widgets/widgets.dart';

class DropDownWidget extends StatefulWidget {
  final String title;
  final String? lable;
  final List<String> items;
  final Function(List<String> items) itemSelected;
  final Widget? customButton;
  final double? borderRadius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? widgetPadding;
  final bool showRadioButton;
  final bool showSearch;
  final bool multiSelect;

  const DropDownWidget({
    super.key,
    required this.title,
    required this.items,
    required this.itemSelected,
    this.lable,
    this.borderRadius,
    this.showRadioButton = false,
    this.customButton,
    this.backgroundColor,
    this.widgetPadding,
    this.showSearch = false,
    this.multiSelect = false,
  });

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? selectedValue;
  List<String> selectedItems = [];
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return widget.multiSelect
        // ? _singleSelectIcon(items: widget.items, showSearch: widget.showSearch)
        ? _multiSelect(items: widget.items, showSearch: widget.showSearch)
        : _singleSelect(items: widget.items, showSearch: widget.showSearch);
  }

  _singleSelect({required List<String> items, required bool showSearch}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.lable != null) Text(widget.lable ?? '').bodyMedium().paddingSymmetric(vertical: 8),
          Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,

                customButton: widget.customButton ??
                    customButton(
  backgroundColor: widget.backgroundColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.title).bodyMedium(color: context.theme.primaryColorDark),
                          // image(AppIcons.arrowDown, color: context.theme.primaryColorDark),
                        ],
                      ),
                    ),
                items: items
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    debugPrint("EEEE");
                    selectedValue = value as String;
                    widget.itemSelected([selectedValue!]);
                    debugPrint("DDDD");
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: 40,

                ),
                dropdownSearchData: showSearch
                    ? DropdownSearchData(
                        searchController: textEditingController,
                        searchInnerWidgetHeight: 50,
                        searchInnerWidget: Container(
                          height: 50,
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 4,
                            right: 8,
                            left: 8,
                          ),
                          child: TextFormField(
                            expands: true,
                            maxLines: null,
                            controller: textEditingController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search for an item...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        searchMatchFn: (item, searchValue) {
                          return (item.value.toString().contains(searchValue));
                        },
                      )
                    : null,
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            ),
          ),
        ],
      );

  _multiSelect({required List<String> items, required bool showSearch}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.lable != null) Text(widget.lable ?? '', style: context.theme.textTheme.bodySmall).paddingSymmetric(vertical: 8),
          Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                customButton: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: context.theme.primaryColorDark.withOpacity(0.3),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.title).bodyMedium(color: context.theme.primaryColorDark),
                      // image(AppIcons.arrowDown, color: context.theme.primaryColorDark),
                    ],
                  ),
                ),
                items: items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    //disable default onTap to avoid closing menu when selecting an item
                    enabled: false,
                    child: widget.multiSelect
                        ? StatefulBuilder(
                            builder: (context, menuSetState) {
                              final _isSelected = selectedItems.contains(item);
                              return InkWell(
                                hoverColor: Colors.transparent,
                                onTap: () {
                                  _isSelected ? selectedItems.remove(item) : selectedItems.add(item);

                                  //This rebuilds the StatefulWidget to update the button's text
                                  setState(() {
                                    debugPrint("FFFF");
                                    widget.itemSelected(selectedItems);
                                    debugPrint("DDDD");
                                  });
                                  //This rebuilds the dropdownMenu Widget to update the check mark
                                  menuSetState(() {});
                                },
                                child: Container(
                                  height: double.infinity,
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      _isSelected ? Icon(Icons.check_box_outlined, color: context.theme.primaryColorDark) : Icon(Icons.check_box_outline_blank, color: context.theme.primaryColorDark),
                                      const SizedBox(width: 16),
                                      Row(
                                        children: [
                                          Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          // item.icon!=null? image(item.icon!, width: 32):const SizedBox(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : const SizedBox(),
                  );
                }).toList(),
                dropdownSearchData: showSearch
                    ? DropdownSearchData(
                        searchController: textEditingController,
                        searchInnerWidgetHeight: 50,
                        searchInnerWidget: Container(
                          height: 50,
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 4,
                            right: 8,
                            left: 8,
                          ),
                          child: TextFormField(
                            expands: true,
                            maxLines: null,
                            controller: textEditingController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search for an item...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        searchMatchFn: (item, searchValue) {
                          return (item.value.toString().contains(searchValue));
                        },
                      )
                    : null,
                //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                value: selectedItems.isEmpty ? null : selectedItems.last,
                onChanged: (value) {},
                selectedItemBuilder: (context) {
                  return items.map(
                    (item) {
                      return Container(
                        alignment: AlignmentDirectional.center,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          selectedItems.join(', '),
                          style: const TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      );
                    },
                  ).toList();
                },
                buttonStyleData: const ButtonStyleData(
                  height: 40,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ],
      );

// _singleSelectIcon({required List<String> items, required bool showSearch}) => Center(
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2(
//           customButton: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(
//                 color: context.theme.primaryColorDark.withOpacity(0.3),
//               ),
//             ),
//             padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text('هویت').bodyMedium(color: context.theme.primaryColorDark),
//                 image(AppIcons.arrowDown, color: context.theme.primaryColorDark),
//               ],
//             ),
//           ),
//           dropdownSearchData: showSearch
//               ? DropdownSearchData(
//                   searchController: textEditingController,
//                   searchInnerWidgetHeight: 50,
//                   searchInnerWidget: Container(
//                     height: 50,
//                     padding: const EdgeInsets.only(
//                       top: 8,
//                       bottom: 4,
//                       right: 8,
//                       left: 8,
//                     ),
//                     child: TextFormField(
//                       expands: true,
//                       maxLines: null,
//                       controller: textEditingController,
//                       decoration: InputDecoration(
//                         isDense: true,
//                         contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 8,
//                         ),
//                         hintText: 'Search for an item...',
//                         hintStyle: const TextStyle(fontSize: 12),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                   searchMatchFn: (item, searchValue) {
//                     return (item.value.toString().contains(searchValue));
//                   },
//                 )
//               : null,
//           items: [
//             ...MenuItems.firstItems.map(
//               (item) => DropdownMenuItem<MenuItem>(
//                 value: item,
//                 child: MenuItems.buildItem(item),
//               ),
//             ),
//             const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
//             ...MenuItems.secondItems.map(
//               (item) => DropdownMenuItem<MenuItem>(
//                 value: item,
//                 child: MenuItems.buildItem(item),
//               ),
//             ),
//           ],
//           onChanged: (value) {
//             MenuItems.onChanged(context, value as MenuItem);
//           },
//           dropdownStyleData: DropdownStyleData(
//             width: 160,
//             padding: const EdgeInsets.symmetric(vertical: 6),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: Colors.redAccent,
//             ),
//             elevation: 8,
//             offset: const Offset(0, 8),
//           ),
//           menuItemStyleData: MenuItemStyleData(
//             customHeights: [
//               ...List<double>.filled(MenuItems.firstItems.length, 48),
//               8,
//               ...List<double>.filled(MenuItems.secondItems.length, 48),
//             ],
//             padding: const EdgeInsets.only(left: 16, right: 16),
//           ),
//         ),
//       ),
//     );
}

class MenuItem {
  final String text;
  final String? icon;

  const MenuItem({
    required this.text,
    this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [home, share, settings];
  static const List<MenuItem> secondItems = [logout];

  static const home = MenuItem(
    text: 'Home',
  );
  static const share = MenuItem(
    text: 'Share',
  );
  static const settings = MenuItem(text: 'Settings');
  static const logout = MenuItem(
    text: 'Log Out',
  );

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        item.icon != null ? Icon(Icons.add, color: Colors.white, size: 22) : const SizedBox(),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.home:
        //Do something
        break;
      case MenuItems.settings:
        //Do something
        break;
      case MenuItems.share:
        //Do something
        break;
      case MenuItems.logout:
        //Do something
        break;
    }
  }
}
