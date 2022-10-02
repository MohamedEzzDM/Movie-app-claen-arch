import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean/core/utils/constant.dart';
import 'package:movies_app_clean/presentation/logic/home/home_screen_cubit.dart';

import '../../domain/entity/movie.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_slider_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(

        child: Column(
          children: [
            BlocConsumer<HomeScreenCubit,HomeScreenState>(
              builder: (BuildContext context, state) {
                if(state is! LoadedState) {
                  return  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: const Center(child: CircularProgressIndicator(
                      color: ColorConstants.mandy,
                    )),
                  );
                }
                else{
                  return const MySlider();
                }
              },
              listener: (BuildContext context, Object? state) {  },),
            Divider(
              color: Colors.grey.withOpacity(0.8),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Rated Movies",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: ColorConstants.mandy
                    ),
                  ),
                ],
              ),
            ),
            BlocConsumer<HomeScreenCubit,HomeScreenState>(
              builder: (BuildContext context, state) {
                if(state is! LoadedState) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height/2,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                else{

                  return SizedBox(
                    height: 250,
                    child: ListView.separated(

                      scrollDirection: Axis.horizontal,
                      itemCount: BlocProvider.of<HomeScreenCubit>(context).topRatedMovies.length,
                      itemBuilder: (BuildContext context, int index) {
                        Movie movie = BlocProvider.of<HomeScreenCubit>(context).topRatedMovies[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, RoutesConstants.detailsScreen,arguments: {'id':movie.id});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                "${ApiConstants.baseImageUrl}${movie.posterPath}",
                                height: 200,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 130,
                                child: Text(
                                  maxLines: 2,
                                  movie.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  );
                }
              },
              listener: (BuildContext context, Object? state) {  },),
            Divider(
              color: Colors.grey.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Movies",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: ColorConstants.mandy
                    ),
                  ),
                ],
              ),
            ),
            BlocConsumer<HomeScreenCubit,HomeScreenState>(
              builder: (BuildContext context, state) {
                if(state is! LoadedState) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height/3,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                else{

                  return SizedBox(
                    height: 250,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: BlocProvider.of<HomeScreenCubit>(context).popularMovies.length,
                      itemBuilder: (BuildContext context, int index) {
                        Movie movie = BlocProvider.of<HomeScreenCubit>(context).popularMovies[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, RoutesConstants.detailsScreen,arguments: {'id':movie.id});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                "${ApiConstants.baseImageUrl}${movie.posterPath}",
                                height: 200,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 130,
                                child: Text(
                                  maxLines: 2,
                                  movie.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  );
                }
              },
              listener: (BuildContext context, Object? state) {  },)
          ],
        ),
      ),
    );
  }
}

class MySlider extends StatelessWidget {
  const MySlider({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return CarouselSlider(
      items: List.from(BlocProvider.of<HomeScreenCubit>(context).nowPlayingMovies.map((movie) => MySliderItem(
        bottomSpace: 20,
        fit: StackFit.expand,
            movie: movie,
          ))),
      options: CarouselOptions(viewportFraction: 1,
      autoPlay: true),
    );
  }
}



