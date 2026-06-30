// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $NoteTable extends Note with TableInfo<$NoteTable, NoteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'body',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isReminderMeta = const VerificationMeta(
    'isReminder',
  );
  @override
  late final GeneratedColumn<bool> isReminder = GeneratedColumn<bool>(
    'is_reminder',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_reminder" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _reminderCompleteMeta = const VerificationMeta(
    'reminderComplete',
  );
  @override
  late final GeneratedColumn<bool> reminderComplete = GeneratedColumn<bool>(
    'reminder_complete',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reminder_complete" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _dateReminderMeta = const VerificationMeta(
    'dateReminder',
  );
  @override
  late final GeneratedColumn<DateTime> dateReminder = GeneratedColumn<DateTime>(
    'date_reminder',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    content,
    createdAt,
    isReminder,
    reminderComplete,
    dateReminder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note';
  @override
  VerificationContext validateIntegrity(
    Insertable<NoteData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('body')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['body']!, _contentMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('is_reminder')) {
      context.handle(
        _isReminderMeta,
        isReminder.isAcceptableOrUnknown(data['is_reminder']!, _isReminderMeta),
      );
    }
    if (data.containsKey('reminder_complete')) {
      context.handle(
        _reminderCompleteMeta,
        reminderComplete.isAcceptableOrUnknown(
          data['reminder_complete']!,
          _reminderCompleteMeta,
        ),
      );
    }
    if (data.containsKey('date_reminder')) {
      context.handle(
        _dateReminderMeta,
        dateReminder.isAcceptableOrUnknown(
          data['date_reminder']!,
          _dateReminderMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      isReminder: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_reminder'],
      )!,
      reminderComplete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}reminder_complete'],
      )!,
      dateReminder: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_reminder'],
      ),
    );
  }

  @override
  $NoteTable createAlias(String alias) {
    return $NoteTable(attachedDatabase, alias);
  }
}

class NoteData extends DataClass implements Insertable<NoteData> {
  final int id;
  final String? title;
  final String? content;
  final DateTime createdAt;
  final bool isReminder;
  final bool reminderComplete;
  final DateTime? dateReminder;
  const NoteData({
    required this.id,
    this.title,
    this.content,
    required this.createdAt,
    required this.isReminder,
    required this.reminderComplete,
    this.dateReminder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || content != null) {
      map['body'] = Variable<String>(content);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_reminder'] = Variable<bool>(isReminder);
    map['reminder_complete'] = Variable<bool>(reminderComplete);
    if (!nullToAbsent || dateReminder != null) {
      map['date_reminder'] = Variable<DateTime>(dateReminder);
    }
    return map;
  }

  NoteCompanion toCompanion(bool nullToAbsent) {
    return NoteCompanion(
      id: Value(id),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      createdAt: Value(createdAt),
      isReminder: Value(isReminder),
      reminderComplete: Value(reminderComplete),
      dateReminder: dateReminder == null && nullToAbsent
          ? const Value.absent()
          : Value(dateReminder),
    );
  }

  factory NoteData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      content: serializer.fromJson<String?>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isReminder: serializer.fromJson<bool>(json['isReminder']),
      reminderComplete: serializer.fromJson<bool>(json['reminderComplete']),
      dateReminder: serializer.fromJson<DateTime?>(json['dateReminder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'content': serializer.toJson<String?>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isReminder': serializer.toJson<bool>(isReminder),
      'reminderComplete': serializer.toJson<bool>(reminderComplete),
      'dateReminder': serializer.toJson<DateTime?>(dateReminder),
    };
  }

  NoteData copyWith({
    int? id,
    Value<String?> title = const Value.absent(),
    Value<String?> content = const Value.absent(),
    DateTime? createdAt,
    bool? isReminder,
    bool? reminderComplete,
    Value<DateTime?> dateReminder = const Value.absent(),
  }) => NoteData(
    id: id ?? this.id,
    title: title.present ? title.value : this.title,
    content: content.present ? content.value : this.content,
    createdAt: createdAt ?? this.createdAt,
    isReminder: isReminder ?? this.isReminder,
    reminderComplete: reminderComplete ?? this.reminderComplete,
    dateReminder: dateReminder.present ? dateReminder.value : this.dateReminder,
  );
  NoteData copyWithCompanion(NoteCompanion data) {
    return NoteData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isReminder: data.isReminder.present
          ? data.isReminder.value
          : this.isReminder,
      reminderComplete: data.reminderComplete.present
          ? data.reminderComplete.value
          : this.reminderComplete,
      dateReminder: data.dateReminder.present
          ? data.dateReminder.value
          : this.dateReminder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('isReminder: $isReminder, ')
          ..write('reminderComplete: $reminderComplete, ')
          ..write('dateReminder: $dateReminder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    content,
    createdAt,
    isReminder,
    reminderComplete,
    dateReminder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.isReminder == this.isReminder &&
          other.reminderComplete == this.reminderComplete &&
          other.dateReminder == this.dateReminder);
}

class NoteCompanion extends UpdateCompanion<NoteData> {
  final Value<int> id;
  final Value<String?> title;
  final Value<String?> content;
  final Value<DateTime> createdAt;
  final Value<bool> isReminder;
  final Value<bool> reminderComplete;
  final Value<DateTime?> dateReminder;
  const NoteCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isReminder = const Value.absent(),
    this.reminderComplete = const Value.absent(),
    this.dateReminder = const Value.absent(),
  });
  NoteCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isReminder = const Value.absent(),
    this.reminderComplete = const Value.absent(),
    this.dateReminder = const Value.absent(),
  });
  static Insertable<NoteData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<bool>? isReminder,
    Expression<bool>? reminderComplete,
    Expression<DateTime>? dateReminder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'body': content,
      if (createdAt != null) 'created_at': createdAt,
      if (isReminder != null) 'is_reminder': isReminder,
      if (reminderComplete != null) 'reminder_complete': reminderComplete,
      if (dateReminder != null) 'date_reminder': dateReminder,
    });
  }

  NoteCompanion copyWith({
    Value<int>? id,
    Value<String?>? title,
    Value<String?>? content,
    Value<DateTime>? createdAt,
    Value<bool>? isReminder,
    Value<bool>? reminderComplete,
    Value<DateTime?>? dateReminder,
  }) {
    return NoteCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      isReminder: isReminder ?? this.isReminder,
      reminderComplete: reminderComplete ?? this.reminderComplete,
      dateReminder: dateReminder ?? this.dateReminder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['body'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isReminder.present) {
      map['is_reminder'] = Variable<bool>(isReminder.value);
    }
    if (reminderComplete.present) {
      map['reminder_complete'] = Variable<bool>(reminderComplete.value);
    }
    if (dateReminder.present) {
      map['date_reminder'] = Variable<DateTime>(dateReminder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('isReminder: $isReminder, ')
          ..write('reminderComplete: $reminderComplete, ')
          ..write('dateReminder: $dateReminder')
          ..write(')'))
        .toString();
  }
}

