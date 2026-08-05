// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DivisionsTable extends Divisions
    with TableInfo<$DivisionsTable, Division> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DivisionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<DivisionType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DivisionType>($DivisionsTable.$convertertype);
  static const VerificationMeta _numeroMeta = const VerificationMeta('numero');
  @override
  late final GeneratedColumn<String> numero = GeneratedColumn<String>(
    'numero',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _intituleMeta = const VerificationMeta(
    'intitule',
  );
  @override
  late final GeneratedColumn<String> intitule = GeneratedColumn<String>(
    'intitule',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ordreMeta = const VerificationMeta('ordre');
  @override
  late final GeneratedColumn<int> ordre = GeneratedColumn<int>(
    'ordre',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cheminMeta = const VerificationMeta('chemin');
  @override
  late final GeneratedColumn<String> chemin = GeneratedColumn<String>(
    'chemin',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES divisions (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    numero,
    intitule,
    ordre,
    chemin,
    parentId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'divisions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Division> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('numero')) {
      context.handle(
        _numeroMeta,
        numero.isAcceptableOrUnknown(data['numero']!, _numeroMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroMeta);
    }
    if (data.containsKey('intitule')) {
      context.handle(
        _intituleMeta,
        intitule.isAcceptableOrUnknown(data['intitule']!, _intituleMeta),
      );
    } else if (isInserting) {
      context.missing(_intituleMeta);
    }
    if (data.containsKey('ordre')) {
      context.handle(
        _ordreMeta,
        ordre.isAcceptableOrUnknown(data['ordre']!, _ordreMeta),
      );
    } else if (isInserting) {
      context.missing(_ordreMeta);
    }
    if (data.containsKey('chemin')) {
      context.handle(
        _cheminMeta,
        chemin.isAcceptableOrUnknown(data['chemin']!, _cheminMeta),
      );
    } else if (isInserting) {
      context.missing(_cheminMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Division map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Division(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: $DivisionsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      numero: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}numero'],
      )!,
      intitule: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intitule'],
      )!,
      ordre: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ordre'],
      )!,
      chemin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chemin'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_id'],
      ),
    );
  }

  @override
  $DivisionsTable createAlias(String alias) {
    return $DivisionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DivisionType, String, String> $convertertype =
      const EnumNameConverter<DivisionType>(DivisionType.values);
}

class Division extends DataClass implements Insertable<Division> {
  final int id;
  final DivisionType type;
  final String numero;
  final String intitule;
  final int ordre;
  final String chemin;
  final int? parentId;
  const Division({
    required this.id,
    required this.type,
    required this.numero,
    required this.intitule,
    required this.ordre,
    required this.chemin,
    this.parentId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['type'] = Variable<String>(
        $DivisionsTable.$convertertype.toSql(type),
      );
    }
    map['numero'] = Variable<String>(numero);
    map['intitule'] = Variable<String>(intitule);
    map['ordre'] = Variable<int>(ordre);
    map['chemin'] = Variable<String>(chemin);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    return map;
  }

  DivisionsCompanion toCompanion(bool nullToAbsent) {
    return DivisionsCompanion(
      id: Value(id),
      type: Value(type),
      numero: Value(numero),
      intitule: Value(intitule),
      ordre: Value(ordre),
      chemin: Value(chemin),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
    );
  }

  factory Division.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Division(
      id: serializer.fromJson<int>(json['id']),
      type: $DivisionsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      numero: serializer.fromJson<String>(json['numero']),
      intitule: serializer.fromJson<String>(json['intitule']),
      ordre: serializer.fromJson<int>(json['ordre']),
      chemin: serializer.fromJson<String>(json['chemin']),
      parentId: serializer.fromJson<int?>(json['parentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(
        $DivisionsTable.$convertertype.toJson(type),
      ),
      'numero': serializer.toJson<String>(numero),
      'intitule': serializer.toJson<String>(intitule),
      'ordre': serializer.toJson<int>(ordre),
      'chemin': serializer.toJson<String>(chemin),
      'parentId': serializer.toJson<int?>(parentId),
    };
  }

