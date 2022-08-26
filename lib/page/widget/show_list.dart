import 'package:flutter/material.dart';
import 'package:todo_list_app/page/widget/show_box.dart';
import 'package:todo_list_app/style/colors.dart';
import 'package:todo_list_app/style/text_style.dart';

class ShowList extends StatelessWidget {
  final VoidCallback? onPressed;
  final Text topicText;
  final Text descriptionText;
  final Text dateTimeText;

  const ShowList({
    Key? key,
    required this.topicText,
    required this.descriptionText,
    required this.dateTimeText,
    this.onPressed,
  }) : super(key: key);

  Future<void> showBox(context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShowBox(
          prefixText: const Text("Are you sure to done this task ?"),
          onPressed: onPressed,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task detail"),
        backgroundColor: TypeColors.subColor,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 85,
                decoration: const BoxDecoration(
                  color: TypeColors.mainColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: ListTile(
                    title: topicText,
                    subtitle: dateTimeText,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  alignment: Alignment.center,
                  width: 86,
                  height: 85,
                  decoration: const BoxDecoration(
                    color: TypeColors.iconsColor,
                  ),
                  child: GestureDetector(
                    child: const Text(
                      "Done",
                      style: TextStyles.normal,
                    ),
                    onTap: () {
                      showBox(context);
                    },
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: TypeColors.backgroundColor,
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 35,
                      right: 35,
                    ),
                    child: descriptionText,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
