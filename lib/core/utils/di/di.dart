import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meem/core/api/dio_consumer.dart';
import 'package:meem/features/Auth/data/data_sources/remote_data_source.dart';
import 'package:meem/features/Auth/data/repos/auth_repo.dart';

var git = GetIt.instance;

void setUp() {
  git.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: Dio(),
      // token: Hive.box(Constants.tokenBox).get(Constants.tokenKey),
    ),
  );

  git.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      authRemoteDataSource: AuthRemoteDataSourceImpl(
        apiConsumer: git.get<DioConsumer>(),
      ),
    ),
  );
}
