[![pub package](https://img.shields.io/pub/v/file_testing.svg)](https://pub.dev/packages/file_testing)

A simple and effective way to test file-related operations in Dart. 
This package provides a memory-based file system for safe and isolated testing, 
allowing you to simulate any file-related operation without affecting your actual file system.

## Features

* **Isolated Testing Environments**: Each test runs in its own file system environment, 
preventing interference between tests.
* **Safe Testing**: Mock file operations in memory without affecting the real file system.
* **Matchers**: A series of matchers to be used in tests that work with file system types.

## Usage
```dart
import 'dart:io';
import 'package:file_testing/file_testing.dart';
import 'package:test/test.dart';

void main() {
  test('some test', () async {
    await FakeFile.runZoned(() {
      final File file = File('foo.txt');
      file.createSync();

      expect(file, isFile);
      expect(file, exists);
    });
  });
}

```
