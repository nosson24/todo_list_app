import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/page/home/home_page.dart';
import 'package:todo_list_app/page/widget/show_box.dart';
import 'package:todo_list_app/style/colors.dart';
import 'package:todo_list_app/style/text_style.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String todoTopic = "";
  String todoDescription = "";
  String time = ("Date : ") +
      DateFormat("yyyy/MM/dd kk:mm").format(DateTime.now()).toString();

  createTodos() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyTodos").doc(todoTopic);
    //map
    Map<String, String> todos = {
      "todoTopic": todoTopic,
      "todoDescription": todoDescription,
      "time": time,
    };
    documentReference.set(todos).whenComplete(() {
      print("$todoTopic created");
    });
  }

  Widget topic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: Text(
                "Topic",
                style: TextStyles.choiceText,
              ),
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            color: TypeColors.boxColor,
          ),
          height: 43,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: TextField(
              onChanged: (String string) {
                todoTopic = string.trim();
              },
              decoration: const InputDecoration(
                counterText: "",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: Text(
            "Description",
            style: TextStyles.choiceText,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: TypeColors.boxColor,
          ),
          width: MediaQuery.of(context).size.width,
          height: 155,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: TextField(
              onChanged: (String string) {
                todoDescription = string.trim();
              },
              expands: true,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> showBox() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShowBox(
          prefixText: const Text("Are you sure to done this task ?"),
          onPressed: () {
            createTodos();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage()),
              (route) => false,
            );
          },
        );
      },
    );
  }

  Widget mainList() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: TypeColors.backgroundColor,
        ),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(27),
          child: Column(
            children: [
              topic(),
              description(),
            ],
          ),
        )),
      ),
    );
  }

  Widget bottomBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            showBox();
          },
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: TypeColors.iconsColor,
            ),
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: const Text("Submit", style: TextStyles.textButton),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
        backgroundColor: TypeColors.subColor,
      ),
      body: Column(
        children: [
          mainList(),
          bottomBar(),
        ],
      ),
    );
  }
}
