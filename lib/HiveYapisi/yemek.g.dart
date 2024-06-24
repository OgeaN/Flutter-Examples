// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../HiveYapisi/yemek.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class YemekAdapter extends TypeAdapter<Yemek> {
  @override
  final int typeId = 1;

  @override
  Yemek read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Yemek(
      name: fields[0] as String,
      countryFrom: fields[1] as String,
      time: fields[2] as int,
      ingredients: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Yemek obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.countryFrom)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YemekAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
