import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/Downloads/models/downlods.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';

abstract class IDownloadsRepo{
  Future<Either<MainFailure,List<Downloads>>> getDownloadsImage();
}