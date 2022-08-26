import 'package:flutter/material.dart';
import 'package:todo_list_app/style/text_style.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(90),
                color: Colors.blue),
            height: 172,
            width: 172,
            alignment: Alignment.center,
            child: const CircleAvatar(
              radius: 90.0,
              backgroundImage: AssetImage("assets/imageProfile.png"),
            ),
          ),
          const Text(
            "Shoto Todoroki",
            style: TextStyles.sizeNameText,
          ),
          const Text(
            "student",
            style: TextStyles.mainFontNameClass,
          ),
        ],
      ),
    );
  }
}
