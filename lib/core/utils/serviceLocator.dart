import 'package:bookly_app/core/utils/apiService.dart';
import 'package:bookly_app/features/bookDetailsScreen/data/repos/detailsRepoImpl.dart';
import 'package:bookly_app/features/homeScreen/data/repos/homeRepoImpl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void getItInit(){
  getIt.registerSingleton<Apiservice>(Apiservice(Dio()));
  getIt.registerSingleton<Homerepoimpl>(Homerepoimpl(getIt.get<Apiservice>())); 
  getIt.registerSingleton<DetailsRepoImpl>(DetailsRepoImpl(getIt.get<Apiservice>())); 

}