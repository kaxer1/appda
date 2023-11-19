import 'dart:io';
import 'package:appda/models/entidad.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DBServices<T> {

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
    final path = join( documentsDirectory.path, 'ControlFinancieroDB.db' );

    // Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) { },
      onCreate: ( Database db, int version ) async {
        await _crearTablas(db);
        await _insertarDefault(db);
      }
    );
  }

  Future<void> _crearTablas(Database db) async {
    await db.execute('''
      CREATE TABLE catalogo(
        ccatalogo VARCHAR(3) PRIMARY KEY,
        nombre VARCHAR(100),
        activo INTEGER
      );      
    ''');
    await db.execute('''
      CREATE TABLE catalogodetalle(
        ccatalogo VARCHAR(3),
        cdetalle VARCHAR(6),
        nombre VARCHAR(100),
        activo INTEGER,
        FOREIGN KEY (ccatalogo) REFERENCES catalogo(ccatalogo)
      );
      ALTER TABLE catalogodetalle ADD PRIMARY KEY (ccatalogo, cdetalle);
    ''');
  }
  Future<void> _insertarDefault(Database db) async {

    await db.execute(''' INSERT INTO catalogo(ccatalogo, nombre, activo) values('ING', 'Ingresos', 1)
      ,('GAS', 'Gastos', 1)
    ''');
    await db.execute(''' INSERT INTO catalogodetalle(ccatalogo, cdetalle, nombre, activo) values('GAS', 'COMID', 'Comida', 1)
      ,('GAS', 'TRANS', 'Transporte', 1), ('GAS', 'GYM', 'Gimnasio', 1), ('ING', 'SALA', 'Salario', 1)
      ,('ING', 'INGADI', 'Ingresos adicionales', 1), ('ING', 'INGALQ', 'Ingresos de alquiler', 1) 
    ''');
  }

  /// Metodo que inserta el o los registros segun un filtro
  Future<int> insertarEntity( String nombreTabla, EntidadModel entidad ) async {

    // Verificar la base de datos
    final db = await database;
    final res = await db.insert(nombreTabla, entidad.toJson() );
    // Es el ID del último registro insertado;
    return res;
  }

  /// Metodo que actualiza el o los registros segun un filtro
  Future<int> updateEntity( String nombreTabla, EntidadModel entidad, Map<String, dynamic> filtro ) async {
    final db  = await database;
    final res = await db.update(nombreTabla, entidad.toJson(), where: _mapToStringKeys(filtro), whereArgs: _mapToListValues(filtro) );
    // final res = await db.update('Scans', entidad.toJson(), where: 'id = ?', whereArgs: [ entidad.id ] );
    return res;
  }

  /// Metodo que elimina el o los registros segun un filtro
  Future<int> deleteEntity(  String nombreTabla, Map<String, dynamic> filtro ) async {
    final db  = await database;
    final res = await db.delete( nombreTabla, where: _mapToStringKeys(filtro), whereArgs: _mapToListValues(filtro) );
    return res;
  }

  /// Metodo que elimina todos los registro de una tabla
  Future<int> deleteAll(String nombreTabla) async {
    final db  = await database;
    final res = await db.rawDelete('''DELETE FROM $nombreTabla''');
    return res;
  }

  /// Metodo que lista los objetos de cualquier modelo
  Future<List<T>> getListaEntidad( String nombreTabla, EntidadModel entidad, [Map<String, dynamic>? filtro] ) async {

    final db  = await database;
    List<Map<String, Object?>> res;
    if (filtro != null) {
      res = await db.query(nombreTabla, where: _mapToStringKeys(filtro), whereArgs: _mapToListValues(filtro));
    } else {
      res = await db.query(nombreTabla);
    }

    return res.isNotEmpty
          ? res.map( (s) => entidad.fromJson(s) as T ).toList()
          : [];
  }

  String? _mapToStringKeys(Map<String, dynamic> filtro) {
    String? condiconal;
    for (var clave in filtro.keys) {
      if (condiconal == null) {
        condiconal = '$clave = ?';
      } else {
        condiconal = ' and $clave = ?';
      }
      print('Clave: $clave');
    }
    return condiconal;
  }

  List<Object?> _mapToListValues(Map<String, dynamic> filtro) {
    List<Object?> lvalores = [];
    for (var valor in filtro.values) {
      lvalores.add(valor);
      print('Valor: $valor');
    }
    return lvalores;
  }

}

