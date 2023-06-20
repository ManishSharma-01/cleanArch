import '../../../batch/domain/entity/batch_entity.dart';
import '../../../course/domain/entity/course_entity.dart';

class StudentEntity {
  final String? id;
  final String fname;
  final String lname;
  final String phone;
  final String? image;
  final BatchEntity? batch;
  final List<CourseEntity> courses;
  final String username;
  final String password;

  StudentEntity({
    this.id,
    required this.fname,
    required this.lname,
    required this.phone,
    this.image,
    this.batch,
    required this.courses,
    required this.username,
    required this.password,
  });
}
