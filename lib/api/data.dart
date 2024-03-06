import 'package:dio/dio.dart';

class StudentData {
  final int id;
  final String firstName;
  final String lastName;
  final String course;
  final int score;
  final String createdAt;
  final String updatedAt;

  StudentData(this.id, this.firstName, this.lastName, this.course, this.score,
      this.createdAt, this.updatedAt);

  StudentData.fromJson(dynamic json)
      : id = json['id'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        course = json['course'],
        score = json['score'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];
}

class HttpClient {
  static Dio instance = Dio(BaseOptions(
    baseUrl: 'https://api.gymjibi.com/Dkm7SCusZw/',
  ));
}

Future<List<StudentData>> getStudents() async {
  final response = await HttpClient.instance.get('gyms/all');
  print(response);
  final List<StudentData> students = [];

  if (response.data is List) {
    for (var element in (response.data as List)) {
      students.add(StudentData.fromJson(element));
    }
  }
  return students;
}

Future<StudentData> saveStudent(
    String firstName, String lastName, String course, int score) async {
  final response = await HttpClient.instance.post('experts/student', data: {
    "first_name": firstName,
    "last_name": lastName,
    "course": course,
    "score": score
  });

  if (response.statusCode == 200) {
    return StudentData.fromJson(response.data);
  } else {
    throw Exception();
  }
}
