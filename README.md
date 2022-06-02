# splash_screen_login

A new Flutter project.

## Getting Started

consumir itens dos assets => criar um 'mock' dos objetos na pasta assets e configurar no pubspec
flutter:
  uses-material-design: true

  assets:
    - assets/data.json

importar a dependencia do DIO no pubspec (consumir API)
dependencies:
  dio: ^4.0.6

importar a depencia do shared_dependencies no pubspec (salva em memória chave e valor singleton)
dependencies:
  shared_preferences: ^2.0.15