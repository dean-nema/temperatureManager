// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_temp_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarTempRecordCollection on Isar {
  IsarCollection<IsarTempRecord> get isarTempRecords => this.collection();
}

const IsarTempRecordSchema = CollectionSchema(
  name: r'IsarTempRecord',
  id: 3130890801021669692,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'fridgeTemp': PropertySchema(
      id: 1,
      name: r'fridgeTemp',
      type: IsarType.stringList,
    ),
    r'roomTemp': PropertySchema(
      id: 2,
      name: r'roomTemp',
      type: IsarType.stringList,
    )
  },
  estimateSize: _isarTempRecordEstimateSize,
  serialize: _isarTempRecordSerialize,
  deserialize: _isarTempRecordDeserialize,
  deserializeProp: _isarTempRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarTempRecordGetId,
  getLinks: _isarTempRecordGetLinks,
  attach: _isarTempRecordAttach,
  version: '3.1.0+1',
);

int _isarTempRecordEstimateSize(
  IsarTempRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.fridgeTemp.length * 3;
  {
    for (var i = 0; i < object.fridgeTemp.length; i++) {
      final value = object.fridgeTemp[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.roomTemp.length * 3;
  {
    for (var i = 0; i < object.roomTemp.length; i++) {
      final value = object.roomTemp[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _isarTempRecordSerialize(
  IsarTempRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeStringList(offsets[1], object.fridgeTemp);
  writer.writeStringList(offsets[2], object.roomTemp);
}

IsarTempRecord _isarTempRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarTempRecord();
  object.date = reader.readDateTime(offsets[0]);
  object.fridgeTemp = reader.readStringList(offsets[1]) ?? [];
  object.id = id;
  object.roomTemp = reader.readStringList(offsets[2]) ?? [];
  return object;
}

P _isarTempRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarTempRecordGetId(IsarTempRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarTempRecordGetLinks(IsarTempRecord object) {
  return [];
}

void _isarTempRecordAttach(
    IsarCollection<dynamic> col, Id id, IsarTempRecord object) {
  object.id = id;
}

extension IsarTempRecordQueryWhereSort
    on QueryBuilder<IsarTempRecord, IsarTempRecord, QWhere> {
  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarTempRecordQueryWhere
    on QueryBuilder<IsarTempRecord, IsarTempRecord, QWhereClause> {
  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarTempRecordQueryFilter
    on QueryBuilder<IsarTempRecord, IsarTempRecord, QFilterCondition> {
  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fridgeTemp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fridgeTemp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fridgeTemp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fridgeTemp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fridgeTemp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fridgeTemp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fridgeTemp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fridgeTemp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fridgeTemp',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fridgeTemp',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridgeTemp',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridgeTemp',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridgeTemp',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridgeTemp',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridgeTemp',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      fridgeTempLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fridgeTemp',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomTemp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomTemp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomTemp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomTemp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roomTemp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roomTemp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roomTemp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roomTemp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomTemp',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roomTemp',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'roomTemp',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'roomTemp',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'roomTemp',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'roomTemp',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'roomTemp',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterFilterCondition>
      roomTempLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'roomTemp',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension IsarTempRecordQueryObject
    on QueryBuilder<IsarTempRecord, IsarTempRecord, QFilterCondition> {}

extension IsarTempRecordQueryLinks
    on QueryBuilder<IsarTempRecord, IsarTempRecord, QFilterCondition> {}

extension IsarTempRecordQuerySortBy
    on QueryBuilder<IsarTempRecord, IsarTempRecord, QSortBy> {
  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }
}

extension IsarTempRecordQuerySortThenBy
    on QueryBuilder<IsarTempRecord, IsarTempRecord, QSortThenBy> {
  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension IsarTempRecordQueryWhereDistinct
    on QueryBuilder<IsarTempRecord, IsarTempRecord, QDistinct> {
  QueryBuilder<IsarTempRecord, IsarTempRecord, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QDistinct>
      distinctByFridgeTemp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fridgeTemp');
    });
  }

  QueryBuilder<IsarTempRecord, IsarTempRecord, QDistinct> distinctByRoomTemp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomTemp');
    });
  }
}

extension IsarTempRecordQueryProperty
    on QueryBuilder<IsarTempRecord, IsarTempRecord, QQueryProperty> {
  QueryBuilder<IsarTempRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarTempRecord, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<IsarTempRecord, List<String>, QQueryOperations>
      fridgeTempProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fridgeTemp');
    });
  }

  QueryBuilder<IsarTempRecord, List<String>, QQueryOperations>
      roomTempProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomTemp');
    });
  }
}
