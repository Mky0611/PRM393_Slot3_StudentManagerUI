import '../models/student.dart';

class StudentService {
  final List<Student> _students = const [
    Student(
      id: 'S001',
      name: 'Phuoc Thinh',
      age: 20,
      gpa: 3.8,
      major: 'Software Engineering',
    ),
    Student(
      id: 'S002',
      name: 'Lan Anh',
      age: 19,
      gpa: 3.5,
      major: 'Information Technology',
    ),
    Student(
      id: 'S003',
      name: 'Minh Quan',
      age: 21,
      gpa: 3.2,
      major: 'Computer Science',
    ),
    Student(
      id: 'S004',
      name: 'Bao Ngoc',
      age: 20,
      gpa: 2.9,
      major: 'Business Administration',
    ),
    Student(
      id: 'S005',
      name: 'Gia Huy',
      age: 22,
      gpa: 3.1,
      major: 'Digital Marketing',
    ),
  ];

  List<Student> getAllStudents() => List.unmodifiable(_students);

  List<Student> getStudentsWithGpaAbove(double minGpa) =>
      _students.where((student) => student.gpa >= minGpa).toList();

  List<String> getDisplayStrings(List<Student> list) => list
      .map((student) => '${student.major} • Age ${student.age}')
      .toList();
}