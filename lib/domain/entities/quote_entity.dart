import 'tag_enum.dart';

class QuoteEntity {
  QuoteEntity({
    required this.id,
    required this.author,
    required this.content,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  String id;
  String author;
  String content;
  List<Tag> tags;
  String authorSlug;
  int length;
  DateTime dateAdded;
  DateTime dateModified;
}
