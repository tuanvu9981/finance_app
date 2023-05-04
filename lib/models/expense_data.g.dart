// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseDataAdapter extends TypeAdapter<ExpenseData> {
  @override
  final int typeId = 1;

  @override
  ExpenseData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpenseData(
      name: fields[0] as String?,
      amount: fields[1] as String?,
      explain: fields[2] as String?,
      IN: fields[3] as String?,
      dateTime: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ExpenseData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.explain)
      ..writeByte(3)
      ..write(obj.IN)
      ..writeByte(4)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
