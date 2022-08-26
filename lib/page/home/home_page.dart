import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list_app/model/to_do_list_service.dart';
import 'package:todo_list_app/page/add_task/add_task_page.dart';
import 'package:todo_list_app/page/home/widget/buttom_bar.dart';
import 'package:todo_list_app/page/home/widget/follow_bar.dart';
import 'package:todo_list_app/page/home/widget/profile.dart';
import 'package:todo_list_app/page/widget/show_list.dart';
import 'package:todo_list_app/style/colors.dart';
import 'package:todo_list_app/style/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TypeColors.subColor,
        title: const Text("mytodos"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TypeColors.iconsColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const AddTask(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: TypeColors.backgroundColor,
        ),
      ),
      body: Container(
        color: TypeColors.mainColor,
        child: Column(
          children: [
            const Profile(),
            const FollowBar(),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("MyTodos").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
                if (!snapshots.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshots.data?.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot documentSnapshot =
                          snapshots.data!.docs[index];
                      return Dismissible(
                        onDismissed: (direction) {
                          deleteTodos(documentSnapshot["todoTopic"]);
                        },
                        key: Key(documentSnapshot["todoTopic"]),
                        child: Card(
                          margin: const EdgeInsets.all(8),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            title: Text(
                              documentSnapshot["todoTopic"],
                              style: TextStyles.choiceText,
                            ),
                            subtitle: Text(
                              documentSnapshot["time"],
                              style: TextStyles.choiceText,
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    deleteTodos(documentSnapshot["todoTopic"]);
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: TypeColors.mainColor,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return ShowList(
                                    topicText: Text(
                                      documentSnapshot["todoTopic"],
                                      style: TextStyles.normal,
                                    ),
                                    dateTimeText: Text(
                                      documentSnapshot["time"],
                                      style: TextStyles.normal,
                                    ),
                                    descriptionText: Text(
                                      documentSnapshot["todoDescription"],
                                      style: TextStyles.choiceText,
                                    ),
                                    onPressed: () {
                                      deleteTodos(
                                        documentSnapshot["todoTopic"],
                                      );
                                      Navigator.pushAndRemoveUntil<void>(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const HomePage()),
                                        (route) => false,
                                      );
                                    },
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("MyTodos").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
                if (!snapshots.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ButtomBar(
                  prefixText: Text(
                    "${snapshots.data?.docs.length} Tasks remain",
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