class $TagTable extends Tag with TableInfo<$TagTable, TagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tag';
  @override
  VerificationContext validateIntegrity(
    Insertable<TagData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $TagTable createAlias(String alias) {
    return $TagTable(attachedDatabase, alias);
  }
}

class TagData extends DataClass implements Insertable<TagData> {
  final int id;
  final String name;
  const TagData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TagCompanion toCompanion(bool nullToAbsent) {
    return TagCompanion(id: Value(id), name: Value(name));
  }

  factory TagData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  TagData copyWith({int? id, String? name}) =>
      TagData(id: id ?? this.id, name: name ?? this.name);
  TagData copyWithCompanion(TagCompanion data) {
    return TagData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagData && other.id == this.id && other.name == this.name);
}

class TagCompanion extends UpdateCompanion<TagData> {
  final Value<int> id;
  final Value<String> name;
  const TagCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TagCompanion.insert({this.id = const Value.absent(), required String name})
    : name = Value(name);
  static Insertable<TagData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TagCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return TagCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $NoteTagTable extends NoteTag with TableInfo<$NoteTagTable, NoteTagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteTagTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<int> noteId = GeneratedColumn<int>(
    'note_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES note (id)',
    ),
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tag (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [noteId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note_tag';
  @override
  VerificationContext validateIntegrity(
    Insertable<NoteTagData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('note_id')) {
      context.handle(
        _noteIdMeta,
        noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_noteIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {noteId, tagId};
  @override
  NoteTagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteTagData(
      noteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}note_id'],
      )!,
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tag_id'],
      )!,
    );
  }

  @override
  $NoteTagTable createAlias(String alias) {
    return $NoteTagTable(attachedDatabase, alias);
  }
}

