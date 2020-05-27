// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DatabasePM.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Pasture extends DataClass implements Insertable<Pasture> {
  final String id;
  final String farmId;
  final String pastureName;
  final double area;
  final String grassType;
  final String vigor;
  final String port;
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
    return Pasture(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      farmId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}farm_id']),
      pastureName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pasture_name']),
      area: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}area']),
      grassType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}grass_type']),
      vigor:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}vigor']),
      port: stringType.mapFromDatabaseResponse(data['${effectivePrefix}port']),
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
      map['grass_type'] = Variable<String>(grassType);
    }
    if (!nullToAbsent || vigor != null) {
      map['vigor'] = Variable<String>(vigor);
    }
    if (!nullToAbsent || port != null) {
      map['port'] = Variable<String>(port);
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
      grassType: serializer.fromJson<String>(json['grassType']),
      vigor: serializer.fromJson<String>(json['vigor']),
      port: serializer.fromJson<String>(json['port']),
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
      'grassType': serializer.toJson<String>(grassType),
      'vigor': serializer.toJson<String>(vigor),
      'port': serializer.toJson<String>(port),
      'descriptionText': serializer.toJson<String>(descriptionText),
    };
  }

  Pasture copyWith(
          {String id,
          String farmId,
          String pastureName,
          double area,
          String grassType,
          String vigor,
          String port,
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
  final Value<String> grassType;
  final Value<String> vigor;
  final Value<String> port;
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
    this.farmId = const Value.absent(),
    @required String pastureName,
    @required double area,
    @required String grassType,
    @required String vigor,
    @required String port,
    @required String descriptionText,
  })  : pastureName = Value(pastureName),
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
    Expression<String> grassType,
    Expression<String> vigor,
    Expression<String> port,
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
      Value<String> grassType,
      Value<String> vigor,
      Value<String> port,
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
      map['grass_type'] = Variable<String>(grassType.value);
    }
    if (vigor.present) {
      map['vigor'] = Variable<String>(vigor.value);
    }
    if (port.present) {
      map['port'] = Variable<String>(port.value);
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
    )..clientDefault = () => _uuid.v4();
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
  GeneratedTextColumn _grassType;
  @override
  GeneratedTextColumn get grassType => _grassType ??= _constructGrassType();
  GeneratedTextColumn _constructGrassType() {
    return GeneratedTextColumn(
      'grass_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _vigorMeta = const VerificationMeta('vigor');
  GeneratedTextColumn _vigor;
  @override
  GeneratedTextColumn get vigor => _vigor ??= _constructVigor();
  GeneratedTextColumn _constructVigor() {
    return GeneratedTextColumn(
      'vigor',
      $tableName,
      false,
    );
  }

  final VerificationMeta _portMeta = const VerificationMeta('port');
  GeneratedTextColumn _port;
  @override
  GeneratedTextColumn get port => _port ??= _constructPort();
  GeneratedTextColumn _constructPort() {
    return GeneratedTextColumn(
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
  final String idPasture;
  final String tagPast;
  final double note;
  final DateTime evaluationDate;
  Evaluation(
      {@required this.id,
      @required this.userId,
      @required this.farmId,
      @required this.idPasture,
      @required this.tagPast,
      @required this.note,
      @required this.evaluationDate});
  factory Evaluation.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Evaluation(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      farmId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}farm_id']),
      idPasture: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_pasture']),
      tagPast: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}tag_past']),
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
    if (!nullToAbsent || idPasture != null) {
      map['id_pasture'] = Variable<String>(idPasture);
    }
    if (!nullToAbsent || tagPast != null) {
      map['tag_past'] = Variable<String>(tagPast);
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
      idPasture: serializer.fromJson<String>(json['idPasture']),
      tagPast: serializer.fromJson<String>(json['tagPast']),
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
      'idPasture': serializer.toJson<String>(idPasture),
      'tagPast': serializer.toJson<String>(tagPast),
      'note': serializer.toJson<double>(note),
      'evaluationDate': serializer.toJson<DateTime>(evaluationDate),
    };
  }

  Evaluation copyWith(
          {String id,
          String userId,
          String farmId,
          String idPasture,
          String tagPast,
          double note,
          DateTime evaluationDate}) =>
      Evaluation(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        farmId: farmId ?? this.farmId,
        idPasture: idPasture ?? this.idPasture,
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
          ..write('idPasture: $idPasture, ')
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
                  idPasture.hashCode,
                  $mrjc(tagPast.hashCode,
                      $mrjc(note.hashCode, evaluationDate.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Evaluation &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.farmId == this.farmId &&
          other.idPasture == this.idPasture &&
          other.tagPast == this.tagPast &&
          other.note == this.note &&
          other.evaluationDate == this.evaluationDate);
}

class EvaluationsCompanion extends UpdateCompanion<Evaluation> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> farmId;
  final Value<String> idPasture;
  final Value<String> tagPast;
  final Value<double> note;
  final Value<DateTime> evaluationDate;
  const EvaluationsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.farmId = const Value.absent(),
    this.idPasture = const Value.absent(),
    this.tagPast = const Value.absent(),
    this.note = const Value.absent(),
    this.evaluationDate = const Value.absent(),
  });
  EvaluationsCompanion.insert({
    this.id = const Value.absent(),
    @required String userId,
    @required String farmId,
    @required String idPasture,
    @required String tagPast,
    @required double note,
    @required DateTime evaluationDate,
  })  : userId = Value(userId),
        farmId = Value(farmId),
        idPasture = Value(idPasture),
        tagPast = Value(tagPast),
        note = Value(note),
        evaluationDate = Value(evaluationDate);
  static Insertable<Evaluation> custom({
    Expression<String> id,
    Expression<String> userId,
    Expression<String> farmId,
    Expression<String> idPasture,
    Expression<String> tagPast,
    Expression<double> note,
    Expression<DateTime> evaluationDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (farmId != null) 'farm_id': farmId,
      if (idPasture != null) 'id_pasture': idPasture,
      if (tagPast != null) 'tag_past': tagPast,
      if (note != null) 'note': note,
      if (evaluationDate != null) 'evaluation_date': evaluationDate,
    });
  }

  EvaluationsCompanion copyWith(
      {Value<String> id,
      Value<String> userId,
      Value<String> farmId,
      Value<String> idPasture,
      Value<String> tagPast,
      Value<double> note,
      Value<DateTime> evaluationDate}) {
    return EvaluationsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      farmId: farmId ?? this.farmId,
      idPasture: idPasture ?? this.idPasture,
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
    if (idPasture.present) {
      map['id_pasture'] = Variable<String>(idPasture.value);
    }
    if (tagPast.present) {
      map['tag_past'] = Variable<String>(tagPast.value);
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

  final VerificationMeta _idPastureMeta = const VerificationMeta('idPasture');
  GeneratedTextColumn _idPasture;
  @override
  GeneratedTextColumn get idPasture => _idPasture ??= _constructIdPasture();
  GeneratedTextColumn _constructIdPasture() {
    return GeneratedTextColumn(
      'id_pasture',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tagPastMeta = const VerificationMeta('tagPast');
  GeneratedTextColumn _tagPast;
  @override
  GeneratedTextColumn get tagPast => _tagPast ??= _constructTagPast();
  GeneratedTextColumn _constructTagPast() {
    return GeneratedTextColumn(
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
      [id, userId, farmId, idPasture, tagPast, note, evaluationDate];
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
    if (data.containsKey('id_pasture')) {
      context.handle(_idPastureMeta,
          idPasture.isAcceptableOrUnknown(data['id_pasture'], _idPastureMeta));
    } else if (isInserting) {
      context.missing(_idPastureMeta);
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
  $PasturesTable _pastures;
  $PasturesTable get pastures => _pastures ??= $PasturesTable(this);
  $EvaluationsTable _evaluations;
  $EvaluationsTable get evaluations => _evaluations ??= $EvaluationsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pastures, evaluations];
}
