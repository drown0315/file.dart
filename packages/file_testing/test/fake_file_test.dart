import 'dart:io';

import 'package:file_testing/file_testing.dart';
import 'package:test/test.dart';

void main() {
  group('Fake File', () {
    test('create file does not affect real system', () async {
      final String path = 'test.txt';
      final bool isCreateSuccess = await FakeFile.runZoned(() async {
        final File file = File(path);
        file.createSync();
        return file.existsSync();
      });

      expect(isCreateSuccess, isTrue);
      expect(File(path).existsSync(), isFalse);
    });

    test('create directory does not affect real system', () async {
      final String path = 'mocker_test';
      final bool isCreateSuccess = await FakeFile.runZoned(() async {
        final Directory directory = Directory(path);
        await directory.create();
        return directory.exists();
      });

      expect(isCreateSuccess, isTrue);
      expect(Directory(path).existsSync(), isFalse);
    });

    test('create link does not affect real system', () async {
      final String path = 'test_link';
      final bool isCreateSuccess = await FakeFile.runZoned(() async {
        final Link link = Link(path);
        link.createSync('test.txt');
        return link.existsSync();
      });

      expect(isCreateSuccess, isTrue);
      expect(Link(path).existsSync(), isFalse);
    });
  });
}
