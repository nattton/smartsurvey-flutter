import 'dart:async';
import 'package:smartsurveys/models/Amphur.dart';
import 'package:smartsurveys/models/Career.dart';
import 'package:smartsurveys/models/Community.dart';
import 'package:smartsurveys/models/DistrictType.dart';
import 'package:smartsurveys/models/Education.dart';
import 'package:smartsurveys/models/Gender.dart';
import 'package:smartsurveys/models/LandRights.dart';
import 'package:smartsurveys/models/Prefix.dart';
import 'package:smartsurveys/models/Province.dart';
import 'package:smartsurveys/models/Relationship.dart';
import 'package:smartsurveys/models/Religion.dart';
import 'package:smartsurveys/models/SurveyMetric.dart';
import 'package:smartsurveys/models/Tumbon.dart';
import 'package:sqflite/sqflite.dart';
import 'package:smartsurveys/models/SurveyGroup.dart';
import 'package:smartsurveys/database/DatabaseHelper.dart';

class QueryCtr {
  DatabaseHelper con = new DatabaseHelper();

  Future<List<Prefix>> getAllPrefixs() async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps = await db.query(Prefix.tableName);
    final list = List<Prefix>.generate(maps.length, (i) {
      return Prefix.fromMap(maps[i]);
    });
    return list;
  }

  Future<List<Gender>> getAllGenders() async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps = await db.query(Gender.tableName);
    final list = List<Gender>.generate(maps.length, (i) {
      return Gender.fromMap(maps[i]);
    });
    return list;
  }

  Future<List<Province>> getAllProvinces() async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps = await db.query(Province.tableName);
    final list = List<Province>.generate(maps.length, (i) {
      return Province.fromMap(maps[i]);
    });
    return list;
  }

  Future<List<Amphur>> getAmphurs(String provinceCode) async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps = await db.query(
      Amphur.tableName,
      where: 'substr(amphur_id,1,2) = ?',
      whereArgs: [provinceCode],
      orderBy: 'id',
    );
    final list = List<Amphur>.generate(maps.length, (i) {
      return Amphur.fromMap(maps[i]);
    });
    return list;
  }

  Future<List<Tumbon>> getTumbons(String amphurCode) async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps = await db.query(
      Tumbon.tableName,
      where: 'substr(tumbon_id,1,4) = ?',
      whereArgs: [amphurCode],
      orderBy: 'id',
    );
    final list = List<Tumbon>.generate(maps.length, (i) {
      return Tumbon.fromMap(maps[i]);
    });
    return list;
  }

  Future<List<Community>> getCommunities(String tumbonCode) async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps = await db.query(
      Community.tableName,
      where: 'substr(community_id,1,6) = ?',
      whereArgs: [tumbonCode],
      orderBy: 'id',
    );
    final list = List<Community>.generate(maps.length, (i) {
      return Community.fromMap(maps[i]);
    });
    return list;
  }

  Future<List<DistrictType>> getDistrictTypes(String amphurCode) async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps = await db.query(
      DistrictType.tableName,
      where: 'amphur_id = ?',
      whereArgs: [amphurCode],
      orderBy: 'id',
    );
    final list = List<DistrictType>.generate(maps.length, (i) {
      return DistrictType.fromMap(maps[i]);
    });
    return list;
  }

  Future<List<LandRights>> getAllLandRights() async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps = await db.query(
      LandRights.tableName,
      orderBy: 'id',
    );
    final list = List<LandRights>.generate(maps.length, (i) {
      return LandRights.fromMap(maps[i]);
    });
    return list;
  }

  Future<List<Career>> getAllCareers() async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps = await db.query(Career.tableName);
    final list = List<Career>.generate(maps.length, (i) {
      return Career.fromMap(maps[i]);
    });
    return list;
  }

  Future<List<Education>> getAllEducations() async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps = await db.query(Education.tableName);
    final list = List<Education>.generate(maps.length, (i) {
      return Education.fromMap(maps[i]);
    });
    return list;
  }

  Future<List<Religion>> getAllReligions() async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps = await db.query(Religion.tableName);
    final list = List<Religion>.generate(maps.length, (i) {
      return Religion.fromMap(maps[i]);
    });
    return list;
  }

  Future<List<Relationship>> getAllRelationships() async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps =
        await db.query(Relationship.tableName);
    final list = List<Relationship>.generate(maps.length, (i) {
      return Relationship.fromMap(maps[i]);
    });
    return list;
  }

  Future<List<SurveyGroup>> getAllSurveyGroups() async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps =
        await db.query(SurveyGroup.tableName);
    final list = List<SurveyGroup>.generate(maps.length, (i) {
      return SurveyGroup.fromMap(maps[i]);
    });
    return list;
  }

  Future<List<SurveyMetric>> getSurveyMetrics(int groupId) async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps = await db.query(
        SurveyMetric.tableName,
        where: '"' + SurveyMetric.columnGroupId + '" = ?',
        whereArgs: [groupId]);

    final list = List<SurveyMetric>.generate(maps.length, (i) {
      return SurveyMetric.fromMap(maps[i]);
    });
    return list;
  }
}
