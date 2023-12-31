import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/http_service.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/api_endpoint.dart';
import '../../domain/entity/course_entity.dart';
import '../dto/get_all_course_dto.dart';
import '../model/course_api_model.dart';

final courseRemoteDataSourceProvider = Provider(
  (ref) => CourseRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    courseApiModel: ref.read(courseApiModelProvider),
  ),
);

class CourseRemoteDataSource {
  final Dio dio;
  final CourseApiModel courseApiModel;

  CourseRemoteDataSource({
    required this.dio,
    required this.courseApiModel,
  });

  Future<Either<Failure, bool>> addCourse(CourseEntity course) async {
    try {
      var response = await dio.post(
        ApiEndpoints.createCourse,
        data: courseApiModel.fromEntity(course).toJson(),
      );

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllCourse);
      if (response.statusCode == 200) {
        // OR
        // 2nd way
        GetAllCourseDTO courseAddDTO = GetAllCourseDTO.fromJson(response.data);
        return Right(courseApiModel.toEntityList(courseAddDTO.data));
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }
}



//  // 1st way
//         var batches = (response.data['data'] as List)
//             .map((course) => CourseApiModel.fromJson(course).toEntity())
//             .toList();
//         return Right(batches);