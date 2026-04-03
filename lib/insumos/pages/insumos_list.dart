import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/insumos/mvvm/insumos_view_model.dart';
import 'package:flutter_application_1/insumos/pages/insumos_add_page.dart';
import 'package:provider/provider.dart';
import 'insumos_edit.dart';

class InsumosListPage extends StatelessWidget {
  const InsumosListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text("+"),
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => InsumosAddPage()));
        },
      ),
      body: Consumer<InsumosViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.insumos.isEmpty) {
            return Center(child: Container(child: Text('Não existe registro')));
          } else {
            return ListView.builder(
              itemCount: viewModel.insumos.length,
              itemBuilder: (context, index) {
                final insumo = viewModel.insumos[index];
                 debugPrint(
                            "Insumo a ser inserido: ${insumo.toMap()}",
                          );
                Uint8List imagem = base64Decode(insumo.imagem!);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(                    
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Nome: '),
                                  Text('${insumo.nome}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Estoque: '),
                                  Text('${insumo.estoqueMinimo}'),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).push(MaterialPageRoute(builder: (context) => InsumosEditPage(insumo: insumo)));
                                },
                                icon: Icon(Icons.edit, color: Colors.green),
                              ),
                              IconButton(
                                onPressed: () {
                                  viewModel.deletarInsumo(insumo.id!);
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
