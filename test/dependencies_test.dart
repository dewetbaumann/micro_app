import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:yaml/yaml.dart';

void main() {
  test('Verificar presencia de Dio en dependencias', () {
    // Read and Get pubspec
    const pubspecYamlPath = 'pubspec.yaml';
    final pubspecFile = File(pubspecYamlPath);
    if (!pubspecFile.existsSync()) fail('El archivo pubspec.yaml no se encontró en la ruta especificada.');
    final pubspecContent = pubspecFile.readAsStringSync();
    final pubspec = loadYaml(pubspecContent) as Map;
    final dependencies = pubspec['dependencies'] as YamlMap;
    final devDependencies = pubspec['dev_dependencies'] as YamlMap;

    // Check main dependecies
    final existDio = dependencies.containsKey('dio');
    final existPrintMap = dependencies.containsKey('print_map');
    final existLogger = dependencies.containsKey('logger');
    final existLint = devDependencies.containsKey('lint');

    expect(existDio, isTrue, reason: 'Dio no está presente en las dependencies.');
    expect(existLogger, isTrue, reason: 'El Logger no está presente en las dependencies.');
    expect(existPrintMap, isTrue, reason: 'El printer de Map no está presente en las dependencies.');
    expect(existLint, isTrue, reason: 'El linter no está presente en las dev_dependencies.');
  });
}
