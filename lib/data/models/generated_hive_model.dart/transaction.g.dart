// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 3;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction()
      ..id = fields[0] as String
      ..timestamp = fields[1] as String
      ..amount = fields[2] as double
      ..type = fields[3] as String
      ..storeName = fields[4] as String
      ..customer = fields[5] as Customer?
      ..merchant = fields[6] as Merchant?
      ..pictureUrl = fields[7] as String
      ..name = fields[8] as String
      ..price = fields[9] as double
      ..description = fields[10] as String
      ..note = fields[11] as String
      ..customerId = fields[12] as String?
      ..merchantId = fields[13] as String?;
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.storeName)
      ..writeByte(5)
      ..write(obj.customer)
      ..writeByte(6)
      ..write(obj.merchant)
      ..writeByte(7)
      ..write(obj.pictureUrl)
      ..writeByte(8)
      ..write(obj.name)
      ..writeByte(9)
      ..write(obj.price)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.note)
      ..writeByte(12)
      ..write(obj.customerId)
      ..writeByte(13)
      ..write(obj.merchantId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
