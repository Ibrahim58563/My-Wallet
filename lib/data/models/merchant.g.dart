// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MerchantAdapter extends TypeAdapter<Merchant> {
  @override
  final int typeId = 1;

  @override
  Merchant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Merchant()
      ..id = fields[0] as String
      ..name = fields[1] as String
      ..contactEmail = fields[2] as String
      ..contactPhone = fields[3] as String
      ..address = fields[4] as String
      ..pictureUrl = fields[5] as String
      ..stores = (fields[6] as List).cast<Store>()
      ..transactions = (fields[7] as List).cast<Transaction>();
  }

  @override
  void write(BinaryWriter writer, Merchant obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.contactEmail)
      ..writeByte(3)
      ..write(obj.contactPhone)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.pictureUrl)
      ..writeByte(6)
      ..write(obj.stores)
      ..writeByte(7)
      ..write(obj.transactions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MerchantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
