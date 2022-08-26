import 'package:flutter/material.dart';
import 'package:todo_list_app/style/colors.dart';
import 'package:todo_list_app/style/text_style.dart';

class ShowBox extends StatelessWidget {
  final VoidCallback? onPressed;
  final Text prefixText;
  const ShowBox({
    Key? key,
    this.onPressed,
    required this.prefixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: prefixText,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: onPressed,
              child: Container(
                alignment: Alignment.center,
                width: 66,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: TypeColors.subColor,
                ),
                child: const Text(
                  "Yes",
                  style: TextStyles.normal,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                width: 66,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: TypeColors.backgroundColor,
                ),
                child: const Text("No", style: TextStyles.choiceText),
              ),
            )
          ],
        ),
      ],
    );
  }
}
 

 
  // Future<void> showBox(String message) async {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: Text(
  //           message,
  //           style: const TextStyle(
  //             fontSize: 18,
  //           ),
  //         ),
  //         actions: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               InkWell(
  //                 onTap: () async {},
  //                 child: Container(
  //                   alignment: Alignment.center,
  //                   width: 66,
  //                   height: 45,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(15),
  //                     color: TypeColors.subColor,
  //                   ),
  //                   child: const Text(
  //                     "Yes",
  //                     style: TextStyle(fontSize: 18, color: Colors.white),
  //                   ),
  //                 ),
  //               ),
  //               InkWell(
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: Container(
  //                   alignment: Alignment.center,
  //                   width: 66,
  //                   height: 45,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(15),
  //                     color: Colors.white,
  //                   ),
  //                   child: const Text(
  //                     "No",
  //                     style: TextStyle(
  //                       fontSize: 18,
  //                     ),
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }