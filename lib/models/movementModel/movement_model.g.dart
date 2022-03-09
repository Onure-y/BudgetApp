// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovementModelAdapter extends TypeAdapter<MovementModel> {
  @override
  final int typeId = 3;

  @override
  MovementModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovementModel(
      movementText: fields[0] as String,
      movementValue: fields[1] as double,
      time: fields[2] as int,
      isCategoryMovement: fields[5] as bool,
    )
      ..category = fields[3] as CategoryModel
      ..customer = fields[4] as CustomerModel;
  }

  @override
  void write(BinaryWriter writer, MovementModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.movementText)
      ..writeByte(1)
      ..write(obj.movementValue)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.customer)
      ..writeByte(5)
      ..write(obj.isCategoryMovement);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovementModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
