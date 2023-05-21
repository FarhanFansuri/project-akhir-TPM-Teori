import 'generator.dart';

class Books {
  final dynamic? id;
  final String? title;
  final String? isbn;
  final int? pageCount;
  final Map<dynamic, dynamic>? publishedDate;
  final String? thumbnailUrl;
  final String? shortDescription;
  final String? longDescription;
  final String? status;
  final List<dynamic>? authors;
  final List<dynamic>? categories;

  const Books(
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
      this.categories});

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
        id: json["_id"],
        title: json["title"],
        isbn: json["isbn"],
        pageCount: json["pageCount"],
        publishedDate: json["publishedDate"],
        thumbnailUrl: json["thumbnailUrl"],
        shortDescription: json["shortDescription"],
        longDescription: json["longDescription"],
        status: json["status"],
        authors: json["authors"],
        categories: json["categories"]);
  }
}
