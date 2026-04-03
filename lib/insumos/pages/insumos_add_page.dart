import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/insumos/models/insumos.dart';
import 'package:flutter_application_1/insumos/mvvm/insumos_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class InsumosAddPage extends StatefulWidget {
  InsumosAddPage({super.key});

  @override
  State<InsumosAddPage> createState() => _InsumosAddPageState();
}

class _InsumosAddPageState extends State<InsumosAddPage> {
  TextEditingController nome = TextEditingController();

  TextEditingController descricao = TextEditingController();

  TextEditingController estoqueMin = TextEditingController();

  TextEditingController categoria = TextEditingController();

  TextEditingController unidadeMedida = TextEditingController();
  File? _foto;
  String? imagem;
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
                    'Registrar Insumo',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  InkWell(
                    onTap: _obterImagem,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: _foto == null
                          ? Icon(
                              Icons.photo_camera,
                              size: 60,
                              color: Colors.blueAccent,
                            )
                          : ClipOval(
                              child: Image.file(_foto!, fit: BoxFit.fill),
                            ),
                    ),
                  ),

                  SizedBox(height: 20),

                  TextFormField(
                    controller: nome,
                    decoration: InputDecoration(
                      labelText: "Nome",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  TextFormField(
                    controller: descricao,
                    decoration: InputDecoration(
                      labelText: "Descrição",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  TextFormField(
                    controller: estoqueMin,
                    decoration: InputDecoration(
                      labelText: "Estoque mínimo",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  TextFormField(
                    controller: categoria,
                    decoration: InputDecoration(
                      labelText: "Categoria",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  TextFormField(
                    controller: unidadeMedida,
                    decoration: InputDecoration(
                      labelText: "Unidade de Medida",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Insumo insumo = Insumo();
                          insumo.nome = nome.text;
                          insumo.descricao = descricao.text;
                          insumo.estoqueMinimo = int.parse(estoqueMin.text);
                          insumo.categoria = categoria.text;
                          insumo.unidadeMedida = unidadeMedida.text;
                          insumo.imagem = imagem;

                          viewModel.inserirInsumo(insumo);
                        },
                        child: Text("Salvar"),
                      ),

                      SizedBox(width: 10),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
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

  Future<void> _obterImagem() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Galeria'),
              onTap: () {
                obterImagemGaleria();
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Câmera'),
              onTap: () {
                obterImagemCamera();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> obterImagemGaleria() async {
    Uint8List bytes;
    final picker = ImagePicker();
    //abre o widget de captura de iagem
    final XFile? imagemGal = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 200,
      maxHeight: 200,
    );
    if (imagemGal != null) {
      File imagemFile = File(imagemGal.path);
      List<int> imagemBytes = await imagemFile.readAsBytes();
      setState(() {
        _foto = imagemFile;
        imagem = base64Encode(imagemBytes);
      });
    }
  }

  Future<void> obterImagemCamera() async {
    Uint8List bytes;
    final picker = ImagePicker();
    //abre o widget de captura de iagem
    final XFile? imagemCam = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 200,
      maxHeight: 200,
    );
    if (imagemCam != null) {
      File imagemFile = File(imagemCam.path);
      List<int> imagemBytes = await imagemFile.readAsBytes();
      setState(() {
        _foto = imagemFile;
        imagem = base64Encode(imagemBytes);
      });
    }
  }
}
