class Student {
  String? id;
  String name;
  String studentId;
  String email;
  String course;
  int age;

  Student({
    this.id,
    required this.name,
    required this.studentId,
    required this.email,
    required this.course,
    required this.age,
  });

  // Convert Firestore data to Student object
  factory Student.fromMap(Map<String, dynamic> map, String id) {
    return Student(
      id: id,
      name: map['name'] ?? '',
      studentId: map['studentId'] ?? '',
      email: map['email'] ?? '',
      course: map['course'] ?? '',
      age: map['age'] ?? 0,
    );
  }

  // Convert Student object to Firestore data
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'studentId': studentId,
      'email': email,
      'course': course,
      'age': age,
    };
  }
}