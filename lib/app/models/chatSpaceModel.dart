class ChatSpaceModel {
  final String? message;
  final String? sendBy;
  final DateTime? messageTm;

  ChatSpaceModel({
    this.message,
    this.sendBy,
    this.messageTm,
  });

  ChatSpaceModel copyWith({
    String? message,
    String? sendBy,
    DateTime? messageTm,
  }) {
    return ChatSpaceModel(
      message: message ?? this.message,
      sendBy: sendBy ?? this.sendBy,
      messageTm: messageTm ?? this.messageTm,
    );
  }

  ChatSpaceModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        sendBy = json['sendBy'] as String?,
        messageTm = DateTime.parse(json['messageTm']?? '');

  Map<String, dynamic> toJson() => {
    'message' : message,
    'sendBy' : sendBy,
    'messageTm' : messageTm!.toIso8601String()
  };
}