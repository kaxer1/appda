import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:appda/models/scan_model.dart';
export 'package:appda/models/scan_model.dart';


class DBServices {

  static Database? _database;
  static final DBServices db = DBServices._();
  DBServices._();

  Future<Database> get database async {
    if ( _database != null ) return _database!;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async{

    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ScansDB.db' );

    // Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) { },
      onCreate: ( Database db, int version ) async {

        await db.execute('''
          CREATE TABLE Scans(
            id VARCHAR(40) PRIMARY KEY,
            idPadre VARCHAR(40),
            nombres TEXT,
            apellidos TEXT,
            celular TEXT,
            email TEXT,
            fingreso TEXT
          )
        ''');
      }
    );
  }

  Future<int> nuevoScanRaw( ScanModel nuevoScan ) async {

    final id = nuevoScan.id;
    final idPadre = nuevoScan.idPadre;
    final nombres = nuevoScan.nombres;
    final apellidos = nuevoScan.apellidos;
    final celular = nuevoScan.celular;
    final email = nuevoScan.email;

    // Verificar la base de datos
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Scans( id, idPadre, nombres, apellidos, celular, email, fingreso )
        VALUES( $id, $idPadre, '$nombres', '$apellidos', '$celular', '$email', datetime('now', 'localtime') )
    ''');

    return res;
  }

  Future<int> nuevoScan( ScanModel nuevoScan ) async {

    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson() );

    // Es el ID del último registro insertado;
    return res;
  }

  Future<List<ScanModel>> getScanByIdPadre( String idPadre ) async {

    final db  = await database;
    final res = await db.query('Scans', where: 'idPadre = ?', whereArgs: [idPadre]);

    return res.isNotEmpty
          ? res.map( (s) => ScanModel.fromJson(s) ).toList()
          : [];
  }

  Future<List<ScanModel>> getTodosLosScans() async {

    final db  = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty
          ? res.map( (s) => ScanModel.fromJson(s) ).toList()
          : [];
  }
  Future<List<ScanModel>> getMiembrosReferidos() async {

    final db  = await database;
    final res = await db.query('Scans', where: 'idPadre is null');

    return res.isNotEmpty
          ? res.map( (s) => ScanModel.fromJson(s) ).toList()
          : [];
  }

  Future<int> updateScan( ScanModel nuevoScan ) async {
    final db  = await database;
    final res = await db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [ nuevoScan.id ] );
    return res;
  }

  Future<int> deleteScan( int id ) async {
    final db  = await database;
    final res = await db.delete( 'Scans', where: 'id = ?', whereArgs: [id] );
    return res;
  }

  Future<int> deleteAllScans() async {
    final db  = await database;
    final res = await db.rawDelete('''
      DELETE FROM Scans    
    ''');
    return res;
  }


}

