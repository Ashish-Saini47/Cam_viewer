// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CamerasTableTable extends CamerasTable
    with TableInfo<$CamerasTableTable, CamerasTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CamerasTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hostMeta = const VerificationMeta('host');
  @override
  late final GeneratedColumn<String> host = GeneratedColumn<String>(
    'host',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _portMeta = const VerificationMeta('port');
  @override
  late final GeneratedColumn<int> port = GeneratedColumn<int>(
    'port',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hasPtzMeta = const VerificationMeta('hasPtz');
  @override
  late final GeneratedColumn<bool> hasPtz = GeneratedColumn<bool>(
    'has_ptz',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_ptz" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hasProfileGMeta = const VerificationMeta(
    'hasProfileG',
  );
  @override
  late final GeneratedColumn<bool> hasProfileG = GeneratedColumn<bool>(
    'has_profile_g',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_profile_g" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hasSnapshotMeta = const VerificationMeta(
    'hasSnapshot',
  );
  @override
  late final GeneratedColumn<bool> hasSnapshot = GeneratedColumn<bool>(
    'has_snapshot',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_snapshot" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    host,
    port,
    username,
    password,
    hasPtz,
    hasProfileG,
    hasSnapshot,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cameras_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CamerasTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('host')) {
      context.handle(
        _hostMeta,
        host.isAcceptableOrUnknown(data['host']!, _hostMeta),
      );
    } else if (isInserting) {
      context.missing(_hostMeta);
    }
    if (data.containsKey('port')) {
      context.handle(
        _portMeta,
        port.isAcceptableOrUnknown(data['port']!, _portMeta),
      );
    } else if (isInserting) {
      context.missing(_portMeta);
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('has_ptz')) {
      context.handle(
        _hasPtzMeta,
        hasPtz.isAcceptableOrUnknown(data['has_ptz']!, _hasPtzMeta),
      );
    }
    if (data.containsKey('has_profile_g')) {
      context.handle(
        _hasProfileGMeta,
        hasProfileG.isAcceptableOrUnknown(
          data['has_profile_g']!,
          _hasProfileGMeta,
        ),
      );
    }
    if (data.containsKey('has_snapshot')) {
      context.handle(
        _hasSnapshotMeta,
        hasSnapshot.isAcceptableOrUnknown(
          data['has_snapshot']!,
          _hasSnapshotMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CamerasTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CamerasTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      host: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}host'],
      )!,
      port: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}port'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      hasPtz: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_ptz'],
      )!,
      hasProfileG: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_profile_g'],
      )!,
      hasSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_snapshot'],
      )!,
    );
  }

  @override
  $CamerasTableTable createAlias(String alias) {
    return $CamerasTableTable(attachedDatabase, alias);
  }
}

