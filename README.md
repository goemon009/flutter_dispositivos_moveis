# flutter_application_1

Aplicativo Flutter para controle de insumos com navegação por abas e persistência local em SQLite.

## Visão geral

O app está organizado em módulos e usa `Provider` para gerenciar o estado da tela de insumos. A navegação principal fica em `MainPage`, com quatro áreas:

- Dashboard
- Insumos
- Estoque
- Perfil

Hoje, a parte mais completa do projeto é a de **Insumos**, que permite cadastrar, listar, editar e remover registros salvos localmente.

## O que o módulo de insumos faz

- Cadastro de insumos com nome, descrição, estoque mínimo, categoria, unidade de medida e imagem
- Captura de imagem pela câmera ou seleção da galeria
- Armazenamento local com `sqflite`
- Listagem dos registros salvos
- Edição e exclusão de itens

## Arquitetura do código

- `lib/main.dart`: inicialização do app e injeção do `InsumosViewModel`
- `lib/mainpage/`: tela principal com `NavigationBar`
- `lib/insumos/models/`: modelo de dados `Insumo`
- `lib/insumos/mvvm/`: estado e regras de negócio com `ChangeNotifier`
- `lib/insumos/servicos/`: acesso ao banco SQLite
- `lib/insumos/pages/`: telas de lista, criação e edição

## Tecnologias usadas

- Flutter
- Provider
- sqflite
- path_provider
- image_picker

## Estrutura atual das telas

- `Dashboard`, `Estoque` e `Perfil` ainda estão como telas simples de base
- `Insumos` já concentra o fluxo funcional principal do aplicativo

## Como rodar

```bash
flutter pub get
flutter run
```

## Observações

- O banco local é criado no dispositivo com o nome `insumos.db`
- A imagem do insumo é salva em Base64 no banco
- O projeto está configurado para não ser publicado no pub.dev (`publish_to: 'none'`)
