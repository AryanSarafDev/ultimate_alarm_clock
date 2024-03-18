// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_profile_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAlarmProfileModelCollection on Isar {
  IsarCollection<AlarmProfileModel> get alarmProfileModels => this.collection();
}

const AlarmProfileModelSchema = CollectionSchema(
  name: r'AlarmProfileModel',
  id: -4090310505598326516,
  properties: {
    r'profileName': PropertySchema(
      id: 0,
      name: r'profileName',
      type: IsarType.string,
    )
  },
  estimateSize: _alarmProfileModelEstimateSize,
  serialize: _alarmProfileModelSerialize,
  deserialize: _alarmProfileModelDeserialize,
  deserializeProp: _alarmProfileModelDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _alarmProfileModelGetId,
  getLinks: _alarmProfileModelGetLinks,
  attach: _alarmProfileModelAttach,
  version: '3.1.0+1',
);

int _alarmProfileModelEstimateSize(
  AlarmProfileModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.profileName.length * 3;
  return bytesCount;
}

void _alarmProfileModelSerialize(
  AlarmProfileModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.profileName);
}

AlarmProfileModel _alarmProfileModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AlarmProfileModel(
    profileName: reader.readString(offsets[0]),
  );
  object.isarId = id;
  return object;
}

P _alarmProfileModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _alarmProfileModelGetId(AlarmProfileModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _alarmProfileModelGetLinks(
    AlarmProfileModel object) {
  return [];
}

void _alarmProfileModelAttach(
    IsarCollection<dynamic> col, Id id, AlarmProfileModel object) {
  object.isarId = id;
}

extension AlarmProfileModelQueryWhereSort
    on QueryBuilder<AlarmProfileModel, AlarmProfileModel, QWhere> {
  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AlarmProfileModelQueryWhere
    on QueryBuilder<AlarmProfileModel, AlarmProfileModel, QWhereClause> {
  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AlarmProfileModelQueryFilter
    on QueryBuilder<AlarmProfileModel, AlarmProfileModel, QFilterCondition> {
  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterFilterCondition>
      profileNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterFilterCondition>
      profileNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'profileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterFilterCondition>
      profileNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'profileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterFilterCondition>
      profileNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'profileName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterFilterCondition>
      profileNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'profileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterFilterCondition>
      profileNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'profileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterFilterCondition>
      profileNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'profileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterFilterCondition>
      profileNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'profileName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterFilterCondition>
      profileNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profileName',
        value: '',
      ));
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterFilterCondition>
      profileNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'profileName',
        value: '',
      ));
    });
  }
}

extension AlarmProfileModelQueryObject
    on QueryBuilder<AlarmProfileModel, AlarmProfileModel, QFilterCondition> {}

extension AlarmProfileModelQueryLinks
    on QueryBuilder<AlarmProfileModel, AlarmProfileModel, QFilterCondition> {}

extension AlarmProfileModelQuerySortBy
    on QueryBuilder<AlarmProfileModel, AlarmProfileModel, QSortBy> {
  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterSortBy>
      sortByProfileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileName', Sort.asc);
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterSortBy>
      sortByProfileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileName', Sort.desc);
    });
  }
}

extension AlarmProfileModelQuerySortThenBy
    on QueryBuilder<AlarmProfileModel, AlarmProfileModel, QSortThenBy> {
  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterSortBy>
      thenByProfileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileName', Sort.asc);
    });
  }

  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QAfterSortBy>
      thenByProfileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileName', Sort.desc);
    });
  }
}

extension AlarmProfileModelQueryWhereDistinct
    on QueryBuilder<AlarmProfileModel, AlarmProfileModel, QDistinct> {
  QueryBuilder<AlarmProfileModel, AlarmProfileModel, QDistinct>
      distinctByProfileName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profileName', caseSensitive: caseSensitive);
    });
  }
}

extension AlarmProfileModelQueryProperty
    on QueryBuilder<AlarmProfileModel, AlarmProfileModel, QQueryProperty> {
  QueryBuilder<AlarmProfileModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<AlarmProfileModel, String, QQueryOperations>
      profileNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profileName');
    });
  }
}
