import 'dart:io';

void main() {
  // Base directory for the project
  const String baseDir = 'lib/features/reviews';

  // List of directories to create
  final List<String> directories = [
    '$baseDir/models',
    '$baseDir/providers',
    '$baseDir/screens',
    '$baseDir/widgets',
  ];

  // Create directories
  print('Creating project folder structure...');
  for (String dir in directories) {
    Directory(dir).createSync(recursive: true);
    print('Created: $dir');
  }

  // Create main.dart file if it doesn't exist
  const String mainFilePath = 'lib/main.dart';
  final File mainFile = File(mainFilePath);
  if (!mainFile.existsSync()) {
    mainFile.writeAsStringSync('void main() => runApp(const MyApp());');
    print('Created: $mainFilePath');
  } else {
    print('$mainFilePath already exists.');
  }

  print('Folder structure created successfully!');
}
