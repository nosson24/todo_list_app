import 'package:flutter/material.dart';
import 'package:todo_list_app/style/colors.dart';

class ButtomBar extends StatelessWidget {
  final Text prefixText;
  const ButtomBar({Key? key, required this.prefixText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration: const BoxDecoration(color: TypeColors.subBoxColor),
          child: Container(
            margin: const EdgeInsets.only(left: 28),
            child: prefixText,
          ),
        ),
      ],
    );
  }
}
