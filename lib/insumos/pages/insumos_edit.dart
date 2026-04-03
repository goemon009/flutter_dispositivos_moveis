import 'package:flutter/material.dart';
import 'package:flutter_application_1/insumos/models/insumos.dart';
import 'package:flutter_application_1/insumos/mvvm/insumos_view_model.dart';
import 'package:provider/provider.dart';

class InsumosEditPage extends StatelessWidget {

  InsumosEditPage({super.key, this.insumo});
  Insumo? insumo;

  TextEditingController nome = TextEditingController();
  TextEditingController descricao = TextEditingController();
  TextEditingController estoqueMin = TextEditingController();
  TextEditingController categoria = TextEditingController();
  TextEditingController unidadeMedida = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<InsumosViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                children: [
                  Text(
                    'Editar Insumo',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 20),

                  TextFormField(
                    initialValue: insumo?.nome,
                    controller: nome,
                    decoration: InputDecoration(
                      labelText: "Nome",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  TextFormField(
                    initialValue: insumo?.descricao,
                    controller: descricao,                    
                    decoration: InputDecoration(
                      labelText: "Descrição",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  TextFormField(
                    initialValue: insumo?.estoqueMinimo.toString(),
                    controller: estoqueMin,                    
                    decoration: InputDecoration(
                      labelText: "Estoque mínimo",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  TextFormField(
                    initialValue: insumo?.categoria,
                    controller: categoria,
                    decoration: InputDecoration(
                      labelText: "Categoria",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  TextFormField(
                    initialValue: insumo?.unidadeMedida,
                    controller: unidadeMedida,
                    decoration: InputDecoration(
                      labelText: "Unidade de Medida",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Salvar"),
                      ),

                      SizedBox(width: 10),

                      ElevatedButton(
                        onPressed: () {
                          Insumo insumo = Insumo();
                          insumo.nome = nome.text;
                          insumo.descricao = descricao.text;
                          insumo.estoqueMinimo =
                              int.parse(estoqueMin.text);
                          insumo.categoria = categoria.text;
                          insumo.unidadeMedida = unidadeMedida.text;
                          viewModel.inserirInsumo(insumo);
                        },
                        child: Text("Cancelar"),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
