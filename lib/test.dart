

import 'package:dio/dio.dart';
import 'package:movies_app_clean/data/modules/result.dart';

import 'domain/entity/result.dart';

void mainnn() async {

  Dio client = Dio();

  client.get("https://api.themoviedb.org/3/movie/now_playing?api_key=247a18e38e58225afffc980e1d8998e1&language=en-US&page=1")
      .then((value) {
    Result comingData = ResultModel.fromJson(value.data);

    print(comingData.moviesResult[11].name);
  }
   );



}