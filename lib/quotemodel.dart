class QUOTE {
  final String content;
  final String author;
  QUOTE ({this.content, this.author});

  factory QUOTE .fromJson(Map<String, dynamic> json) {
    return QUOTE(
      content: json['content'],
      author: json['author'],
    );
  }
}