class ChatSpaceModel {
  final String? message;
  final String? sendBy;
  final String? sendByPhoto;
  final DateTime? messageTm;

  ChatSpaceModel({
    this.message,
    this.sendBy,
    this.messageTm,
    this.sendByPhoto
  });

  ChatSpaceModel copyWith({
    String? message,
    String? sendBy,
    String? sendByPhoto,
    DateTime? messageTm,
  }) {
    return ChatSpaceModel(
      message: message ?? this.message,
      sendBy: sendBy ?? this.sendBy,
      messageTm: messageTm ?? this.messageTm,
      sendByPhoto: sendByPhoto ?? this.sendByPhoto
    );
  }

  ChatSpaceModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        sendBy = json['sendBy'] as String?,
        sendByPhoto = json['sendByPhoto'] as String?,
        messageTm = DateTime.parse(json['messageTm']?? '');

  Map<String, dynamic> toJson() => {
    'message' : message,
    'sendBy' : sendBy,
    'sendByPhoto': sendByPhoto,
    'messageTm' : messageTm!.toIso8601String()
  };
}