class CamerasTableData extends DataClass
    implements Insertable<CamerasTableData> {
  final String id;
  final String name;
  final String host;
  final int port;
  final String username;
  final String password;
  final bool hasPtz;
  final bool hasProfileG;
  final bool hasSnapshot;
  const CamerasTableData({
    required this.id,
    required this.name,
    required this.host,
    required this.port,
    required this.username,
    required this.password,
    required this.hasPtz,
    required this.hasProfileG,
    required this.hasSnapshot,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['host'] = Variable<String>(host);
    map['port'] = Variable<int>(port);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['has_ptz'] = Variable<bool>(hasPtz);
    map['has_profile_g'] = Variable<bool>(hasProfileG);
    map['has_snapshot'] = Variable<bool>(hasSnapshot);
    return map;
  }

  CamerasTableCompanion toCompanion(bool nullToAbsent) {
    return CamerasTableCompanion(
      id: Value(id),
      name: Value(name),
      host: Value(host),
      port: Value(port),
      username: Value(username),
      password: Value(password),
      hasPtz: Value(hasPtz),
      hasProfileG: Value(hasProfileG),
      hasSnapshot: Value(hasSnapshot),
    );
  }

  factory CamerasTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CamerasTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      host: serializer.fromJson<String>(json['host']),
      port: serializer.fromJson<int>(json['port']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      hasPtz: serializer.fromJson<bool>(json['hasPtz']),
      hasProfileG: serializer.fromJson<bool>(json['hasProfileG']),
      hasSnapshot: serializer.fromJson<bool>(json['hasSnapshot']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'host': serializer.toJson<String>(host),
      'port': serializer.toJson<int>(port),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'hasPtz': serializer.toJson<bool>(hasPtz),
      'hasProfileG': serializer.toJson<bool>(hasProfileG),
      'hasSnapshot': serializer.toJson<bool>(hasSnapshot),
    };
  }

  CamerasTableData copyWith({
    String? id,
    String? name,
    String? host,
    int? port,
    String? username,
    String? password,
    bool? hasPtz,
    bool? hasProfileG,
    bool? hasSnapshot,
  }) => CamerasTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    host: host ?? this.host,
    port: port ?? this.port,
    username: username ?? this.username,
    password: password ?? this.password,
    hasPtz: hasPtz ?? this.hasPtz,
    hasProfileG: hasProfileG ?? this.hasProfileG,
    hasSnapshot: hasSnapshot ?? this.hasSnapshot,
  );
  CamerasTableData copyWithCompanion(CamerasTableCompanion data) {
    return CamerasTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      host: data.host.present ? data.host.value : this.host,
      port: data.port.present ? data.port.value : this.port,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
      hasPtz: data.hasPtz.present ? data.hasPtz.value : this.hasPtz,
      hasProfileG: data.hasProfileG.present
          ? data.hasProfileG.value
          : this.hasProfileG,
      hasSnapshot: data.hasSnapshot.present
          ? data.hasSnapshot.value
          : this.hasSnapshot,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CamerasTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('host: $host, ')
          ..write('port: $port, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('hasPtz: $hasPtz, ')
          ..write('hasProfileG: $hasProfileG, ')
          ..write('hasSnapshot: $hasSnapshot')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    host,
    port,
    username,
    password,
    hasPtz,
    hasProfileG,
    hasSnapshot,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CamerasTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.host == this.host &&
          other.port == this.port &&
          other.username == this.username &&
          other.password == this.password &&
          other.hasPtz == this.hasPtz &&
          other.hasProfileG == this.hasProfileG &&
          other.hasSnapshot == this.hasSnapshot);
}

class CamerasTableCompanion extends UpdateCompanion<CamerasTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> host;
  final Value<int> port;
  final Value<String> username;
  final Value<String> password;
  final Value<bool> hasPtz;
  final Value<bool> hasProfileG;
  final Value<bool> hasSnapshot;
  final Value<int> rowid;
  const CamerasTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.host = const Value.absent(),
    this.port = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.hasPtz = const Value.absent(),
    this.hasProfileG = const Value.absent(),
    this.hasSnapshot = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CamerasTableCompanion.insert({
    required String id,
    required String name,
    required String host,
    required int port,
    required String username,
    required String password,
    this.hasPtz = const Value.absent(),
    this.hasProfileG = const Value.absent(),
    this.hasSnapshot = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       host = Value(host),
       port = Value(port),
       username = Value(username),
       password = Value(password);
  static Insertable<CamerasTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? host,
    Expression<int>? port,
    Expression<String>? username,
    Expression<String>? password,
    Expression<bool>? hasPtz,
    Expression<bool>? hasProfileG,
    Expression<bool>? hasSnapshot,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (host != null) 'host': host,
      if (port != null) 'port': port,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (hasPtz != null) 'has_ptz': hasPtz,
      if (hasProfileG != null) 'has_profile_g': hasProfileG,
      if (hasSnapshot != null) 'has_snapshot': hasSnapshot,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CamerasTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? host,
    Value<int>? port,
    Value<String>? username,
    Value<String>? password,
    Value<bool>? hasPtz,
    Value<bool>? hasProfileG,
    Value<bool>? hasSnapshot,
    Value<int>? rowid,
  }) {
    return CamerasTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      host: host ?? this.host,
      port: port ?? this.port,
      username: username ?? this.username,
      password: password ?? this.password,
      hasPtz: hasPtz ?? this.hasPtz,
      hasProfileG: hasProfileG ?? this.hasProfileG,
      hasSnapshot: hasSnapshot ?? this.hasSnapshot,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (host.present) {
      map['host'] = Variable<String>(host.value);
    }
    if (port.present) {
      map['port'] = Variable<int>(port.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (hasPtz.present) {
      map['has_ptz'] = Variable<bool>(hasPtz.value);
    }
    if (hasProfileG.present) {
      map['has_profile_g'] = Variable<bool>(hasProfileG.value);
    }
    if (hasSnapshot.present) {
      map['has_snapshot'] = Variable<bool>(hasSnapshot.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CamerasTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('host: $host, ')
          ..write('port: $port, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('hasPtz: $hasPtz, ')
          ..write('hasProfileG: $hasProfileG, ')
          ..write('hasSnapshot: $hasSnapshot, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DownloadsTableTable extends DownloadsTable
    with TableInfo<$DownloadsTableTable, DownloadsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DownloadsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cameraIdMeta = const VerificationMeta(
    'cameraId',
  );
  @override
  late final GeneratedColumn<String> cameraId = GeneratedColumn<String>(
    'camera_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceUriMeta = const VerificationMeta(
    'sourceUri',
  );
  @override
  late final GeneratedColumn<String> sourceUri = GeneratedColumn<String>(
    'source_uri',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _outputPathMeta = const VerificationMeta(
    'outputPath',
  );
  @override
  late final GeneratedColumn<String> outputPath = GeneratedColumn<String>(
    'output_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cameraId,
    sourceUri,
    outputPath,
    startTime,
    endTime,
    progress,
    status,
    errorMessage,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'downloads_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<DownloadsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('camera_id')) {
      context.handle(
        _cameraIdMeta,
        cameraId.isAcceptableOrUnknown(data['camera_id']!, _cameraIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cameraIdMeta);
    }
    if (data.containsKey('source_uri')) {
      context.handle(
        _sourceUriMeta,
        sourceUri.isAcceptableOrUnknown(data['source_uri']!, _sourceUriMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceUriMeta);
    }
    if (data.containsKey('output_path')) {
      context.handle(
        _outputPathMeta,
        outputPath.isAcceptableOrUnknown(data['output_path']!, _outputPathMeta),
      );
    } else if (isInserting) {
      context.missing(_outputPathMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DownloadsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DownloadsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      cameraId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}camera_id'],
      )!,
      sourceUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_uri'],
      )!,
      outputPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}output_path'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      )!,
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}progress'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
    );
  }

  @override
  $DownloadsTableTable createAlias(String alias) {
    return $DownloadsTableTable(attachedDatabase, alias);
  }
}

class DownloadsTableData extends DataClass
    implements Insertable<DownloadsTableData> {
  final String id;
  final String cameraId;
  final String sourceUri;
  final String outputPath;
  final DateTime startTime;
  final DateTime endTime;
  final double progress;
  final int status;
  final String? errorMessage;
  const DownloadsTableData({
    required this.id,
    required this.cameraId,
    required this.sourceUri,
    required this.outputPath,
    required this.startTime,
    required this.endTime,
    required this.progress,
    required this.status,
    this.errorMessage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['camera_id'] = Variable<String>(cameraId);
    map['source_uri'] = Variable<String>(sourceUri);
    map['output_path'] = Variable<String>(outputPath);
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    map['progress'] = Variable<double>(progress);
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    return map;
  }

  DownloadsTableCompanion toCompanion(bool nullToAbsent) {
    return DownloadsTableCompanion(
      id: Value(id),
      cameraId: Value(cameraId),
      sourceUri: Value(sourceUri),
      outputPath: Value(outputPath),
      startTime: Value(startTime),
      endTime: Value(endTime),
      progress: Value(progress),
      status: Value(status),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
    );
  }

  factory DownloadsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DownloadsTableData(
      id: serializer.fromJson<String>(json['id']),
      cameraId: serializer.fromJson<String>(json['cameraId']),
      sourceUri: serializer.fromJson<String>(json['sourceUri']),
      outputPath: serializer.fromJson<String>(json['outputPath']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      progress: serializer.fromJson<double>(json['progress']),
      status: serializer.fromJson<int>(json['status']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'cameraId': serializer.toJson<String>(cameraId),
      'sourceUri': serializer.toJson<String>(sourceUri),
      'outputPath': serializer.toJson<String>(outputPath),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'progress': serializer.toJson<double>(progress),
      'status': serializer.toJson<int>(status),
      'errorMessage': serializer.toJson<String?>(errorMessage),
    };
  }

  DownloadsTableData copyWith({
    String? id,
    String? cameraId,
    String? sourceUri,
    String? outputPath,
    DateTime? startTime,
    DateTime? endTime,
    double? progress,
    int? status,
    Value<String?> errorMessage = const Value.absent(),
  }) => DownloadsTableData(
    id: id ?? this.id,
    cameraId: cameraId ?? this.cameraId,
    sourceUri: sourceUri ?? this.sourceUri,
    outputPath: outputPath ?? this.outputPath,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    progress: progress ?? this.progress,
    status: status ?? this.status,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
  );
  DownloadsTableData copyWithCompanion(DownloadsTableCompanion data) {
    return DownloadsTableData(
      id: data.id.present ? data.id.value : this.id,
      cameraId: data.cameraId.present ? data.cameraId.value : this.cameraId,
      sourceUri: data.sourceUri.present ? data.sourceUri.value : this.sourceUri,
      outputPath: data.outputPath.present
          ? data.outputPath.value
          : this.outputPath,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      progress: data.progress.present ? data.progress.value : this.progress,
      status: data.status.present ? data.status.value : this.status,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DownloadsTableData(')
          ..write('id: $id, ')
          ..write('cameraId: $cameraId, ')
          ..write('sourceUri: $sourceUri, ')
          ..write('outputPath: $outputPath, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('progress: $progress, ')
          ..write('status: $status, ')
          ..write('errorMessage: $errorMessage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cameraId,
    sourceUri,
    outputPath,
    startTime,
    endTime,
    progress,
    status,
    errorMessage,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DownloadsTableData &&
          other.id == this.id &&
          other.cameraId == this.cameraId &&
          other.sourceUri == this.sourceUri &&
          other.outputPath == this.outputPath &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.progress == this.progress &&
          other.status == this.status &&
          other.errorMessage == this.errorMessage);
}

class DownloadsTableCompanion extends UpdateCompanion<DownloadsTableData> {
  final Value<String> id;
  final Value<String> cameraId;
  final Value<String> sourceUri;
  final Value<String> outputPath;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<double> progress;
  final Value<int> status;
  final Value<String?> errorMessage;
  final Value<int> rowid;
  const DownloadsTableCompanion({
    this.id = const Value.absent(),
    this.cameraId = const Value.absent(),
    this.sourceUri = const Value.absent(),
    this.outputPath = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.progress = const Value.absent(),
    this.status = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DownloadsTableCompanion.insert({
    required String id,
    required String cameraId,
    required String sourceUri,
    required String outputPath,
    required DateTime startTime,
    required DateTime endTime,
    this.progress = const Value.absent(),
    this.status = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       cameraId = Value(cameraId),
       sourceUri = Value(sourceUri),
       outputPath = Value(outputPath),
       startTime = Value(startTime),
       endTime = Value(endTime);
  static Insertable<DownloadsTableData> custom({
    Expression<String>? id,
    Expression<String>? cameraId,
    Expression<String>? sourceUri,
    Expression<String>? outputPath,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<double>? progress,
    Expression<int>? status,
    Expression<String>? errorMessage,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cameraId != null) 'camera_id': cameraId,
      if (sourceUri != null) 'source_uri': sourceUri,
      if (outputPath != null) 'output_path': outputPath,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (progress != null) 'progress': progress,
      if (status != null) 'status': status,
      if (errorMessage != null) 'error_message': errorMessage,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DownloadsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? cameraId,
    Value<String>? sourceUri,
    Value<String>? outputPath,
    Value<DateTime>? startTime,
    Value<DateTime>? endTime,
    Value<double>? progress,
    Value<int>? status,
    Value<String?>? errorMessage,
    Value<int>? rowid,
  }) {
    return DownloadsTableCompanion(
      id: id ?? this.id,
      cameraId: cameraId ?? this.cameraId,
      sourceUri: sourceUri ?? this.sourceUri,
      outputPath: outputPath ?? this.outputPath,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cameraId.present) {
      map['camera_id'] = Variable<String>(cameraId.value);
    }
    if (sourceUri.present) {
      map['source_uri'] = Variable<String>(sourceUri.value);
    }
    if (outputPath.present) {
      map['output_path'] = Variable<String>(outputPath.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DownloadsTableCompanion(')
          ..write('id: $id, ')
          ..write('cameraId: $cameraId, ')
          ..write('sourceUri: $sourceUri, ')
          ..write('outputPath: $outputPath, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('progress: $progress, ')
          ..write('status: $status, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CamerasTableTable camerasTable = $CamerasTableTable(this);
  late final $DownloadsTableTable downloadsTable = $DownloadsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    camerasTable,
    downloadsTable,
  ];
}

typedef $$CamerasTableTableCreateCompanionBuilder =
    CamerasTableCompanion Function({
      required String id,
      required String name,
      required String host,
      required int port,
      required String username,
      required String password,
      Value<bool> hasPtz,
      Value<bool> hasProfileG,
      Value<bool> hasSnapshot,
      Value<int> rowid,
    });
typedef $$CamerasTableTableUpdateCompanionBuilder =
    CamerasTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> host,
      Value<int> port,
      Value<String> username,
      Value<String> password,
      Value<bool> hasPtz,
      Value<bool> hasProfileG,
      Value<bool> hasSnapshot,
      Value<int> rowid,
    });

class $$CamerasTableTableFilterComposer
    extends Composer<_$AppDatabase, $CamerasTableTable> {
  $$CamerasTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get host => $composableBuilder(
    column: $table.host,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get port => $composableBuilder(
    column: $table.port,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasPtz => $composableBuilder(
    column: $table.hasPtz,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasProfileG => $composableBuilder(
    column: $table.hasProfileG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasSnapshot => $composableBuilder(
    column: $table.hasSnapshot,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CamerasTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CamerasTableTable> {
  $$CamerasTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get host => $composableBuilder(
    column: $table.host,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get port => $composableBuilder(
    column: $table.port,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasPtz => $composableBuilder(
    column: $table.hasPtz,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasProfileG => $composableBuilder(
    column: $table.hasProfileG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasSnapshot => $composableBuilder(
    column: $table.hasSnapshot,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CamerasTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CamerasTableTable> {
  $$CamerasTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get host =>
      $composableBuilder(column: $table.host, builder: (column) => column);

  GeneratedColumn<int> get port =>
      $composableBuilder(column: $table.port, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<bool> get hasPtz =>
      $composableBuilder(column: $table.hasPtz, builder: (column) => column);

  GeneratedColumn<bool> get hasProfileG => $composableBuilder(
    column: $table.hasProfileG,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hasSnapshot => $composableBuilder(
    column: $table.hasSnapshot,
    builder: (column) => column,
  );
}

class $$CamerasTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CamerasTableTable,
          CamerasTableData,
          $$CamerasTableTableFilterComposer,
          $$CamerasTableTableOrderingComposer,
          $$CamerasTableTableAnnotationComposer,
          $$CamerasTableTableCreateCompanionBuilder,
          $$CamerasTableTableUpdateCompanionBuilder,
          (
            CamerasTableData,
            BaseReferences<_$AppDatabase, $CamerasTableTable, CamerasTableData>,
          ),
          CamerasTableData,
          PrefetchHooks Function()
        > {
  $$CamerasTableTableTableManager(_$AppDatabase db, $CamerasTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CamerasTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CamerasTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CamerasTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> host = const Value.absent(),
                Value<int> port = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<bool> hasPtz = const Value.absent(),
                Value<bool> hasProfileG = const Value.absent(),
                Value<bool> hasSnapshot = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CamerasTableCompanion(
                id: id,
                name: name,
                host: host,
                port: port,
                username: username,
                password: password,
                hasPtz: hasPtz,
                hasProfileG: hasProfileG,
                hasSnapshot: hasSnapshot,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String host,
                required int port,
                required String username,
                required String password,
                Value<bool> hasPtz = const Value.absent(),
                Value<bool> hasProfileG = const Value.absent(),
                Value<bool> hasSnapshot = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CamerasTableCompanion.insert(
                id: id,
                name: name,
                host: host,
                port: port,
                username: username,
                password: password,
                hasPtz: hasPtz,
                hasProfileG: hasProfileG,
                hasSnapshot: hasSnapshot,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CamerasTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CamerasTableTable,
      CamerasTableData,
      $$CamerasTableTableFilterComposer,
      $$CamerasTableTableOrderingComposer,
      $$CamerasTableTableAnnotationComposer,
      $$CamerasTableTableCreateCompanionBuilder,
      $$CamerasTableTableUpdateCompanionBuilder,
      (
        CamerasTableData,
        BaseReferences<_$AppDatabase, $CamerasTableTable, CamerasTableData>,
      ),
      CamerasTableData,
      PrefetchHooks Function()
    >;
typedef $$DownloadsTableTableCreateCompanionBuilder =
    DownloadsTableCompanion Function({
      required String id,
      required String cameraId,
      required String sourceUri,
      required String outputPath,
      required DateTime startTime,
      required DateTime endTime,
      Value<double> progress,
      Value<int> status,
      Value<String?> errorMessage,
      Value<int> rowid,
    });
typedef $$DownloadsTableTableUpdateCompanionBuilder =
    DownloadsTableCompanion Function({
      Value<String> id,
      Value<String> cameraId,
      Value<String> sourceUri,
      Value<String> outputPath,
      Value<DateTime> startTime,
      Value<DateTime> endTime,
      Value<double> progress,
      Value<int> status,
      Value<String?> errorMessage,
      Value<int> rowid,
    });

class $$DownloadsTableTableFilterComposer
    extends Composer<_$AppDatabase, $DownloadsTableTable> {
  $$DownloadsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cameraId => $composableBuilder(
    column: $table.cameraId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceUri => $composableBuilder(
    column: $table.sourceUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outputPath => $composableBuilder(
    column: $table.outputPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DownloadsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DownloadsTableTable> {
  $$DownloadsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cameraId => $composableBuilder(
    column: $table.cameraId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceUri => $composableBuilder(
    column: $table.sourceUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outputPath => $composableBuilder(
    column: $table.outputPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DownloadsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DownloadsTableTable> {
  $$DownloadsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cameraId =>
      $composableBuilder(column: $table.cameraId, builder: (column) => column);

  GeneratedColumn<String> get sourceUri =>
      $composableBuilder(column: $table.sourceUri, builder: (column) => column);

  GeneratedColumn<String> get outputPath => $composableBuilder(
    column: $table.outputPath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );
}

class $$DownloadsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DownloadsTableTable,
          DownloadsTableData,
          $$DownloadsTableTableFilterComposer,
          $$DownloadsTableTableOrderingComposer,
          $$DownloadsTableTableAnnotationComposer,
          $$DownloadsTableTableCreateCompanionBuilder,
          $$DownloadsTableTableUpdateCompanionBuilder,
          (
            DownloadsTableData,
            BaseReferences<
              _$AppDatabase,
              $DownloadsTableTable,
              DownloadsTableData
            >,
          ),
          DownloadsTableData,
          PrefetchHooks Function()
        > {
  $$DownloadsTableTableTableManager(
    _$AppDatabase db,
    $DownloadsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DownloadsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DownloadsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DownloadsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> cameraId = const Value.absent(),
                Value<String> sourceUri = const Value.absent(),
                Value<String> outputPath = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime> endTime = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DownloadsTableCompanion(
                id: id,
                cameraId: cameraId,
                sourceUri: sourceUri,
                outputPath: outputPath,
                startTime: startTime,
                endTime: endTime,
                progress: progress,
                status: status,
                errorMessage: errorMessage,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String cameraId,
                required String sourceUri,
                required String outputPath,
                required DateTime startTime,
                required DateTime endTime,
                Value<double> progress = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DownloadsTableCompanion.insert(
                id: id,
                cameraId: cameraId,
                sourceUri: sourceUri,
                outputPath: outputPath,
                startTime: startTime,
                endTime: endTime,
                progress: progress,
                status: status,
                errorMessage: errorMessage,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DownloadsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DownloadsTableTable,
      DownloadsTableData,
      $$DownloadsTableTableFilterComposer,
      $$DownloadsTableTableOrderingComposer,
      $$DownloadsTableTableAnnotationComposer,
      $$DownloadsTableTableCreateCompanionBuilder,
      $$DownloadsTableTableUpdateCompanionBuilder,
      (
        DownloadsTableData,
        BaseReferences<_$AppDatabase, $DownloadsTableTable, DownloadsTableData>,
      ),
      DownloadsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CamerasTableTableTableManager get camerasTable =>
      $$CamerasTableTableTableManager(_db, _db.camerasTable);
  $$DownloadsTableTableTableManager get downloadsTable =>
      $$DownloadsTableTableTableManager(_db, _db.downloadsTable);
}
