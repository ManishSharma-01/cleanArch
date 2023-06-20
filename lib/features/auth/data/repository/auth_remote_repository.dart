import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:students_clean_arch/core/failure/failure.dart';
import 'package:students_clean_arch/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:students_clean_arch/features/auth/domain/entity/student_entity.dart';
import 'package:students_clean_arch/features/auth/domain/repository/auth_repository.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> loginStudent(String username, String password) {
    // TODO: implement loginStudent
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> registerStudent(StudentEntity student) {
    // TODO: implement registerStudent
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    return _authRemoteDataSource.uploadProfilePicture(file);
  }
}
