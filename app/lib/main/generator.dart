import 'package:hive/hive.dart';

part 'generator.g.dart';

@HiveType(typeId: 157)
class BooksData {
  @HiveField(0)
  final dynamic id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? isbn;
  @HiveField(3)
  final int? pageCount;
  @HiveField(4)
  final Map<dynamic, dynamic>? publishedDate;
  @HiveField(5)
  final String? thumbnailUrl;
  @HiveField(6)
  final String? shortDescription;
  @HiveField(7)
  final String? longDescription;
  @HiveField(8)
  final String? status;
  @HiveField(9)
  final List<dynamic>? authors;
  @HiveField(10)
  final List<dynamic>? categories;
  @HiveField(11)
  final num? price;

  BooksData(
      {this.id,
      this.title,
      this.isbn,
      this.pageCount,
      this.publishedDate,
      this.thumbnailUrl,
      this.shortDescription,
      this.longDescription,
      this.status,
      this.authors,
      this.categories,
      this.price});
}