  Division copyWith({
    int? id,
    DivisionType? type,
    String? numero,
    String? intitule,
    int? ordre,
    String? chemin,
    Value<int?> parentId = const Value.absent(),
  }) => Division(
    id: id ?? this.id,
    type: type ?? this.type,
    numero: numero ?? this.numero,
    intitule: intitule ?? this.intitule,
    ordre: ordre ?? this.ordre,
    chemin: chemin ?? this.chemin,
    parentId: parentId.present ? parentId.value : this.parentId,
  );
  Division copyWithCompanion(DivisionsCompanion data) {
    return Division(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      numero: data.numero.present ? data.numero.value : this.numero,
      intitule: data.intitule.present ? data.intitule.value : this.intitule,
      ordre: data.ordre.present ? data.ordre.value : this.ordre,
      chemin: data.chemin.present ? data.chemin.value : this.chemin,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Division(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('numero: $numero, ')
          ..write('intitule: $intitule, ')
          ..write('ordre: $ordre, ')
          ..write('chemin: $chemin, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, type, numero, intitule, ordre, chemin, parentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Division &&
          other.id == this.id &&
          other.type == this.type &&
          other.numero == this.numero &&
          other.intitule == this.intitule &&
          other.ordre == this.ordre &&
          other.chemin == this.chemin &&
          other.parentId == this.parentId);
}

class DivisionsCompanion extends UpdateCompanion<Division> {
  final Value<int> id;
  final Value<DivisionType> type;
  final Value<String> numero;
  final Value<String> intitule;
  final Value<int> ordre;
  final Value<String> chemin;
  final Value<int?> parentId;
  const DivisionsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.numero = const Value.absent(),
    this.intitule = const Value.absent(),
    this.ordre = const Value.absent(),
    this.chemin = const Value.absent(),
    this.parentId = const Value.absent(),
  });
  DivisionsCompanion.insert({
    this.id = const Value.absent(),
    required DivisionType type,
    required String numero,
    required String intitule,
    required int ordre,
    required String chemin,
    this.parentId = const Value.absent(),
  }) : type = Value(type),
       numero = Value(numero),
       intitule = Value(intitule),
       ordre = Value(ordre),
       chemin = Value(chemin);
  static Insertable<Division> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? numero,
    Expression<String>? intitule,
    Expression<int>? ordre,
    Expression<String>? chemin,
    Expression<int>? parentId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (numero != null) 'numero': numero,
      if (intitule != null) 'intitule': intitule,
      if (ordre != null) 'ordre': ordre,
      if (chemin != null) 'chemin': chemin,
      if (parentId != null) 'parent_id': parentId,
    });
  }

  DivisionsCompanion copyWith({
    Value<int>? id,
    Value<DivisionType>? type,
    Value<String>? numero,
    Value<String>? intitule,
    Value<int>? ordre,
    Value<String>? chemin,
    Value<int?>? parentId,
  }) {
    return DivisionsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      numero: numero ?? this.numero,
      intitule: intitule ?? this.intitule,
      ordre: ordre ?? this.ordre,
      chemin: chemin ?? this.chemin,
      parentId: parentId ?? this.parentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $DivisionsTable.$convertertype.toSql(type.value),
      );
    }
    if (numero.present) {
      map['numero'] = Variable<String>(numero.value);
    }
    if (intitule.present) {
      map['intitule'] = Variable<String>(intitule.value);
    }
    if (ordre.present) {
      map['ordre'] = Variable<int>(ordre.value);
    }
    if (chemin.present) {
      map['chemin'] = Variable<String>(chemin.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DivisionsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('numero: $numero, ')
          ..write('intitule: $intitule, ')
          ..write('ordre: $ordre, ')
          ..write('chemin: $chemin, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }
}

class $ArticlesTable extends Articles with TableInfo<$ArticlesTable, Article> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _divisionIdMeta = const VerificationMeta(
    'divisionId',
  );
  @override
  late final GeneratedColumn<int> divisionId = GeneratedColumn<int>(
    'division_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES divisions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _numeroMeta = const VerificationMeta('numero');
  @override
  late final GeneratedColumn<String> numero = GeneratedColumn<String>(
    'numero',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numeroTriMeta = const VerificationMeta(
    'numeroTri',
  );
  @override
  late final GeneratedColumn<double> numeroTri = GeneratedColumn<double>(
    'numero_tri',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ordreMeta = const VerificationMeta('ordre');
  @override
  late final GeneratedColumn<int> ordre = GeneratedColumn<int>(
    'ordre',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statutMeta = const VerificationMeta('statut');
  @override
  late final GeneratedColumn<String> statut = GeneratedColumn<String>(
    'statut',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _texteSourceMeta = const VerificationMeta(
    'texteSource',
  );
  @override
  late final GeneratedColumn<String> texteSource = GeneratedColumn<String>(
    'texte_source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contenuMeta = const VerificationMeta(
    'contenu',
  );
  @override
  late final GeneratedColumn<String> contenu = GeneratedColumn<String>(
    'contenu',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contenuSlugMeta = const VerificationMeta(
    'contenuSlug',
  );
  @override
  late final GeneratedColumn<String> contenuSlug = GeneratedColumn<String>(
    'contenu_slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    divisionId,
    numero,
    numeroTri,
    ordre,
    statut,
    texteSource,
    contenu,
    contenuSlug,
    isFavorite,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'articles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Article> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('division_id')) {
      context.handle(
        _divisionIdMeta,
        divisionId.isAcceptableOrUnknown(data['division_id']!, _divisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_divisionIdMeta);
    }
    if (data.containsKey('numero')) {
      context.handle(
        _numeroMeta,
        numero.isAcceptableOrUnknown(data['numero']!, _numeroMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroMeta);
    }
    if (data.containsKey('numero_tri')) {
      context.handle(
        _numeroTriMeta,
        numeroTri.isAcceptableOrUnknown(data['numero_tri']!, _numeroTriMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroTriMeta);
    }
    if (data.containsKey('ordre')) {
      context.handle(
        _ordreMeta,
        ordre.isAcceptableOrUnknown(data['ordre']!, _ordreMeta),
      );
    } else if (isInserting) {
      context.missing(_ordreMeta);
    }
    if (data.containsKey('statut')) {
      context.handle(
        _statutMeta,
        statut.isAcceptableOrUnknown(data['statut']!, _statutMeta),
      );
    } else if (isInserting) {
      context.missing(_statutMeta);
    }
    if (data.containsKey('texte_source')) {
      context.handle(
        _texteSourceMeta,
        texteSource.isAcceptableOrUnknown(
          data['texte_source']!,
          _texteSourceMeta,
        ),
      );
    }
    if (data.containsKey('contenu')) {
      context.handle(
        _contenuMeta,
        contenu.isAcceptableOrUnknown(data['contenu']!, _contenuMeta),
      );
    } else if (isInserting) {
      context.missing(_contenuMeta);
    }
    if (data.containsKey('contenu_slug')) {
      context.handle(
        _contenuSlugMeta,
        contenuSlug.isAcceptableOrUnknown(
          data['contenu_slug']!,
          _contenuSlugMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contenuSlugMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Article map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Article(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      divisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}division_id'],
      )!,
      numero: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}numero'],
      )!,
      numeroTri: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}numero_tri'],
      )!,
      ordre: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ordre'],
      )!,
      statut: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}statut'],
      )!,
      texteSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}texte_source'],
      ),
      contenu: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contenu'],
      )!,
      contenuSlug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contenu_slug'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
    );
  }

  @override
  $ArticlesTable createAlias(String alias) {
    return $ArticlesTable(attachedDatabase, alias);
  }
}

