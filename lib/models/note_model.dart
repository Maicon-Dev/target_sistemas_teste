class Note {
  final String? id;
  final String? userId;
  final String content;

  Note({this.id, this.userId, required this.content});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'content': content,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      userId: map['userId'],
      content: map['content'],
    );
  }
}
