class ChatRoomModel {
  final List<String>? users;
  final List<String>? usersProfile;
  final List<String>? usersName;
  final String? lastMessage;
  final String? lastMessageBy;
  final DateTime? lastMessageTm;
  final String? chatRoomId;

  ChatRoomModel({
    this.users,
    this.usersProfile,
    this.usersName,
    this.lastMessage,
    this.lastMessageBy,
    this.lastMessageTm,
    this.chatRoomId,
  });

  ChatRoomModel copyWith({
    List<String>? users,
    List<String>? usersProfile,
    List<String>? usersName,
    String? lastMessage,
    String? lastMessageBy,
    DateTime? lastMessageTm,
    String? chatRoomId,
  }) {
    return ChatRoomModel(
      users: users ?? this.users,
      usersProfile: usersProfile ?? this.usersProfile,
      usersName: usersName ?? this.usersName,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageBy: lastMessageBy ?? this.lastMessageBy,
      lastMessageTm: lastMessageTm ?? this.lastMessageTm,
      chatRoomId: chatRoomId ?? this.chatRoomId,
    );
  }

  ChatRoomModel.fromJson(Map<String, dynamic> json)
      : users = (json['users'] as List?)?.map((dynamic e) => e as String).toList(),
        usersProfile = (json['usersProfile'] as List?)?.map((dynamic e) => e as String).toList(),
        usersName = (json['usersName'] as List?)?.map((dynamic e) => e as String).toList(),
        lastMessage = json['lastMessage'] as String?,
        lastMessageBy = json['lastMessageBy'] as String?,
        lastMessageTm = DateTime.parse(json['lastMessageTm']?? ''),
        chatRoomId = json['chatRoomId'] as String?;

  Map<String, dynamic> toJson() => {
    'users' : users,
    'usersProfile' : usersProfile,
    'usersName' : usersName,
    'lastMessage' : lastMessage,
    'lastMessageBy' : lastMessageBy,
    'lastMessageTm' : lastMessageTm!.toIso8601String(),
    'chatRoomId' : chatRoomId
  };
}