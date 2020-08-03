// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DatabasePM.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Farm extends DataClass implements Insertable<Farm> {
  final String id;
  final String userId;
  final String farmName;
  final String document;
  final double area;
  final String farmAddress;
  final String city;
  final String uf;
  Farm(
      {@required this.id,
      @required this.userId,
      @required this.farmName,
      @required this.document,
      @required this.area,
      @required this.farmAddress,
      @required this.city,
      @required this.uf});
  factory Farm.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Farm(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      farmName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}farm_name']),
      document: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}document']),
      area: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}area']),
      farmAddress: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}farm_address']),
      city: stringType.mapFromDatabaseResponse(data['${effectivePrefix}city']),
      uf: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uf']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    if (!nullToAbsent || farmName != null) {
      map['farm_name'] = Variable<String>(farmName);
    }
    if (!nullToAbsent || document != null) {
      map['document'] = Variable<String>(document);
    }
    if (!nullToAbsent || area != null) {
      map['area'] = Variable<double>(area);
    }
    if (!nullToAbsent || farmAddress != null) {
      map['farm_address'] = Variable<String>(farmAddress);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || uf != null) {
      map['uf'] = Variable<String>(uf);
    }
    return map;
  }

  factory Farm.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Farm(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      farmName: serializer.fromJson<String>(json['farmName']),
      document: serializer.fromJson<String>(json['document']),
      area: serializer.fromJson<double>(json['area']),
      farmAddress: serializer.fromJson<String>(json['farmAddress']),
      city: serializer.fromJson<String>(json['city']),
      uf: serializer.fromJson<String>(json['uf']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'farmName': serializer.toJson<String>(farmName),
      'document': serializer.toJson<String>(document),
      'area': serializer.toJson<double>(area),
      'farmAddress': serializer.toJson<String>(farmAddress),
      'city': serializer.toJson<String>(city),
      'uf': serializer.toJson<String>(uf),
    };
  }

  Farm copyWith(
          {String id,
          String userId,
          String farmName,
          String document,
          double area,
          String farmAddress,
          String city,
          String uf}) =>
      Farm(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        farmName: farmName ?? this.farmName,
        document: document ?? this.document,
        area: area ?? this.area,
        farmAddress: farmAddress ?? this.farmAddress,
        city: city ?? this.city,
        uf: uf ?? this.uf,
      );
  @override
  String toString() {
    return (StringBuffer('Farm(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('farmName: $farmName, ')
          ..write('document: $document, ')
          ..write('area: $area, ')
          ..write('farmAddress: $farmAddress, ')
          ..write('city: $city, ')
          ..write('uf: $uf')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          userId.hashCode,
          $mrjc(
              farmName.hashCode,
              $mrjc(
                  document.hashCode,
                  $mrjc(
                      area.hashCode,
                      $mrjc(farmAddress.hashCode,
                          $mrjc(city.hashCode, uf.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Farm &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.farmName == this.farmName &&
          other.document == this.document &&
          other.area == this.area &&
          other.farmAddress == this.farmAddress &&
          other.city == this.city &&
          other.uf == this.uf);
}

class FarmsCompanion extends UpdateCompanion<Farm> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> farmName;
  final Value<String> document;
  final Value<double> area;
  final Value<String> farmAddress;
  final Value<String> city;
  final Value<String> uf;
  const FarmsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.farmName = const Value.absent(),
    this.document = const Value.absent(),
    this.area = const Value.absent(),
    this.farmAddress = const Value.absent(),
    this.city = const Value.absent(),
    this.uf = const Value.absent(),
  });
  FarmsCompanion.insert({
    this.id = const Value.absent(),
    @required String userId,
    @required String farmName,
    @required String document,
    @required double area,
    @required String farmAddress,
    @required String city,
    @required String uf,
  })  : userId = Value(userId),
        farmName = Value(farmName),
        document = Value(document),
        area = Value(area),
        farmAddress = Value(farmAddress),
        city = Value(city),
        uf = Value(uf);
  static Insertable<Farm> custom({
    Expression<String> id,
    Expression<String> userId,
    Expression<String> farmName,
    Expression<String> document,
    Expression<double> area,
    Expression<String> farmAddress,
    Expression<String> city,
    Expression<String> uf,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (farmName != null) 'farm_name': farmName,
      if (document != null) 'document': document,
      if (area != null) 'area': area,
      if (farmAddress != null) 'farm_address': farmAddress,
      if (city != null) 'city': city,
      if (uf != null) 'uf': uf,
    });
  }

  FarmsCompanion copyWith(
      {Value<String> id,
      Value<String> userId,
      Value<String> farmName,
      Value<String> document,
      Value<double> area,
      Value<String> farmAddress,
      Value<String> city,
      Value<String> uf}) {
    return FarmsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      farmName: farmName ?? this.farmName,
      document: document ?? this.document,
      area: area ?? this.area,
      farmAddress: farmAddress ?? this.farmAddress,
      city: city ?? this.city,
      uf: uf ?? this.uf,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (farmName.present) {
      map['farm_name'] = Variable<String>(farmName.value);
    }
    if (document.present) {
      map['document'] = Variable<String>(document.value);
    }
    if (area.present) {
      map['area'] = Variable<double>(area.value);
    }
    if (farmAddress.present) {
      map['farm_address'] = Variable<String>(farmAddress.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (uf.present) {
      map['uf'] = Variable<String>(uf.value);
    }
    return map;
  }
}

class $FarmsTable extends Farms with TableInfo<$FarmsTable, Farm> {
  final GeneratedDatabase _db;
  final String _alias;
  $FarmsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    )..clientDefault = () => _uuid.v4();
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedTextColumn _userId;
  @override
  GeneratedTextColumn get userId => _userId ??= _constructUserId();
  GeneratedTextColumn _constructUserId() {
    return GeneratedTextColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _farmNameMeta = const VerificationMeta('farmName');
  GeneratedTextColumn _farmName;
  @override
  GeneratedTextColumn get farmName => _farmName ??= _constructFarmName();
  GeneratedTextColumn _constructFarmName() {
    return GeneratedTextColumn(
      'farm_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _documentMeta = const VerificationMeta('document');
  GeneratedTextColumn _document;
  @override
  GeneratedTextColumn get document => _document ??= _constructDocument();
  GeneratedTextColumn _constructDocument() {
    return GeneratedTextColumn(
      'document',
      $tableName,
      false,
    );
  }

  final VerificationMeta _areaMeta = const VerificationMeta('area');
  GeneratedRealColumn _area;
  @override
  GeneratedRealColumn get area => _area ??= _constructArea();
  GeneratedRealColumn _constructArea() {
    return GeneratedRealColumn(
      'area',
      $tableName,
      false,
    );
  }

  final VerificationMeta _farmAddressMeta =
      const VerificationMeta('farmAddress');
  GeneratedTextColumn _farmAddress;
  @override
  GeneratedTextColumn get farmAddress =>
      _farmAddress ??= _constructFarmAddress();
  GeneratedTextColumn _constructFarmAddress() {
    return GeneratedTextColumn(
      'farm_address',
      $tableName,
      false,
    );
  }

  final VerificationMeta _cityMeta = const VerificationMeta('city');
  GeneratedTextColumn _city;
  @override
  GeneratedTextColumn get city => _city ??= _constructCity();
  GeneratedTextColumn _constructCity() {
    return GeneratedTextColumn(
      'city',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ufMeta = const VerificationMeta('uf');
  GeneratedTextColumn _uf;
  @override
  GeneratedTextColumn get uf => _uf ??= _constructUf();
  GeneratedTextColumn _constructUf() {
    return GeneratedTextColumn(
      'uf',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, farmName, document, area, farmAddress, city, uf];
  @override
  $FarmsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'farms';
  @override
  final String actualTableName = 'farms';
  @override
  VerificationContext validateIntegrity(Insertable<Farm> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('farm_name')) {
      context.handle(_farmNameMeta,
          farmName.isAcceptableOrUnknown(data['farm_name'], _farmNameMeta));
    } else if (isInserting) {
      context.missing(_farmNameMeta);
    }
    if (data.containsKey('document')) {
      context.handle(_documentMeta,
          document.isAcceptableOrUnknown(data['document'], _documentMeta));
    } else if (isInserting) {
      context.missing(_documentMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
          _areaMeta, area.isAcceptableOrUnknown(data['area'], _areaMeta));
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    if (data.containsKey('farm_address')) {
      context.handle(
          _farmAddressMeta,
          farmAddress.isAcceptableOrUnknown(
              data['farm_address'], _farmAddressMeta));
    } else if (isInserting) {
      context.missing(_farmAddressMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city'], _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('uf')) {
      context.handle(_ufMeta, uf.isAcceptableOrUnknown(data['uf'], _ufMeta));
    } else if (isInserting) {
      context.missing(_ufMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Farm map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Farm.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FarmsTable createAlias(String alias) {
    return $FarmsTable(_db, alias);
  }
}

class Pasture extends DataClass implements Insertable<Pasture> {
  final String id;
  final String farmId;
  final String pastureName;
  final double area;
  final int grassType;
  final int vigor;
  final int port;
  final String descriptionText;
  Pasture(
      {@required this.id,
      @required this.farmId,
      @required this.pastureName,
      @required this.area,
      @required this.grassType,
      @required this.vigor,
      @required this.port,
      @required this.descriptionText});
  factory Pasture.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final intType = db.typeSystem.forDartType<int>();
    return Pasture(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      farmId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}farm_id']),
      pastureName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pasture_name']),
      area: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}area']),
      grassType:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}grass_type']),
      vigor: intType.mapFromDatabaseResponse(data['${effectivePrefix}vigor']),
      port: intType.mapFromDatabaseResponse(data['${effectivePrefix}port']),
      descriptionText: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description_text']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || farmId != null) {
      map['farm_id'] = Variable<String>(farmId);
    }
    if (!nullToAbsent || pastureName != null) {
      map['pasture_name'] = Variable<String>(pastureName);
    }
    if (!nullToAbsent || area != null) {
      map['area'] = Variable<double>(area);
    }
    if (!nullToAbsent || grassType != null) {
      map['grass_type'] = Variable<int>(grassType);
    }
    if (!nullToAbsent || vigor != null) {
      map['vigor'] = Variable<int>(vigor);
    }
    if (!nullToAbsent || port != null) {
      map['port'] = Variable<int>(port);
    }
    if (!nullToAbsent || descriptionText != null) {
      map['description_text'] = Variable<String>(descriptionText);
    }
    return map;
  }

  factory Pasture.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Pasture(
      id: serializer.fromJson<String>(json['id']),
      farmId: serializer.fromJson<String>(json['farmId']),
      pastureName: serializer.fromJson<String>(json['pastureName']),
      area: serializer.fromJson<double>(json['area']),
      grassType: serializer.fromJson<int>(json['grassType']),
      vigor: serializer.fromJson<int>(json['vigor']),
      port: serializer.fromJson<int>(json['port']),
      descriptionText: serializer.fromJson<String>(json['descriptionText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'farmId': serializer.toJson<String>(farmId),
      'pastureName': serializer.toJson<String>(pastureName),
      'area': serializer.toJson<double>(area),
      'grassType': serializer.toJson<int>(grassType),
      'vigor': serializer.toJson<int>(vigor),
      'port': serializer.toJson<int>(port),
      'descriptionText': serializer.toJson<String>(descriptionText),
    };
  }

  Pasture copyWith(
          {String id,
          String farmId,
          String pastureName,
          double area,
          int grassType,
          int vigor,
          int port,
          String descriptionText}) =>
      Pasture(
        id: id ?? this.id,
        farmId: farmId ?? this.farmId,
        pastureName: pastureName ?? this.pastureName,
        area: area ?? this.area,
        grassType: grassType ?? this.grassType,
        vigor: vigor ?? this.vigor,
        port: port ?? this.port,
        descriptionText: descriptionText ?? this.descriptionText,
      );
  @override
  String toString() {
    return (StringBuffer('Pasture(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('pastureName: $pastureName, ')
          ..write('area: $area, ')
          ..write('grassType: $grassType, ')
          ..write('vigor: $vigor, ')
          ..write('port: $port, ')
          ..write('descriptionText: $descriptionText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          farmId.hashCode,
          $mrjc(
              pastureName.hashCode,
              $mrjc(
                  area.hashCode,
                  $mrjc(
                      grassType.hashCode,
                      $mrjc(vigor.hashCode,
                          $mrjc(port.hashCode, descriptionText.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Pasture &&
          other.id == this.id &&
          other.farmId == this.farmId &&
          other.pastureName == this.pastureName &&
          other.area == this.area &&
          other.grassType == this.grassType &&
          other.vigor == this.vigor &&
          other.port == this.port &&
          other.descriptionText == this.descriptionText);
}

class PasturesCompanion extends UpdateCompanion<Pasture> {
  final Value<String> id;
  final Value<String> farmId;
  final Value<String> pastureName;
  final Value<double> area;
  final Value<int> grassType;
  final Value<int> vigor;
  final Value<int> port;
  final Value<String> descriptionText;
  const PasturesCompanion({
    this.id = const Value.absent(),
    this.farmId = const Value.absent(),
    this.pastureName = const Value.absent(),
    this.area = const Value.absent(),
    this.grassType = const Value.absent(),
    this.vigor = const Value.absent(),
    this.port = const Value.absent(),
    this.descriptionText = const Value.absent(),
  });
  PasturesCompanion.insert({
    this.id = const Value.absent(),
    @required String farmId,
    @required String pastureName,
    @required double area,
    @required int grassType,
    @required int vigor,
    @required int port,
    @required String descriptionText,
  })  : farmId = Value(farmId),
        pastureName = Value(pastureName),
        area = Value(area),
        grassType = Value(grassType),
        vigor = Value(vigor),
        port = Value(port),
        descriptionText = Value(descriptionText);
  static Insertable<Pasture> custom({
    Expression<String> id,
    Expression<String> farmId,
    Expression<String> pastureName,
    Expression<double> area,
    Expression<int> grassType,
    Expression<int> vigor,
    Expression<int> port,
    Expression<String> descriptionText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (farmId != null) 'farm_id': farmId,
      if (pastureName != null) 'pasture_name': pastureName,
      if (area != null) 'area': area,
      if (grassType != null) 'grass_type': grassType,
      if (vigor != null) 'vigor': vigor,
      if (port != null) 'port': port,
      if (descriptionText != null) 'description_text': descriptionText,
    });
  }

  PasturesCompanion copyWith(
      {Value<String> id,
      Value<String> farmId,
      Value<String> pastureName,
      Value<double> area,
      Value<int> grassType,
      Value<int> vigor,
      Value<int> port,
      Value<String> descriptionText}) {
    return PasturesCompanion(
      id: id ?? this.id,
      farmId: farmId ?? this.farmId,
      pastureName: pastureName ?? this.pastureName,
      area: area ?? this.area,
      grassType: grassType ?? this.grassType,
      vigor: vigor ?? this.vigor,
      port: port ?? this.port,
      descriptionText: descriptionText ?? this.descriptionText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (farmId.present) {
      map['farm_id'] = Variable<String>(farmId.value);
    }
    if (pastureName.present) {
      map['pasture_name'] = Variable<String>(pastureName.value);
    }
    if (area.present) {
      map['area'] = Variable<double>(area.value);
    }
    if (grassType.present) {
      map['grass_type'] = Variable<int>(grassType.value);
    }
    if (vigor.present) {
      map['vigor'] = Variable<int>(vigor.value);
    }
    if (port.present) {
      map['port'] = Variable<int>(port.value);
    }
    if (descriptionText.present) {
      map['description_text'] = Variable<String>(descriptionText.value);
    }
    return map;
  }
}

class $PasturesTable extends Pastures with TableInfo<$PasturesTable, Pasture> {
  final GeneratedDatabase _db;
  final String _alias;
  $PasturesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    )..clientDefault = () => _uuid.v4();
  }

  final VerificationMeta _farmIdMeta = const VerificationMeta('farmId');
  GeneratedTextColumn _farmId;
  @override
  GeneratedTextColumn get farmId => _farmId ??= _constructFarmId();
  GeneratedTextColumn _constructFarmId() {
    return GeneratedTextColumn(
      'farm_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pastureNameMeta =
      const VerificationMeta('pastureName');
  GeneratedTextColumn _pastureName;
  @override
  GeneratedTextColumn get pastureName =>
      _pastureName ??= _constructPastureName();
  GeneratedTextColumn _constructPastureName() {
    return GeneratedTextColumn('pasture_name', $tableName, false,
        minTextLength: 1, maxTextLength: 30);
  }

  final VerificationMeta _areaMeta = const VerificationMeta('area');
  GeneratedRealColumn _area;
  @override
  GeneratedRealColumn get area => _area ??= _constructArea();
  GeneratedRealColumn _constructArea() {
    return GeneratedRealColumn(
      'area',
      $tableName,
      false,
    );
  }

  final VerificationMeta _grassTypeMeta = const VerificationMeta('grassType');
  GeneratedIntColumn _grassType;
  @override
  GeneratedIntColumn get grassType => _grassType ??= _constructGrassType();
  GeneratedIntColumn _constructGrassType() {
    return GeneratedIntColumn(
      'grass_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _vigorMeta = const VerificationMeta('vigor');
  GeneratedIntColumn _vigor;
  @override
  GeneratedIntColumn get vigor => _vigor ??= _constructVigor();
  GeneratedIntColumn _constructVigor() {
    return GeneratedIntColumn(
      'vigor',
      $tableName,
      false,
    );
  }

  final VerificationMeta _portMeta = const VerificationMeta('port');
  GeneratedIntColumn _port;
  @override
  GeneratedIntColumn get port => _port ??= _constructPort();
  GeneratedIntColumn _constructPort() {
    return GeneratedIntColumn(
      'port',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionTextMeta =
      const VerificationMeta('descriptionText');
  GeneratedTextColumn _descriptionText;
  @override
  GeneratedTextColumn get descriptionText =>
      _descriptionText ??= _constructDescriptionText();
  GeneratedTextColumn _constructDescriptionText() {
    return GeneratedTextColumn(
      'description_text',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, farmId, pastureName, area, grassType, vigor, port, descriptionText];
  @override
  $PasturesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'pastures';
  @override
  final String actualTableName = 'pastures';
  @override
  VerificationContext validateIntegrity(Insertable<Pasture> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('farm_id')) {
      context.handle(_farmIdMeta,
          farmId.isAcceptableOrUnknown(data['farm_id'], _farmIdMeta));
    } else if (isInserting) {
      context.missing(_farmIdMeta);
    }
    if (data.containsKey('pasture_name')) {
      context.handle(
          _pastureNameMeta,
          pastureName.isAcceptableOrUnknown(
              data['pasture_name'], _pastureNameMeta));
    } else if (isInserting) {
      context.missing(_pastureNameMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
          _areaMeta, area.isAcceptableOrUnknown(data['area'], _areaMeta));
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    if (data.containsKey('grass_type')) {
      context.handle(_grassTypeMeta,
          grassType.isAcceptableOrUnknown(data['grass_type'], _grassTypeMeta));
    } else if (isInserting) {
      context.missing(_grassTypeMeta);
    }
    if (data.containsKey('vigor')) {
      context.handle(
          _vigorMeta, vigor.isAcceptableOrUnknown(data['vigor'], _vigorMeta));
    } else if (isInserting) {
      context.missing(_vigorMeta);
    }
    if (data.containsKey('port')) {
      context.handle(
          _portMeta, port.isAcceptableOrUnknown(data['port'], _portMeta));
    } else if (isInserting) {
      context.missing(_portMeta);
    }
    if (data.containsKey('description_text')) {
      context.handle(
          _descriptionTextMeta,
          descriptionText.isAcceptableOrUnknown(
              data['description_text'], _descriptionTextMeta));
    } else if (isInserting) {
      context.missing(_descriptionTextMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Pasture map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Pasture.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PasturesTable createAlias(String alias) {
    return $PasturesTable(_db, alias);
  }
}

class Evaluation extends DataClass implements Insertable<Evaluation> {
  final String id;
  final String userId;
  final String farmId;
  final String pastureId;
  final int tagPast;
  final double note;
  final DateTime evaluationDate;
  Evaluation(
      {@required this.id,
      @required this.userId,
      @required this.farmId,
      @required this.pastureId,
      @required this.tagPast,
      @required this.note,
      @required this.evaluationDate});
  factory Evaluation.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Evaluation(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      farmId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}farm_id']),
      pastureId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pasture_id']),
      tagPast:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}tag_past']),
      note: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      evaluationDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}evaluation_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    if (!nullToAbsent || farmId != null) {
      map['farm_id'] = Variable<String>(farmId);
    }
    if (!nullToAbsent || pastureId != null) {
      map['pasture_id'] = Variable<String>(pastureId);
    }
    if (!nullToAbsent || tagPast != null) {
      map['tag_past'] = Variable<int>(tagPast);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<double>(note);
    }
    if (!nullToAbsent || evaluationDate != null) {
      map['evaluation_date'] = Variable<DateTime>(evaluationDate);
    }
    return map;
  }

  factory Evaluation.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Evaluation(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      farmId: serializer.fromJson<String>(json['farmId']),
      pastureId: serializer.fromJson<String>(json['pastureId']),
      tagPast: serializer.fromJson<int>(json['tagPast']),
      note: serializer.fromJson<double>(json['note']),
      evaluationDate: serializer.fromJson<DateTime>(json['evaluationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'farmId': serializer.toJson<String>(farmId),
      'pastureId': serializer.toJson<String>(pastureId),
      'tagPast': serializer.toJson<int>(tagPast),
      'note': serializer.toJson<double>(note),
      'evaluationDate': serializer.toJson<String>(evaluationDate.toIso8601String()),
    };
  }

  Evaluation copyWith(
          {String id,
          String userId,
          String farmId,
          String pastureId,
          int tagPast,
          double note,
          DateTime evaluationDate}) =>
      Evaluation(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        farmId: farmId ?? this.farmId,
        pastureId: pastureId ?? this.pastureId,
        tagPast: tagPast ?? this.tagPast,
        note: note ?? this.note,
        evaluationDate: evaluationDate ?? this.evaluationDate,
      );
  @override
  String toString() {
    return (StringBuffer('Evaluation(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('farmId: $farmId, ')
          ..write('pastureId: $pastureId, ')
          ..write('tagPast: $tagPast, ')
          ..write('note: $note, ')
          ..write('evaluationDate: $evaluationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          userId.hashCode,
          $mrjc(
              farmId.hashCode,
              $mrjc(
                  pastureId.hashCode,
                  $mrjc(tagPast.hashCode,
                      $mrjc(note.hashCode, evaluationDate.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Evaluation &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.farmId == this.farmId &&
          other.pastureId == this.pastureId &&
          other.tagPast == this.tagPast &&
          other.note == this.note &&
          other.evaluationDate == this.evaluationDate);
}

class EvaluationsCompanion extends UpdateCompanion<Evaluation> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> farmId;
  final Value<String> pastureId;
  final Value<int> tagPast;
  final Value<double> note;
  final Value<DateTime> evaluationDate;
  const EvaluationsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.farmId = const Value.absent(),
    this.pastureId = const Value.absent(),
    this.tagPast = const Value.absent(),
    this.note = const Value.absent(),
    this.evaluationDate = const Value.absent(),
  });
  EvaluationsCompanion.insert({
    this.id = const Value.absent(),
    @required String userId,
    @required String farmId,
    @required String pastureId,
    @required int tagPast,
    @required double note,
    @required DateTime evaluationDate,
  })  : userId = Value(userId),
        farmId = Value(farmId),
        pastureId = Value(pastureId),
        tagPast = Value(tagPast),
        note = Value(note),
        evaluationDate = Value(evaluationDate);
  static Insertable<Evaluation> custom({
    Expression<String> id,
    Expression<String> userId,
    Expression<String> farmId,
    Expression<String> pastureId,
    Expression<int> tagPast,
    Expression<double> note,
    Expression<DateTime> evaluationDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (farmId != null) 'farm_id': farmId,
      if (pastureId != null) 'pasture_id': pastureId,
      if (tagPast != null) 'tag_past': tagPast,
      if (note != null) 'note': note,
      if (evaluationDate != null) 'evaluation_date': evaluationDate,
    });
  }

  EvaluationsCompanion copyWith(
      {Value<String> id,
      Value<String> userId,
      Value<String> farmId,
      Value<String> pastureId,
      Value<int> tagPast,
      Value<double> note,
      Value<DateTime> evaluationDate}) {
    return EvaluationsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      farmId: farmId ?? this.farmId,
      pastureId: pastureId ?? this.pastureId,
      tagPast: tagPast ?? this.tagPast,
      note: note ?? this.note,
      evaluationDate: evaluationDate ?? this.evaluationDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (farmId.present) {
      map['farm_id'] = Variable<String>(farmId.value);
    }
    if (pastureId.present) {
      map['pasture_id'] = Variable<String>(pastureId.value);
    }
    if (tagPast.present) {
      map['tag_past'] = Variable<int>(tagPast.value);
    }
    if (note.present) {
      map['note'] = Variable<double>(note.value);
    }
    if (evaluationDate.present) {
      map['evaluation_date'] = Variable<DateTime>(evaluationDate.value);
    }
    return map;
  }
}

class $EvaluationsTable extends Evaluations
    with TableInfo<$EvaluationsTable, Evaluation> {
  final GeneratedDatabase _db;
  final String _alias;
  $EvaluationsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    )..clientDefault = () => _uuid.v4();
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedTextColumn _userId;
  @override
  GeneratedTextColumn get userId => _userId ??= _constructUserId();
  GeneratedTextColumn _constructUserId() {
    return GeneratedTextColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _farmIdMeta = const VerificationMeta('farmId');
  GeneratedTextColumn _farmId;
  @override
  GeneratedTextColumn get farmId => _farmId ??= _constructFarmId();
  GeneratedTextColumn _constructFarmId() {
    return GeneratedTextColumn(
      'farm_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pastureIdMeta = const VerificationMeta('pastureId');
  GeneratedTextColumn _pastureId;
  @override
  GeneratedTextColumn get pastureId => _pastureId ??= _constructPastureId();
  GeneratedTextColumn _constructPastureId() {
    return GeneratedTextColumn(
      'pasture_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tagPastMeta = const VerificationMeta('tagPast');
  GeneratedIntColumn _tagPast;
  @override
  GeneratedIntColumn get tagPast => _tagPast ??= _constructTagPast();
  GeneratedIntColumn _constructTagPast() {
    return GeneratedIntColumn(
      'tag_past',
      $tableName,
      false,
    );
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedRealColumn _note;
  @override
  GeneratedRealColumn get note => _note ??= _constructNote();
  GeneratedRealColumn _constructNote() {
    return GeneratedRealColumn(
      'note',
      $tableName,
      false,
    );
  }

  final VerificationMeta _evaluationDateMeta =
      const VerificationMeta('evaluationDate');
  GeneratedDateTimeColumn _evaluationDate;
  @override
  GeneratedDateTimeColumn get evaluationDate =>
      _evaluationDate ??= _constructEvaluationDate();
  GeneratedDateTimeColumn _constructEvaluationDate() {
    return GeneratedDateTimeColumn(
      'evaluation_date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, farmId, pastureId, tagPast, note, evaluationDate];
  @override
  $EvaluationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'evaluations';
  @override
  final String actualTableName = 'evaluations';
  @override
  VerificationContext validateIntegrity(Insertable<Evaluation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('farm_id')) {
      context.handle(_farmIdMeta,
          farmId.isAcceptableOrUnknown(data['farm_id'], _farmIdMeta));
    } else if (isInserting) {
      context.missing(_farmIdMeta);
    }
    if (data.containsKey('pasture_id')) {
      context.handle(_pastureIdMeta,
          pastureId.isAcceptableOrUnknown(data['pasture_id'], _pastureIdMeta));
    } else if (isInserting) {
      context.missing(_pastureIdMeta);
    }
    if (data.containsKey('tag_past')) {
      context.handle(_tagPastMeta,
          tagPast.isAcceptableOrUnknown(data['tag_past'], _tagPastMeta));
    } else if (isInserting) {
      context.missing(_tagPastMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('evaluation_date')) {
      context.handle(
          _evaluationDateMeta,
          evaluationDate.isAcceptableOrUnknown(
              data['evaluation_date'], _evaluationDateMeta));
    } else if (isInserting) {
      context.missing(_evaluationDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Evaluation map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Evaluation.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EvaluationsTable createAlias(String alias) {
    return $EvaluationsTable(_db, alias);
  }
}

abstract class _$DatabasePM extends GeneratedDatabase {
  _$DatabasePM(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $FarmsTable _farms;
  $FarmsTable get farms => _farms ??= $FarmsTable(this);
  $PasturesTable _pastures;
  $PasturesTable get pastures => _pastures ??= $PasturesTable(this);
  $EvaluationsTable _evaluations;
  $EvaluationsTable get evaluations => _evaluations ??= $EvaluationsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [farms, pastures, evaluations];
}
