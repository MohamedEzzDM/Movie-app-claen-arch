import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean/core/utils/constant.dart';
import 'package:movies_app_clean/presentation/logic/home/home_screen_cubit.dart';

import '../../domain/entity/movie.dart';

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
                  return MySlider();
                }
              },
              listener: (BuildContext context, Object? state) {  },),
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
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              "${ApiConstants.baseImageUrl}${movie.posterPath}",
                              height: 200,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              child: Text(
                                maxLines: 2,
                                "${movie.name}",
                                style: TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              width: 130,
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  );
                }
              },
              listener: (BuildContext context, Object? state) {  },),

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
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              "${ApiConstants.baseImageUrl}${movie.posterPath}",
                              height: 200,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              child: Text(
                                maxLines: 2,
                                "${movie.name}",
                                style: TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              width: 130,
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
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
            movie: movie,
          ))),
      options: CarouselOptions(viewportFraction: 1,
      autoPlay: true),
    );
  }
}

class MySliderItem extends StatelessWidget {
  const MySliderItem({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          foregroundDecoration:
              BoxDecoration(gradient: mySliderLinearGradient()),
          child: Image.network(
            "${ApiConstants.baseImageUrl}${movie.backdropPath}",
          ),
        ),
        Positioned(
            left: 20,
            bottom: 30,
            child: Text(
              "${movie.name}",
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }

  LinearGradient mySliderLinearGradient() {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.center,
      colors: [
        ColorConstants.primary,
        ColorConstants.primary.withOpacity(0.5),
      ],
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.motion_photos_pause_outlined),
      title: const Text(
        "FreeFlex",
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
