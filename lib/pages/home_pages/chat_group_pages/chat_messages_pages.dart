import 'package:flutter/material.dart';
import 'package:por_maria_app/models/chat_model.dart';

class ChatMessagePage extends StatefulWidget {
  final String name;
  final String imageUrl;
  const ChatMessagePage(this.name, this.imageUrl, {super.key});

  @override
  _ChatMessageState createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessagePage>
    with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      //backgroundColor: const Color.fromARGB(255, 204, 230, 248),
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icon(Icons.chat, size: 160.0, color: Colors.white)
            Flexible(
                child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )),
            const Divider(
              height: 1.0,
            ),
            Container(
              child: _buildTextComposer(),
            )
          ],
        ),
      ),
    );
    // return Container(
    //   color: const Color.fromARGB(255, 204, 230, 248),
    //   child: Text(widget.name),
    // );
  }

  final TextEditingController _textController = TextEditingController();

  Widget _buildTextComposer() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).primaryColor),
        child: Container(
            child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
              ),
            ),
            Container(
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _textController.text.isNotEmpty
                    ? _handledSubmit(_textController.text)
                    : null,
              ),
            )
          ],
        )));
  }

  void _handledSubmit(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
        widget.name,
        widget.imageUrl,
        AnimationController(
            duration: const Duration(milliseconds: 700), vsync: this),
        text);

    setState(() {
      _messages.insert(0, message);
      var data =
          messageData.firstWhere((element) => element.name == widget.name);
      data.message = message.text;
    });
    message.animationController.forward();
  }
}

class ChatMessage extends StatelessWidget {
  final String name;
  final String imageUrl;
  final AnimationController animationController;
  final String text;

  const ChatMessage(
      this.name, this.imageUrl, this.animationController, this.text,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    // backgroundImage: NetworkImage(imageUrl),
                    child: AnimatedDefaultTextStyle(
                        style: const TextStyle(color: Colors.white),
                        duration: Durations.long1,
                        child:
                            // Text(name[0])
                            CircleAvatar(
                          backgroundImage: NetworkImage(imageUrl),
                        )
                        //  Image(
                        //   image: NetworkImage(imageUrl),
                        // ),
                        ),
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: Color.fromARGB(255, 204, 230, 248),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Container(
                              child: Text(text),
                            )
                          ]),
                    )
                  ],
                ))
              ]),
        ));
  }
}
