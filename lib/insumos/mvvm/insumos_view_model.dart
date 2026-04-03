import 'package:flutter/material.dart';
import 'package:flutter_application_1/insumos/models/insumos.dart';
import 'package:flutter_application_1/insumos/servicos/insumos_servicos.dart';

class InsumosViewModel extends ChangeNotifier {
  //Criando a instância do serviço de insumos
  final InsumosServicos _insumosServicos = InsumosServicos();
  List<Insumo> _insumos = [];
  InsumosViewModel() {
    _obterInsumos();
  }

  Future<bool> inserirInsumo(Insumo insumo) async {
    try {
      await _insumosServicos.inserirInsumo(insumo);
      _obterInsumos(); // Atualiza a lista de insumos após inserção
      return Future.value(true);
    } catch(e){
      return Future.value(false);
    }    
  }  

  List<Insumo> get insumos => _insumos;

  Future<void> _obterInsumos() async {
     _insumos = await _insumosServicos.obterInsumos();
     notifyListeners();
  }

  Future<void> atualizarInsumo(Insumo insumo) async {
    await _insumosServicos.inserirInsumo(insumo);
    await _obterInsumos(); // Atualiza a lista de insumos após atualização
  }

  Future<void> deletarInsumo(int id) async {
    await _insumosServicos.deletarInsumo(id);
    await _obterInsumos(); // Atualiza a lista de insumos após exclusão
    
  }

}
