// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church_profile_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChurchProfileAdapter extends TypeAdapter<ChurchProfile> {
  @override
  final int typeId = 0;

  @override
  ChurchProfile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChurchProfile(
      title: fields[0] as String,
      iconCodePoint: fields[1] as int,
      events: (fields[2] as List).cast<Event>(),
    );
  }

  @override
  void write(BinaryWriter writer, ChurchProfile obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.iconCodePoint)
      ..writeByte(2)
      ..write(obj.events);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChurchProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
