import '../../domain/entities/quote_entity.dart';
import '../../domain/entities/tag_enum.dart';

class QuoteAdapter extends QuoteEntity {
  QuoteAdapter({
    required super.id,
    required super.author,
    required super.content,
    required super.tags,
    required super.authorSlug,
    required super.length,
    required super.dateAdded,
    required super.dateModified,
  });

  factory QuoteAdapter.fromMap(Map<String, dynamic> map) {
    return QuoteAdapter(
      id: map["_id"],
      author: map["author"],
      content: map["content"],
      tags: List<Tag>.from(map["tags"].map((x) => tagValues.map[x]!)),
      authorSlug: map["authorSlug"],
      length: map["length"],
      dateAdded: DateTime.parse(map["dateAdded"]),
      dateModified: DateTime.parse(map["dateModified"]),
    );
  }
}
