import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).appBarTheme.backgroundColor;
    late final listController = StreamChannelListController(
      client: StreamChat.of(context).client,
      filter: Filter.in_(
        'members',
        [StreamChat.of(context).currentUser!.id],
      ),
      channelStateSort: [SortOption('last_message_at')],
      // sort: const [SortOption('last_message_at')],
      limit: 20,
    );
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 24,
            color: textColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: StreamChannelListView(
        controller: listController,
        onChannelTap: (channel) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StreamChannel(
              channel: channel,
              child: ChannelPage(),
            ),
          ),
        ),
        onChannelLongPress: (channel) {
          String id = '';
          String name;
          String image;
          final currentUser = StreamChat.of(context).client.state.currentUser;
          if (channel.isGroup) {
            id = channel.id as String;
            name = channel.extraData['name'] as String;
            image = channel.extraData['image'] as String;
          } else {
            final friend = channel.state!.members
                .where((element) => element.userId != currentUser!.id)
                .first
                .user;
            id = friend!.id;
            name = friend.name;
            image = friend.extraData['image'] as String;
          }

          Navigator.of(context).push(
            PageRouteBuilder(
              barrierColor: Colors.black45,
              barrierDismissible: true,
              opaque: false,
              pageBuilder: (context, animation1, _) {
                return FadeTransition(
                  opacity: animation1,
                  child: ChatDetailView(
                    channelId: id,
                    image: image,
                    name: name,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ChannelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StreamChannelHeader(),
      body: Column(
        children: [
          Expanded(
            child: StreamMessageListView(),
          ),
          StreamMessageInput(),
        ],
      ),
    );
  }
}

class ChatDetailView extends StatelessWidget {
  const ChatDetailView({
    Key? key,
    required this.image,
    required this.name,
    required this.channelId,
  }) : super(key: key);

  final String image;
  final String name;
  final String channelId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Navigator.of(context).pop,
      child: Material(
        color: Colors.transparent,
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: channelId,
                  child: ClipOval(
                    child: Image.network(
                      image,
                      height: 180,
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
