// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerModelAdapter extends TypeAdapter<CustomerModel> {
  @override
  final int typeId = 1;

  @override
  CustomerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerModel(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      companyName: fields[2] as String,
      telephoneNumber1: fields[3] as String,
      telephoneNumber2: fields[4] as String,
      email: fields[5] as String,
      web: fields[6] as String,
      address: fields[7] as String,
      city: fields[8] as String,
      details: fields[9] as String,
      containerColor: fields[10] as String,
      customerIconIndex: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.companyName)
      ..writeByte(3)
      ..write(obj.telephoneNumber1)
      ..writeByte(4)
      ..write(obj.telephoneNumber2)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.web)
      ..writeByte(7)
      ..write(obj.address)
      ..writeByte(8)
      ..write(obj.city)
      ..writeByte(9)
      ..write(obj.details)
      ..writeByte(10)
      ..write(obj.containerColor)
      ..writeByte(11)
      ..write(obj.customerIconIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
