import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/student.dart';

class FirebaseService {
  final CollectionReference _students =
      FirebaseFirestore.instance.collection('students');

  // CREATE - Add new student
  Future<void> addStudent(Student student) async {
    await _students.add(student.toMap());
  }

  // READ - Get all students
  Stream<List<Student>> getStudents() {
    return _students.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Student.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // UPDATE - Update existing student
  Future<void> updateStudent(Student student) async {
    await _students.doc(student.id).update(student.toMap());
  }

  // DELETE - Delete student
  Future<void> deleteStudent(String id) async {
    await _students.doc(id).delete();
  }
}