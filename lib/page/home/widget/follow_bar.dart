import 'package:flutter/material.dart';
import 'package:todo_list_app/style/colors.dart';
import 'package:todo_list_app/style/text_style.dart';

class FollowBar extends StatelessWidget {
  const FollowBar({Key? key}) : super(key: key);

  Widget _followers() {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "9M",
            style: TextStyles.numFollowText,
          ),
          Text(
            "Followers",
            style: TextStyles.choiceText,
          ),
        ],
      ),
    );
  }

  Widget _following() {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "1,660",
            style: TextStyles.numFollowText,
          ),
          Text(
            "Following",
            style: TextStyles.choiceText,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: TypeColors.subBoxColor,
      ),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _followers(),
          Container(
            margin: const EdgeInsets.all(14),
            width: 6,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: TypeColors.mainColor,
            ),
          ),
          _following(),
        ],
      ),
    );
  }
}