class Article extends DataClass implements Insertable<Article> {
  final int id;
  final int divisionId;
  final String numero;
  final double numeroTri;
  final int ordre;
  final String statut;
  final String? texteSource;
  final String contenu;
  final String contenuSlug;
  final bool isFavorite;
  const Article({
    required this.id,
    required this.divisionId,
    required this.numero,
    required this.numeroTri,
    required this.ordre,
    required this.statut,
    this.texteSource,
    required this.contenu,
    required this.contenuSlug,
    required this.isFavorite,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['division_id'] = Variable<int>(divisionId);
    map['numero'] = Variable<String>(numero);
    map['numero_tri'] = Variable<double>(numeroTri);
    map['ordre'] = Variable<int>(ordre);
    map['statut'] = Variable<String>(statut);
    if (!nullToAbsent || texteSource != null) {
      map['texte_source'] = Variable<String>(texteSource);
    }
    map['contenu'] = Variable<String>(contenu);
    map['contenu_slug'] = Variable<String>(contenuSlug);
    map['is_favorite'] = Variable<bool>(isFavorite);
    return map;
  }

  ArticlesCompanion toCompanion(bool nullToAbsent) {
    return ArticlesCompanion(
      id: Value(id),
      divisionId: Value(divisionId),
      numero: Value(numero),
      numeroTri: Value(numeroTri),
      ordre: Value(ordre),
      statut: Value(statut),
      texteSource: texteSource == null && nullToAbsent
          ? const Value.absent()
          : Value(texteSource),
      contenu: Value(contenu),
      contenuSlug: Value(contenuSlug),
      isFavorite: Value(isFavorite),
    );
  }

  factory Article.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Article(
      id: serializer.fromJson<int>(json['id']),
      divisionId: serializer.fromJson<int>(json['divisionId']),
      numero: serializer.fromJson<String>(json['numero']),
      numeroTri: serializer.fromJson<double>(json['numeroTri']),
      ordre: serializer.fromJson<int>(json['ordre']),
      statut: serializer.fromJson<String>(json['statut']),
      texteSource: serializer.fromJson<String?>(json['texteSource']),
      contenu: serializer.fromJson<String>(json['contenu']),
      contenuSlug: serializer.fromJson<String>(json['contenuSlug']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'divisionId': serializer.toJson<int>(divisionId),
      'numero': serializer.toJson<String>(numero),
      'numeroTri': serializer.toJson<double>(numeroTri),
      'ordre': serializer.toJson<int>(ordre),
      'statut': serializer.toJson<String>(statut),
      'texteSource': serializer.toJson<String?>(texteSource),
      'contenu': serializer.toJson<String>(contenu),
      'contenuSlug': serializer.toJson<String>(contenuSlug),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  Article copyWith({
    int? id,
    int? divisionId,
    String? numero,
    double? numeroTri,
    int? ordre,
    String? statut,
    Value<String?> texteSource = const Value.absent(),
    String? contenu,
    String? contenuSlug,
    bool? isFavorite,
  }) => Article(
    id: id ?? this.id,
    divisionId: divisionId ?? this.divisionId,
    numero: numero ?? this.numero,
    numeroTri: numeroTri ?? this.numeroTri,
    ordre: ordre ?? this.ordre,
    statut: statut ?? this.statut,
    texteSource: texteSource.present ? texteSource.value : this.texteSource,
    contenu: contenu ?? this.contenu,
    contenuSlug: contenuSlug ?? this.contenuSlug,
    isFavorite: isFavorite ?? this.isFavorite,
  );
  Article copyWithCompanion(ArticlesCompanion data) {
    return Article(
      id: data.id.present ? data.id.value : this.id,
      divisionId: data.divisionId.present
          ? data.divisionId.value
          : this.divisionId,
      numero: data.numero.present ? data.numero.value : this.numero,
      numeroTri: data.numeroTri.present ? data.numeroTri.value : this.numeroTri,
      ordre: data.ordre.present ? data.ordre.value : this.ordre,
      statut: data.statut.present ? data.statut.value : this.statut,
      texteSource: data.texteSource.present
          ? data.texteSource.value
          : this.texteSource,
      contenu: data.contenu.present ? data.contenu.value : this.contenu,
      contenuSlug: data.contenuSlug.present
          ? data.contenuSlug.value
          : this.contenuSlug,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Article(')
          ..write('id: $id, ')
          ..write('divisionId: $divisionId, ')
          ..write('numero: $numero, ')
          ..write('numeroTri: $numeroTri, ')
          ..write('ordre: $ordre, ')
          ..write('statut: $statut, ')
          ..write('texteSource: $texteSource, ')
          ..write('contenu: $contenu, ')
          ..write('contenuSlug: $contenuSlug, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    divisionId,
    numero,
    numeroTri,
    ordre,
    statut,
    texteSource,
    contenu,
    contenuSlug,
    isFavorite,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Article &&
          other.id == this.id &&
          other.divisionId == this.divisionId &&
          other.numero == this.numero &&
          other.numeroTri == this.numeroTri &&
          other.ordre == this.ordre &&
          other.statut == this.statut &&
          other.texteSource == this.texteSource &&
          other.contenu == this.contenu &&
          other.contenuSlug == this.contenuSlug &&
          other.isFavorite == this.isFavorite);
}

class ArticlesCompanion extends UpdateCompanion<Article> {
  final Value<int> id;
  final Value<int> divisionId;
  final Value<String> numero;
  final Value<double> numeroTri;
  final Value<int> ordre;
  final Value<String> statut;
  final Value<String?> texteSource;
  final Value<String> contenu;
  final Value<String> contenuSlug;
  final Value<bool> isFavorite;
  const ArticlesCompanion({
    this.id = const Value.absent(),
    this.divisionId = const Value.absent(),
    this.numero = const Value.absent(),
    this.numeroTri = const Value.absent(),
    this.ordre = const Value.absent(),
    this.statut = const Value.absent(),
    this.texteSource = const Value.absent(),
    this.contenu = const Value.absent(),
    this.contenuSlug = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  ArticlesCompanion.insert({
    this.id = const Value.absent(),
    required int divisionId,
    required String numero,
    required double numeroTri,
    required int ordre,
    required String statut,
    this.texteSource = const Value.absent(),
    required String contenu,
    required String contenuSlug,
    this.isFavorite = const Value.absent(),
  }) : divisionId = Value(divisionId),
       numero = Value(numero),
       numeroTri = Value(numeroTri),
       ordre = Value(ordre),
       statut = Value(statut),
       contenu = Value(contenu),
       contenuSlug = Value(contenuSlug);
  static Insertable<Article> custom({
    Expression<int>? id,
    Expression<int>? divisionId,
    Expression<String>? numero,
    Expression<double>? numeroTri,
    Expression<int>? ordre,
    Expression<String>? statut,
    Expression<String>? texteSource,
    Expression<String>? contenu,
    Expression<String>? contenuSlug,
    Expression<bool>? isFavorite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (divisionId != null) 'division_id': divisionId,
      if (numero != null) 'numero': numero,
      if (numeroTri != null) 'numero_tri': numeroTri,
      if (ordre != null) 'ordre': ordre,
      if (statut != null) 'statut': statut,
      if (texteSource != null) 'texte_source': texteSource,
      if (contenu != null) 'contenu': contenu,
      if (contenuSlug != null) 'contenu_slug': contenuSlug,
      if (isFavorite != null) 'is_favorite': isFavorite,
    });
  }

  ArticlesCompanion copyWith({
    Value<int>? id,
    Value<int>? divisionId,
    Value<String>? numero,
    Value<double>? numeroTri,
    Value<int>? ordre,
    Value<String>? statut,
    Value<String?>? texteSource,
    Value<String>? contenu,
    Value<String>? contenuSlug,
    Value<bool>? isFavorite,
  }) {
    return ArticlesCompanion(
      id: id ?? this.id,
      divisionId: divisionId ?? this.divisionId,
      numero: numero ?? this.numero,
      numeroTri: numeroTri ?? this.numeroTri,
      ordre: ordre ?? this.ordre,
      statut: statut ?? this.statut,
      texteSource: texteSource ?? this.texteSource,
      contenu: contenu ?? this.contenu,
      contenuSlug: contenuSlug ?? this.contenuSlug,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (divisionId.present) {
      map['division_id'] = Variable<int>(divisionId.value);
    }
    if (numero.present) {
      map['numero'] = Variable<String>(numero.value);
    }
    if (numeroTri.present) {
      map['numero_tri'] = Variable<double>(numeroTri.value);
    }
    if (ordre.present) {
      map['ordre'] = Variable<int>(ordre.value);
    }
    if (statut.present) {
      map['statut'] = Variable<String>(statut.value);
    }
    if (texteSource.present) {
      map['texte_source'] = Variable<String>(texteSource.value);
    }
    if (contenu.present) {
      map['contenu'] = Variable<String>(contenu.value);
    }
    if (contenuSlug.present) {
      map['contenu_slug'] = Variable<String>(contenuSlug.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesCompanion(')
          ..write('id: $id, ')
          ..write('divisionId: $divisionId, ')
          ..write('numero: $numero, ')
          ..write('numeroTri: $numeroTri, ')
          ..write('ordre: $ordre, ')
          ..write('statut: $statut, ')
          ..write('texteSource: $texteSource, ')
          ..write('contenu: $contenu, ')
          ..write('contenuSlug: $contenuSlug, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DivisionsTable divisions = $DivisionsTable(this);
  late final $ArticlesTable articles = $ArticlesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [divisions, articles];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'divisions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('divisions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'divisions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('articles', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$DivisionsTableCreateCompanionBuilder =
    DivisionsCompanion Function({
      Value<int> id,
      required DivisionType type,
      required String numero,
      required String intitule,
      required int ordre,
      required String chemin,
      Value<int?> parentId,
    });
typedef $$DivisionsTableUpdateCompanionBuilder =
    DivisionsCompanion Function({
      Value<int> id,
      Value<DivisionType> type,
      Value<String> numero,
      Value<String> intitule,
      Value<int> ordre,
      Value<String> chemin,
      Value<int?> parentId,
    });

final class $$DivisionsTableReferences
    extends BaseReferences<_$AppDatabase, $DivisionsTable, Division> {
  $$DivisionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DivisionsTable _parentIdTable(_$AppDatabase db) =>
      db.divisions.createAlias('divisions__parent_id__divisions__id');

  $$DivisionsTableProcessedTableManager? get parentId {
    final $_column = $_itemColumn<int>('parent_id');
    if ($_column == null) return null;
    final manager = $$DivisionsTableTableManager(
      $_db,
      $_db.divisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ArticlesTable, List<Article>> _articlesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.articles,
    aliasName: 'divisions__id__articles__division_id',
  );

  $$ArticlesTableProcessedTableManager get articlesRefs {
    final manager = $$ArticlesTableTableManager(
      $_db,
      $_db.articles,
    ).filter((f) => f.divisionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_articlesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DivisionsTableFilterComposer
    extends Composer<_$AppDatabase, $DivisionsTable> {
  $$DivisionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DivisionType, DivisionType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get intitule => $composableBuilder(
    column: $table.intitule,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ordre => $composableBuilder(
    column: $table.ordre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chemin => $composableBuilder(
    column: $table.chemin,
    builder: (column) => ColumnFilters(column),
  );

  $$DivisionsTableFilterComposer get parentId {
    final $$DivisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.divisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DivisionsTableFilterComposer(
            $db: $db,
            $table: $db.divisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> articlesRefs(
    Expression<bool> Function($$ArticlesTableFilterComposer f) f,
  ) {
    final $$ArticlesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.articles,
      getReferencedColumn: (t) => t.divisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArticlesTableFilterComposer(
            $db: $db,
            $table: $db.articles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DivisionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DivisionsTable> {
  $$DivisionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get intitule => $composableBuilder(
    column: $table.intitule,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ordre => $composableBuilder(
    column: $table.ordre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chemin => $composableBuilder(
    column: $table.chemin,
    builder: (column) => ColumnOrderings(column),
  );

  $$DivisionsTableOrderingComposer get parentId {
    final $$DivisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.divisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DivisionsTableOrderingComposer(
            $db: $db,
            $table: $db.divisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DivisionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DivisionsTable> {
  $$DivisionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DivisionType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get numero =>
      $composableBuilder(column: $table.numero, builder: (column) => column);

  GeneratedColumn<String> get intitule =>
      $composableBuilder(column: $table.intitule, builder: (column) => column);

  GeneratedColumn<int> get ordre =>
      $composableBuilder(column: $table.ordre, builder: (column) => column);

  GeneratedColumn<String> get chemin =>
      $composableBuilder(column: $table.chemin, builder: (column) => column);

  $$DivisionsTableAnnotationComposer get parentId {
    final $$DivisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentId,
      referencedTable: $db.divisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DivisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.divisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> articlesRefs<T extends Object>(
    Expression<T> Function($$ArticlesTableAnnotationComposer a) f,
  ) {
    final $$ArticlesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.articles,
      getReferencedColumn: (t) => t.divisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArticlesTableAnnotationComposer(
            $db: $db,
            $table: $db.articles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DivisionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DivisionsTable,
          Division,
          $$DivisionsTableFilterComposer,
          $$DivisionsTableOrderingComposer,
          $$DivisionsTableAnnotationComposer,
          $$DivisionsTableCreateCompanionBuilder,
          $$DivisionsTableUpdateCompanionBuilder,
          (Division, $$DivisionsTableReferences),
          Division,
          PrefetchHooks Function({bool parentId, bool articlesRefs})
        > {
  $$DivisionsTableTableManager(_$AppDatabase db, $DivisionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DivisionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DivisionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DivisionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DivisionType> type = const Value.absent(),
                Value<String> numero = const Value.absent(),
                Value<String> intitule = const Value.absent(),
                Value<int> ordre = const Value.absent(),
                Value<String> chemin = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
              }) => DivisionsCompanion(
                id: id,
                type: type,
                numero: numero,
                intitule: intitule,
                ordre: ordre,
                chemin: chemin,
                parentId: parentId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DivisionType type,
                required String numero,
                required String intitule,
                required int ordre,
                required String chemin,
                Value<int?> parentId = const Value.absent(),
              }) => DivisionsCompanion.insert(
                id: id,
                type: type,
                numero: numero,
                intitule: intitule,
                ordre: ordre,
                chemin: chemin,
                parentId: parentId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DivisionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({parentId = false, articlesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (articlesRefs) db.articles],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (parentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.parentId,
                                referencedTable: $$DivisionsTableReferences
                                    ._parentIdTable(db),
                                referencedColumn: $$DivisionsTableReferences
                                    ._parentIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (articlesRefs)
                    await $_getPrefetchedData<
                      Division,
                      $DivisionsTable,
                      Article
                    >(
                      currentTable: table,
                      referencedTable: $$DivisionsTableReferences
                          ._articlesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$DivisionsTableReferences(
                            db,
                            table,
                            p0,
                          ).articlesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.divisionId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DivisionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DivisionsTable,
      Division,
      $$DivisionsTableFilterComposer,
      $$DivisionsTableOrderingComposer,
      $$DivisionsTableAnnotationComposer,
      $$DivisionsTableCreateCompanionBuilder,
      $$DivisionsTableUpdateCompanionBuilder,
      (Division, $$DivisionsTableReferences),
      Division,
      PrefetchHooks Function({bool parentId, bool articlesRefs})
    >;
typedef $$ArticlesTableCreateCompanionBuilder =
    ArticlesCompanion Function({
      Value<int> id,
      required int divisionId,
      required String numero,
      required double numeroTri,
      required int ordre,
      required String statut,
      Value<String?> texteSource,
      required String contenu,
      required String contenuSlug,
      Value<bool> isFavorite,
    });
typedef $$ArticlesTableUpdateCompanionBuilder =
    ArticlesCompanion Function({
      Value<int> id,
      Value<int> divisionId,
      Value<String> numero,
      Value<double> numeroTri,
      Value<int> ordre,
      Value<String> statut,
      Value<String?> texteSource,
      Value<String> contenu,
      Value<String> contenuSlug,
      Value<bool> isFavorite,
    });

final class $$ArticlesTableReferences
    extends BaseReferences<_$AppDatabase, $ArticlesTable, Article> {
  $$ArticlesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DivisionsTable _divisionIdTable(_$AppDatabase db) =>
      db.divisions.createAlias('articles__division_id__divisions__id');

  $$DivisionsTableProcessedTableManager get divisionId {
    final $_column = $_itemColumn<int>('division_id')!;

    final manager = $$DivisionsTableTableManager(
      $_db,
      $_db.divisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_divisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ArticlesTableFilterComposer
    extends Composer<_$AppDatabase, $ArticlesTable> {
  $$ArticlesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get numeroTri => $composableBuilder(
    column: $table.numeroTri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ordre => $composableBuilder(
    column: $table.ordre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statut => $composableBuilder(
    column: $table.statut,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get texteSource => $composableBuilder(
    column: $table.texteSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contenu => $composableBuilder(
    column: $table.contenu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contenuSlug => $composableBuilder(
    column: $table.contenuSlug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  $$DivisionsTableFilterComposer get divisionId {
    final $$DivisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.divisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DivisionsTableFilterComposer(
            $db: $db,
            $table: $db.divisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArticlesTableOrderingComposer
    extends Composer<_$AppDatabase, $ArticlesTable> {
  $$ArticlesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get numeroTri => $composableBuilder(
    column: $table.numeroTri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ordre => $composableBuilder(
    column: $table.ordre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statut => $composableBuilder(
    column: $table.statut,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get texteSource => $composableBuilder(
    column: $table.texteSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contenu => $composableBuilder(
    column: $table.contenu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contenuSlug => $composableBuilder(
    column: $table.contenuSlug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  $$DivisionsTableOrderingComposer get divisionId {
    final $$DivisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.divisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DivisionsTableOrderingComposer(
            $db: $db,
            $table: $db.divisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArticlesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArticlesTable> {
  $$ArticlesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get numero =>
      $composableBuilder(column: $table.numero, builder: (column) => column);

  GeneratedColumn<double> get numeroTri =>
      $composableBuilder(column: $table.numeroTri, builder: (column) => column);

  GeneratedColumn<int> get ordre =>
      $composableBuilder(column: $table.ordre, builder: (column) => column);

  GeneratedColumn<String> get statut =>
      $composableBuilder(column: $table.statut, builder: (column) => column);

  GeneratedColumn<String> get texteSource => $composableBuilder(
    column: $table.texteSource,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contenu =>
      $composableBuilder(column: $table.contenu, builder: (column) => column);

  GeneratedColumn<String> get contenuSlug => $composableBuilder(
    column: $table.contenuSlug,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  $$DivisionsTableAnnotationComposer get divisionId {
    final $$DivisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.divisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DivisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.divisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArticlesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ArticlesTable,
          Article,
          $$ArticlesTableFilterComposer,
          $$ArticlesTableOrderingComposer,
          $$ArticlesTableAnnotationComposer,
          $$ArticlesTableCreateCompanionBuilder,
          $$ArticlesTableUpdateCompanionBuilder,
          (Article, $$ArticlesTableReferences),
          Article,
          PrefetchHooks Function({bool divisionId})
        > {
  $$ArticlesTableTableManager(_$AppDatabase db, $ArticlesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArticlesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArticlesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArticlesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> divisionId = const Value.absent(),
                Value<String> numero = const Value.absent(),
                Value<double> numeroTri = const Value.absent(),
                Value<int> ordre = const Value.absent(),
                Value<String> statut = const Value.absent(),
                Value<String?> texteSource = const Value.absent(),
                Value<String> contenu = const Value.absent(),
                Value<String> contenuSlug = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
              }) => ArticlesCompanion(
                id: id,
                divisionId: divisionId,
                numero: numero,
                numeroTri: numeroTri,
                ordre: ordre,
                statut: statut,
                texteSource: texteSource,
                contenu: contenu,
                contenuSlug: contenuSlug,
                isFavorite: isFavorite,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int divisionId,
                required String numero,
                required double numeroTri,
                required int ordre,
                required String statut,
                Value<String?> texteSource = const Value.absent(),
                required String contenu,
                required String contenuSlug,
                Value<bool> isFavorite = const Value.absent(),
              }) => ArticlesCompanion.insert(
                id: id,
                divisionId: divisionId,
                numero: numero,
                numeroTri: numeroTri,
                ordre: ordre,
                statut: statut,
                texteSource: texteSource,
                contenu: contenu,
                contenuSlug: contenuSlug,
                isFavorite: isFavorite,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ArticlesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({divisionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (divisionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.divisionId,
                                referencedTable: $$ArticlesTableReferences
                                    ._divisionIdTable(db),
                                referencedColumn: $$ArticlesTableReferences
                                    ._divisionIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ArticlesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ArticlesTable,
      Article,
      $$ArticlesTableFilterComposer,
      $$ArticlesTableOrderingComposer,
      $$ArticlesTableAnnotationComposer,
      $$ArticlesTableCreateCompanionBuilder,
      $$ArticlesTableUpdateCompanionBuilder,
      (Article, $$ArticlesTableReferences),
      Article,
      PrefetchHooks Function({bool divisionId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DivisionsTableTableManager get divisions =>
      $$DivisionsTableTableManager(_db, _db.divisions);
  $$ArticlesTableTableManager get articles =>
      $$ArticlesTableTableManager(_db, _db.articles);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(db)
final dbProvider = DbProvider._();

final class DbProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  DbProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dbProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dbHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return db(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$dbHash() => r'8e0cccd7648ba0b2ca3b59959f82bdf36ffa8f53';
