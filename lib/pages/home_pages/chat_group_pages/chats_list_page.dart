import 'package:flutter/material.dart';
import 'package:por_maria_app/models/chat_model.dart';
import 'package:por_maria_app/pages/home_pages/chat_group_pages/chat_messages_pages.dart';

class ChatsListPage extends StatefulWidget {
  const ChatsListPage({super.key});

  @override
  _ChatsListPageState createState() => _ChatsListPageState();
}

class _ChatsListPageState extends State<ChatsListPage> {
  @override
  Widget build(BuildContext context) {
    // return const Scaffold(
    //   backgroundColor: Color.fromARGB(255, 204, 230, 248),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [Icon(Icons.chat, size: 160.0, color: Colors.white)],
    //     ),
    //   ),
    // );

    return ListView.builder(
      itemCount: messageData.length,
      itemBuilder: (context, index) => Column(
        children: <Widget>[
          const Divider(
            height: 10.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(messageData[index].imageUrl),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  messageData[index].name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  messageData[index].timeReceived,
                  style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ],
            ),
            subtitle: Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      messageData[index].message,
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 15.0),
                    ),
                    const Icon(
                      Icons.check,
                      color: Colors.grey,
                      size: 16.0,
                    )
                  ]),
            ),
            onTap: () {
              var route = MaterialPageRoute(
                  builder: (BuildContext context) => ChatMessagePage(
                      messageData[index].name, messageData[index].imageUrl));
              Navigator.of(context).push(route);
            },
          )
        ],
      ),
    );
  }
}
