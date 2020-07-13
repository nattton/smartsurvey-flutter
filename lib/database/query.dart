import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smartsurveys/model/surveymetric.dart';
import 'package:sqflite/sqflite.dart';
import 'package:smartsurveys/model/surveygroup.dart';
import 'package:smartsurveys/database/database_helper.dart';

class QueryCtr {
  DatabaseHelper con = new DatabaseHelper();
  Future<List<SurveyGroup>> getAllSurveyGroups() async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps = await db.query(SurveyGroup.tableName);
    final list = List<SurveyGroup>.generate(maps.length, (i) {
      return SurveyGroup.fromMap(maps[i]);
    });
    return list;
  }

  Future<List<SurveyMetric>> getSurveyMetrics(int groupId) async {
    final Database db = await con.db;
    final List<Map<String, dynamic>> maps = await db.query(SurveyMetric.tableName,
    where: '"' + SurveyMetric.columnGroupId+'" = ?',
    whereArgs: [groupId]);

    final list = List<SurveyMetric>.generate(maps.length, (i) {
      return SurveyMetric.fromMap(maps[i]);
    });
    return list;
  }
}