import 'dart:io';

void main() {
  final buffer = StringBuffer()..writeln('class Assets {\n  Assets._();\n');

  final assetDirs = [
    Directory('assets/images'),
    Directory('assets/icons'),
    Directory('assets/fonts'),
    Directory('assets/gif'),
  ];

  for (final dir in assetDirs) {
    if (!dir.existsSync()) continue;
    for (final file in dir.listSync(recursive: true)) {
      if (file is File) {
        final path = file.path.replaceAll('\\', '/');
        final fileName = file.uri.pathSegments.last;

        // 🔒 Skip hidden/system files like `.DS_Store`
        if (fileName.startsWith('.')) continue;

        final nameWithoutExtension = fileName.split('.').first;
        final cleanName = _toCamelCase(nameWithoutExtension);
        buffer.writeln("  static const $cleanName = '$path';");
      }
    }
  }

  buffer.writeln('}');

  File('lib/generated/assets.dart').writeAsStringSync(buffer.toString());

  print('✅ Generated lib/generated/assets.dart');
}

String _toCamelCase(String input) {
  final parts =
      input
          .split(RegExp(r'[^a-zA-Z0-9]+'))
          .where((part) => part.isNotEmpty)
          .toList();

  if (parts.isEmpty) return input;

  return parts.first.toLowerCase() +
      parts
          .skip(1)
          .map((word) => word[0].toUpperCase() + word.substring(1))
          .join();
}
