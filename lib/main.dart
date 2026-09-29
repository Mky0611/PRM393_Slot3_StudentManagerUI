import 'package:flutter/material.dart';

import 'models/student.dart';
import 'services/student_service.dart';

void main() {
  runApp(const StudentManagerApp());
}

class StudentManagerApp extends StatelessWidget {
  const StudentManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StudentService _studentService = StudentService();
  bool _showGpaQualified = false;

  @override
  Widget build(BuildContext context) {
    final List<Student> students = _showGpaQualified
        ? _studentService.getStudentsWithGpaAbove(3.2)
        : _studentService.getAllStudents();
    final List<String> displayStrings =
        _studentService.getDisplayStrings(students);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Manager - Dart Core + UI'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: SegmentedButton<bool>(
              segments: const [
                ButtonSegment<bool>(
                  value: false,
                  label: Text('All Students'),
                  icon: Icon(Icons.groups_outlined),
                ),
                ButtonSegment<bool>(
                  value: true,
                  label: Text('GPA >= 3.2'),
                  icon: Icon(Icons.grade_outlined),
                ),
              ],
              selected: {_showGpaQualified},
              onSelectionChanged: (selection) {
                setState(() => _showGpaQualified = selection.first);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text(student.name),
                    subtitle: Text(displayStrings[index]),
                    trailing: Chip(
                      avatar: const Icon(Icons.star, size: 16),
                      label: Text(student.gpa.toStringAsFixed(1)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}