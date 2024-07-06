// import 'dart:convert';
import 'package:por_maria_app/models/chat_user.dart';
import 'package:por_maria_app/repository/stream_api_respository.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
// import 'package:http/http.dart' as http;

class StreamApiImpl extends StreamApiRepository {
  StreamApiImpl(this._client);

  final StreamChatClient _client;

  @override
  Future<ChatUser> connectUser(ChatUser user, String token) async {
    Map<String, dynamic> extraData = {};
    if (user.image != '') {
      extraData['image'] = user.image;
    }
    if (user.name != '') {
      extraData['name'] = user.name;
    }
    await _client.disconnectUser();
    await _client.connectUser(
      User(id: user.id, extraData: extraData),
      token,
    );
    return user;
  }

  @override
  Future<List<ChatUser>> getChatUser() async {
    final result = await _client.queryUsers(
      filter: const Filter.empty(),
    );
    final chatUsers = result.users
        .where((element) => element.id != _client.state.currentUser?.id)
        .map(
          (e) => ChatUser(
            id: e.id,
            name: e.name,
            image: e.extraData['image'] as String? ??
                'https://ui-avatars.com/api/?background=random&color=random&name=jpanza&rounded=true&size=250',
          ),
        )
        .toList();
    return chatUsers;
  }

  @override
  Future<String> getToken(String userId) async {
    //TODO: use your own implementation in Production
    // final response = await http.post(
    //   'your_backend_url' as Uri,
    //   body: jsonEncode(<String, String>{'id': userId}),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    // );
    // final token = jsonDecode(response.body)['token'];

    //In Development mode you can just use :
    final token = _client.devToken(userId).rawValue;
    print('aca 2 $token');

    return token;
  }

  @override
  Future<Channel> createGroupChat(String id, String name, List<String> members,
      {String? image}) async {
    final channel = _client.channel('messaging', id: id, extraData: {
      'name': name,
      'image': image,
      'members': [_client.state.currentUser?.id, ...members],
    });
    await channel.watch();
    return channel;
  }

  @override
  Future<Channel> createSimpleChat(String friendId) async {
    final channel = _client.channel('messaging',
        id: '${_client.state.currentUser?.id.hashCode}${friendId.hashCode}',
        extraData: {
          'members': [
            friendId,
            _client.state.currentUser?.id,
          ],
        });
    await channel.watch();
    return channel;
  }

  @override
  Future<void> logout() async {
    return _client.disconnectUser();
  }

  @override
  Future<bool> connectIfExist(String userId) async {
    print('aca 1 $userId');
    final token = await getToken(userId);
    await _client.connectUser(
      User(id: userId),
      token,
      connectWebSocket: true,
    );
    print('aca 3 ' + _client.state.currentUser!.name);
    print('userId $userId=' + _client.state.currentUser!.name);
    print('userName $userId=' + _client.state.currentUser!.id);
    // return _client.state.currentUser?.name != null &&
    //     _client.state.currentUser?.name != userId;
    return _client.state.currentUser?.name != null;
  }
}
