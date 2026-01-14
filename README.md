# App Multiplier – Teste Técnico Flutter

Este projeto é um aplicativo móvel desenvolvido em **Flutter** como parte do teste técnico para a **Multiplier**.  
O objetivo da aplicação é consumir dados de uma API externa para listar e exibir detalhes de **Pokémons**, demonstrando conhecimentos em **arquitetura de software**, **gerência de estado** e **estruturação escalável**.

---

##  Descrição do Projeto

O aplicativo realiza a **listagem de Pokémons** com paginação, navegação para detalhes e tratamento de erros.  
Ele foi construído com foco na **separação de responsabilidades (Clean Architecture)** e utiliza o padrão **BLoC** para gerenciamento de estado.

### Principais funcionalidades
-  Listagem de Pokémons com paginação (`limit` & `offset`)
-  Navegação para detalhes do Pokémon
-  Tratamento de erros e exceções customizadas
-  Arquitetura modular e testável

---

## API Utilizada

O projeto consome a **PokeAPI**, uma API RESTful pública.

- **Base URL:** `https://pokeapi.co/api/v2/`
- **Endpoints:** Listagem e Detalhes
- **Documentação:** https://pokeapi.co/

---

## Arquitetura e Tecnologias

O projeto segue estritamente a **Clean Architecture**, dividindo o código em camadas de responsabilidade única.  
Além disso, utiliza um módulo **Core** para recursos compartilhados como **Network, Injeção de Dependência e Tratamento de Erros**.

---

## Estrutura de Pastas

```text
lib/
├── features/
│   ├── core/
│   │   ├── di/
│   │   ├── error/
│   │   ├── network/
│   │   └── storage/
│   └── pokemon/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       └── presentation/
│           ├── pages/
│           ├── state/
│           │   ├── bloc/
│           │   └── states/
│           └── widgets/
└── main.dart
```

---

##  Decisões Técnicas

- **Gerência de Estado:** BLoC  
- **Repository Pattern:** Abstração da fonte de dados (API ou Mock)  
- **Injeção de Dependência:** Centralizada no módulo `core/di`  
- **Testes:** Estrutura preparada para testes unitários de UseCases e Mocks  

---

##  Como rodar o App

Certifique-se de ter o **Flutter SDK >= 3.0** instalado.

```bash
git clone https://github.com/MatheusMed/app_multiplier_teste_tecnico
cd app_multiplier_teste_tecnico
flutter pub get
flutter run
```

---

## Como executar os testes

```bash
flutter test
```

---
