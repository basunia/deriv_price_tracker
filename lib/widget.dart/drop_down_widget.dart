import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

enum ViewType { market, price }

class DropDownWidget extends StatefulWidget {
  DropDownWidget({required this.items, this.title, Key? key}) : super(key: key);

  final String? title;
  final List<String> items;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  // Initial Selected Value
  String? dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: DropdownButton<String>(
        value: dropdownvalue ?? widget.items.first,
        // hint: Text(widget.title ?? 'Select an item'),
        items: widget.items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            dropdownvalue = value;
          });
        },
      ),
    );
    // return DropdownButtonHideUnderline(
    //   child: DropdownButton2(
    //     hint: Text(
    //       'Select Item',
    //       style: TextStyle(
    //         fontSize: 14,
    //         color: Theme.of(context).hintColor,
    //       ),
    //     ),
    //     items: items
    //         .map((item) => DropdownMenuItem<String>(
    //               value: item,
    //               child: Text(
    //                 item,
    //                 style: const TextStyle(
    //                   fontSize: 14,
    //                 ),
    //               ),
    //             ))
    //         .toList(),
    //     value: selectedValue,
    //     onChanged: (value) {
    //       // setState(() {
    //       //   selectedValue = value as String;
    //       // });
    //     },
    //     buttonHeight: 40,
    //     buttonWidth: 140,
    //     itemHeight: 40,
    //   ),
    // );
  }
}
