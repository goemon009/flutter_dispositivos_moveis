import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/insumos/models/insumos.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class InsumosServicos {
  InsumosServicos._internal();

  static final InsumosServicos _instancia = InsumosServicos._internal();
  factory InsumosServicos() => _instancia;

  static Database? _dados;

  Future<Database> _iniciarDados() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'insumos.db');
    return await openDatabase(path, version: 2, onCreate: _criarDB);
  }

  Future<void> _criarDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE insumos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        descricao TEXT,
        estoqueMinimo INTEGER,
        categoria TEXT,
        unidadeMedida TEXT,
        imagem TEXT
      )
    ''');
  }

  Future<Database> get dados async {
    if (_dados != null) return _dados!;
    _dados = await _iniciarDados();
    return _dados!;
  }

  //Método para inserir dados no banco de dados
  Future<int> inserirInsumo(Insumo insumo) async {
    debugPrint("Inserindo insumo: ${insumo.nome}");
    debugPrint("Dados do insumo: ${insumo.toMap()}");
    Database db = await dados;
    return await db.insert(
      'insumos',
      insumo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Insumo>> obterInsumos() async {
    Database db = await dados;
    List<Map<String, dynamic>> maps = await db.query('insumos');
    return List.generate(maps.length, (i) {
      return Insumo.fromMap(maps[i]);
    });
  }

  Future<int> deletarInsumo(int id) async {
    Database db = await dados;
    return await db.delete('insumos', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> atualizarInsumo(Insumo insumo) async {
    Database db = await dados;
    return await db.update(
      'insumos',
      insumo.toMap(),
      where: 'id = ?',
      whereArgs: [insumo.id],
    );
  }

  Future close() async {
    Database db = await dados;
    db.close();
  }
}