class NoteTagData extends DataClass implements Insertable<NoteTagData> {
  final int noteId;
  final int tagId;
  const NoteTagData({required this.noteId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['note_id'] = Variable<int>(noteId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  NoteTagCompanion toCompanion(bool nullToAbsent) {
    return NoteTagCompanion(noteId: Value(noteId), tagId: Value(tagId));
  }

  factory NoteTagData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteTagData(
      noteId: serializer.fromJson<int>(json['noteId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'noteId': serializer.toJson<int>(noteId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  NoteTagData copyWith({int? noteId, int? tagId}) =>
      NoteTagData(noteId: noteId ?? this.noteId, tagId: tagId ?? this.tagId);
  NoteTagData copyWithCompanion(NoteTagCompanion data) {
    return NoteTagData(
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteTagData(')
          ..write('noteId: $noteId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(noteId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteTagData &&
          other.noteId == this.noteId &&
          other.tagId == this.tagId);
}

class NoteTagCompanion extends UpdateCompanion<NoteTagData> {
  final Value<int> noteId;
  final Value<int> tagId;
  final Value<int> rowid;
  const NoteTagCompanion({
    this.noteId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NoteTagCompanion.insert({
    required int noteId,
    required int tagId,
    this.rowid = const Value.absent(),
  }) : noteId = Value(noteId),
       tagId = Value(tagId);
  static Insertable<NoteTagData> custom({
    Expression<int>? noteId,
    Expression<int>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (noteId != null) 'note_id': noteId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NoteTagCompanion copyWith({
    Value<int>? noteId,
    Value<int>? tagId,
    Value<int>? rowid,
  }) {
    return NoteTagCompanion(
      noteId: noteId ?? this.noteId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (noteId.present) {
      map['note_id'] = Variable<int>(noteId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteTagCompanion(')
          ..write('noteId: $noteId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NoteTable note = $NoteTable(this);
  late final $TagTable tag = $TagTable(this);
  late final $NoteTagTable noteTag = $NoteTagTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [note, tag, noteTag];
}

typedef $$NoteTableCreateCompanionBuilder =
    NoteCompanion Function({
      Value<int> id,
      Value<String?> title,
      Value<String?> content,
      Value<DateTime> createdAt,
      Value<bool> isReminder,
      Value<bool> reminderComplete,
      Value<DateTime?> dateReminder,
    });
typedef $$NoteTableUpdateCompanionBuilder =
    NoteCompanion Function({
      Value<int> id,
      Value<String?> title,
      Value<String?> content,
      Value<DateTime> createdAt,
      Value<bool> isReminder,
      Value<bool> reminderComplete,
      Value<DateTime?> dateReminder,
    });

final class $$NoteTableReferences
    extends BaseReferences<_$AppDatabase, $NoteTable, NoteData> {
  $$NoteTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$NoteTagTable, List<NoteTagData>>
  _noteTagRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.noteTag,
    aliasName: 'note__id__note_tag__note_id',
  );

  $$NoteTagTableProcessedTableManager get noteTagRefs {
    final manager = $$NoteTagTableTableManager(
      $_db,
      $_db.noteTag,
    ).filter((f) => f.noteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_noteTagRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$NoteTableFilterComposer extends Composer<_$AppDatabase, $NoteTable> {
  $$NoteTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isReminder => $composableBuilder(
    column: $table.isReminder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get reminderComplete => $composableBuilder(
    column: $table.reminderComplete,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateReminder => $composableBuilder(
    column: $table.dateReminder,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> noteTagRefs(
    Expression<bool> Function($$NoteTagTableFilterComposer f) f,
  ) {
    final $$NoteTagTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.noteTag,
      getReferencedColumn: (t) => t.noteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteTagTableFilterComposer(
            $db: $db,
            $table: $db.noteTag,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NoteTableOrderingComposer extends Composer<_$AppDatabase, $NoteTable> {
  $$NoteTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isReminder => $composableBuilder(
    column: $table.isReminder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get reminderComplete => $composableBuilder(
    column: $table.reminderComplete,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateReminder => $composableBuilder(
    column: $table.dateReminder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NoteTableAnnotationComposer
    extends Composer<_$AppDatabase, $NoteTable> {
  $$NoteTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isReminder => $composableBuilder(
    column: $table.isReminder,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get reminderComplete => $composableBuilder(
    column: $table.reminderComplete,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateReminder => $composableBuilder(
    column: $table.dateReminder,
    builder: (column) => column,
  );

  Expression<T> noteTagRefs<T extends Object>(
    Expression<T> Function($$NoteTagTableAnnotationComposer a) f,
  ) {
    final $$NoteTagTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.noteTag,
      getReferencedColumn: (t) => t.noteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteTagTableAnnotationComposer(
            $db: $db,
            $table: $db.noteTag,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NoteTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NoteTable,
          NoteData,
          $$NoteTableFilterComposer,
          $$NoteTableOrderingComposer,
          $$NoteTableAnnotationComposer,
          $$NoteTableCreateCompanionBuilder,
          $$NoteTableUpdateCompanionBuilder,
          (NoteData, $$NoteTableReferences),
          NoteData,
          PrefetchHooks Function({bool noteTagRefs})
        > {
  $$NoteTableTableManager(_$AppDatabase db, $NoteTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoteTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoteTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoteTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> isReminder = const Value.absent(),
                Value<bool> reminderComplete = const Value.absent(),
                Value<DateTime?> dateReminder = const Value.absent(),
              }) => NoteCompanion(
                id: id,
                title: title,
                content: content,
                createdAt: createdAt,
                isReminder: isReminder,
                reminderComplete: reminderComplete,
                dateReminder: dateReminder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> isReminder = const Value.absent(),
                Value<bool> reminderComplete = const Value.absent(),
                Value<DateTime?> dateReminder = const Value.absent(),
              }) => NoteCompanion.insert(
                id: id,
                title: title,
                content: content,
                createdAt: createdAt,
                isReminder: isReminder,
                reminderComplete: reminderComplete,
                dateReminder: dateReminder,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$NoteTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({noteTagRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (noteTagRefs) db.noteTag],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (noteTagRefs)
                    await $_getPrefetchedData<
                      NoteData,
                      $NoteTable,
                      NoteTagData
                    >(
                      currentTable: table,
                      referencedTable: $$NoteTableReferences._noteTagRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$NoteTableReferences(db, table, p0).noteTagRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.noteId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$NoteTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NoteTable,
      NoteData,
      $$NoteTableFilterComposer,
      $$NoteTableOrderingComposer,
      $$NoteTableAnnotationComposer,
      $$NoteTableCreateCompanionBuilder,
      $$NoteTableUpdateCompanionBuilder,
      (NoteData, $$NoteTableReferences),
      NoteData,
      PrefetchHooks Function({bool noteTagRefs})
    >;
typedef $$TagTableCreateCompanionBuilder =
    TagCompanion Function({Value<int> id, required String name});
typedef $$TagTableUpdateCompanionBuilder =
    TagCompanion Function({Value<int> id, Value<String> name});

final class $$TagTableReferences
    extends BaseReferences<_$AppDatabase, $TagTable, TagData> {
  $$TagTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$NoteTagTable, List<NoteTagData>>
  _noteTagRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.noteTag,
    aliasName: 'tag__id__note_tag__tag_id',
  );

  $$NoteTagTableProcessedTableManager get noteTagRefs {
    final manager = $$NoteTagTableTableManager(
      $_db,
      $_db.noteTag,
    ).filter((f) => f.tagId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_noteTagRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TagTableFilterComposer extends Composer<_$AppDatabase, $TagTable> {
  $$TagTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> noteTagRefs(
    Expression<bool> Function($$NoteTagTableFilterComposer f) f,
  ) {
    final $$NoteTagTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.noteTag,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteTagTableFilterComposer(
            $db: $db,
            $table: $db.noteTag,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagTableOrderingComposer extends Composer<_$AppDatabase, $TagTable> {
  $$TagTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TagTableAnnotationComposer extends Composer<_$AppDatabase, $TagTable> {
  $$TagTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> noteTagRefs<T extends Object>(
    Expression<T> Function($$NoteTagTableAnnotationComposer a) f,
  ) {
    final $$NoteTagTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.noteTag,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteTagTableAnnotationComposer(
            $db: $db,
            $table: $db.noteTag,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagTable,
          TagData,
          $$TagTableFilterComposer,
          $$TagTableOrderingComposer,
          $$TagTableAnnotationComposer,
          $$TagTableCreateCompanionBuilder,
          $$TagTableUpdateCompanionBuilder,
          (TagData, $$TagTableReferences),
          TagData,
          PrefetchHooks Function({bool noteTagRefs})
        > {
  $$TagTableTableManager(_$AppDatabase db, $TagTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => TagCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  TagCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $$TagTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({noteTagRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (noteTagRefs) db.noteTag],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (noteTagRefs)
                    await $_getPrefetchedData<TagData, $TagTable, NoteTagData>(
                      currentTable: table,
                      referencedTable: $$TagTableReferences._noteTagRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$TagTableReferences(db, table, p0).noteTagRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.tagId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TagTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagTable,
      TagData,
      $$TagTableFilterComposer,
      $$TagTableOrderingComposer,
      $$TagTableAnnotationComposer,
      $$TagTableCreateCompanionBuilder,
      $$TagTableUpdateCompanionBuilder,
      (TagData, $$TagTableReferences),
      TagData,
      PrefetchHooks Function({bool noteTagRefs})
    >;
typedef $$NoteTagTableCreateCompanionBuilder =
    NoteTagCompanion Function({
      required int noteId,
      required int tagId,
      Value<int> rowid,
    });
typedef $$NoteTagTableUpdateCompanionBuilder =
    NoteTagCompanion Function({
      Value<int> noteId,
      Value<int> tagId,
      Value<int> rowid,
    });

final class $$NoteTagTableReferences
    extends BaseReferences<_$AppDatabase, $NoteTagTable, NoteTagData> {
  $$NoteTagTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $NoteTable _noteIdTable(_$AppDatabase db) =>
      db.note.createAlias('note_tag__note_id__note__id');

  $$NoteTableProcessedTableManager get noteId {
    final $_column = $_itemColumn<int>('note_id')!;

    final manager = $$NoteTableTableManager(
      $_db,
      $_db.note,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_noteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TagTable _tagIdTable(_$AppDatabase db) =>
      db.tag.createAlias('note_tag__tag_id__tag__id');

  $$TagTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<int>('tag_id')!;

    final manager = $$TagTableTableManager(
      $_db,
      $_db.tag,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NoteTagTableFilterComposer
    extends Composer<_$AppDatabase, $NoteTagTable> {
  $$NoteTagTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$NoteTableFilterComposer get noteId {
    final $$NoteTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.note,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteTableFilterComposer(
            $db: $db,
            $table: $db.note,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagTableFilterComposer get tagId {
    final $$TagTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tag,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagTableFilterComposer(
            $db: $db,
            $table: $db.tag,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NoteTagTableOrderingComposer
    extends Composer<_$AppDatabase, $NoteTagTable> {
  $$NoteTagTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$NoteTableOrderingComposer get noteId {
    final $$NoteTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.note,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteTableOrderingComposer(
            $db: $db,
            $table: $db.note,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagTableOrderingComposer get tagId {
    final $$TagTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tag,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagTableOrderingComposer(
            $db: $db,
            $table: $db.tag,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NoteTagTableAnnotationComposer
    extends Composer<_$AppDatabase, $NoteTagTable> {
  $$NoteTagTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$NoteTableAnnotationComposer get noteId {
    final $$NoteTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.noteId,
      referencedTable: $db.note,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NoteTableAnnotationComposer(
            $db: $db,
            $table: $db.note,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagTableAnnotationComposer get tagId {
    final $$TagTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tag,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagTableAnnotationComposer(
            $db: $db,
            $table: $db.tag,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NoteTagTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NoteTagTable,
          NoteTagData,
          $$NoteTagTableFilterComposer,
          $$NoteTagTableOrderingComposer,
          $$NoteTagTableAnnotationComposer,
          $$NoteTagTableCreateCompanionBuilder,
          $$NoteTagTableUpdateCompanionBuilder,
          (NoteTagData, $$NoteTagTableReferences),
          NoteTagData,
          PrefetchHooks Function({bool noteId, bool tagId})
        > {
  $$NoteTagTableTableManager(_$AppDatabase db, $NoteTagTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoteTagTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoteTagTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoteTagTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> noteId = const Value.absent(),
                Value<int> tagId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) =>
                  NoteTagCompanion(noteId: noteId, tagId: tagId, rowid: rowid),
          createCompanionCallback:
              ({
                required int noteId,
                required int tagId,
                Value<int> rowid = const Value.absent(),
              }) => NoteTagCompanion.insert(
                noteId: noteId,
                tagId: tagId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NoteTagTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({noteId = false, tagId = false}) {
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
                    if (noteId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.noteId,
                                referencedTable: $$NoteTagTableReferences
                                    ._noteIdTable(db),
                                referencedColumn: $$NoteTagTableReferences
                                    ._noteIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (tagId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagId,
                                referencedTable: $$NoteTagTableReferences
                                    ._tagIdTable(db),
                                referencedColumn: $$NoteTagTableReferences
                                    ._tagIdTable(db)
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

typedef $$NoteTagTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NoteTagTable,
      NoteTagData,
      $$NoteTagTableFilterComposer,
      $$NoteTagTableOrderingComposer,
      $$NoteTagTableAnnotationComposer,
      $$NoteTagTableCreateCompanionBuilder,
      $$NoteTagTableUpdateCompanionBuilder,
      (NoteTagData, $$NoteTagTableReferences),
      NoteTagData,
      PrefetchHooks Function({bool noteId, bool tagId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NoteTableTableManager get note => $$NoteTableTableManager(_db, _db.note);
  $$TagTableTableManager get tag => $$TagTableTableManager(_db, _db.tag);
  $$NoteTagTableTableManager get noteTag =>
      $$NoteTagTableTableManager(_db, _db.noteTag);
}
