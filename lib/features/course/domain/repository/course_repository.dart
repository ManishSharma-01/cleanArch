import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/course_remote_repo_provider.dart';
import '../entity/course_entity.dart';

final courseRepositoryProvider = Provider<ICourseRepository>(
  (ref) {
    return ref.read(courseRemoteRepoProvider);
  },
);

abstract class ICourseRepository {
  Future<Either<Failure, bool>> addCourse(CourseEntity course);
  Future<Either<Failure, List<CourseEntity>>> getAllCourses();
}
