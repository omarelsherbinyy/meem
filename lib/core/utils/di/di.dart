import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meem/core/api/dio_consumer.dart';
import 'package:meem/core/utils/constant.dart';
import 'package:meem/features/Auth/data/data_sources/remote_data_source.dart';
import 'package:meem/features/Auth/data/repos/auth_repo.dart';
import 'package:meem/features/cart/data/data_sources/cart_data_source.dart';
import 'package:meem/features/cart/data/repos/cart_repo.dart';
import 'package:meem/features/home/data/data_sources/home_data_source.dart';
import 'package:meem/features/home/data/repos/home_repo.dart';

var git = GetIt.instance;

void setUp() {
  git.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: Dio(),
      token: Hive.box(Constants.tokenBox).get(Constants.tokenKey),
    ),
  );

  git.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      authRemoteDataSource: AuthRemoteDataSourceImpl(
        apiConsumer: git.get<DioConsumer>(),
      ),
    ),
  );
  git.registerSingleton<CartRepoImpl>(
    CartRepoImpl(
      cartRemoteDataSource: MyCartRemoteDataSourceImpl(
        apiConsumer: git.get<DioConsumer>(),
      ),
    ),
  );
  git.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeDataSource: HomeDataSourceImpl(
        apiConsumer: git.get<DioConsumer>(),
      ),
    ),
  );
}
