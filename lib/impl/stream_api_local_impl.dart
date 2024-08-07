import 'package:por_maria_app/models/chat_user.dart';
import 'package:por_maria_app/repository/stream_api_respository.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamApiLocalImpl extends StreamApiRepository {
  StreamApiLocalImpl(this._client);

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
    // await _client.disconnect();
    await _client.disconnectUser();
    await _client.connectUser(
      User(id: user.id, extraData: extraData),
      //token ?? _client.devToken(user.id),
      token,
    );
    return user;
  }

  @override
  Future<List<ChatUser>> getChatUser() async {
    final result = await _client.queryUsers(
        // filter: Filter.empty(),
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
    return _client.devToken(userId).rawValue;
  }

  @override
  Future<Channel> createGroupChat(
      String channelId, String name, List<String> members,
      {String? image}) async {
    final channel = _client.channel('messaging', id: channelId, extraData: {
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
  Future<void> logout() {
    return _client.disconnectUser();
  }

  @override
  Future<bool> connectIfExist(String userId) async {
    final token = await getToken(userId);
    print('antes del connect user');
    await _client.connectUser(
      User(id: userId),
      token,
    );
    print('obtuvo token');
    return _client.state.currentUser?.name != null &&
        _client.state.currentUser?.name != userId;
  }
}
