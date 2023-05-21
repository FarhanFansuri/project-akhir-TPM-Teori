// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generator.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BooksDataAdapter extends TypeAdapter<BooksData> {
  @override
  final int typeId = 157;

  @override
  BooksData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BooksData(
      id: fields[0] as dynamic,
      title: fields[1] as String?,
      isbn: fields[2] as String?,
      pageCount: fields[3] as int?,
      publishedDate: (fields[4] as Map?)?.cast<dynamic, dynamic>(),
      thumbnailUrl: fields[5] as String?,
      shortDescription: fields[6] as String?,
      longDescription: fields[7] as String?,
      status: fields[8] as String?,
      authors: (fields[9] as List?)?.cast<dynamic>(),
      categories: (fields[10] as List?)?.cast<dynamic>(),
      price: fields[11] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, BooksData obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.isbn)
      ..writeByte(3)
      ..write(obj.pageCount)
      ..writeByte(4)
      ..write(obj.publishedDate)
      ..writeByte(5)
      ..write(obj.thumbnailUrl)
      ..writeByte(6)
      ..write(obj.shortDescription)
      ..writeByte(7)
      ..write(obj.longDescription)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.authors)
      ..writeByte(10)
      ..write(obj.categories)
      ..writeByte(11)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
