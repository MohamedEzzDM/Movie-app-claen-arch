import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean/core/utils/constant.dart';
import 'package:movies_app_clean/domain/entity/movie_details.dart';
import 'package:movies_app_clean/presentation/logic/details/details_screen_cubit.dart';
import 'package:movies_app_clean/presentation/widgets/my_app_bar.dart';



import '../../domain/entity/character.dart';


class DetailsScreen extends StatelessWidget {
  DetailsScreen(Map args, {Key? key}) : super(key: key) {
    movieId = args['id'];
  }

  late final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              BlocConsumer<DetailsScreenCubit, DetailsScreenState>(
                builder: (BuildContext context, state) {
                  MovieDetails movieDetails =
                      BlocProvider.of<DetailsScreenCubit>(context).movieDetails;
                  print(movieDetails.name);
                  if (state is! AllLoadedState) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const Center(child: CircularProgressIndicator(
                        color: ColorConstants.mandy,
                      )),
                    );
                  } else {
                    return Column(
                      children: [
                        Stack(
                          fit: StackFit.loose,
                          children: [
                            Container(
                              foregroundDecoration: BoxDecoration(
                                  gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                                colors: [
                                  ColorConstants.primary,
                                  ColorConstants.primary.withOpacity(0.5),
                                ],
                              )),
                              child: Image.network(
                                "${ApiConstants.baseImageUrl}${movieDetails.backdropPath}",
                              ),
                            ),
                            Positioned(
                                left: 12,
                                bottom: 5,
                                child: Text(
                                  movieDetails.name,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Text(
                                movieDetails.releaseDate,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 200,
                                child: Image.network(
                                    "${ApiConstants.baseImageUrl}${movieDetails.posterPath}"),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 200,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "${movieDetails.overview}",
                                        maxLines: 9,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                                fontSize: 14,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 25,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${movieDetails.voteAverage.round()}/10",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                Text(
                                  "Rating",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.attach_money,
                                  color: Colors.green,
                                  size: 26,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${movieDetails.revenue}",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                Text(
                                  "Revenue",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.question_mark_sharp,
                                  color: ColorConstants.mandy,
                                  size: 25,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${movieDetails.status}",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                Text(
                                  "Status",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    );
                  }
                },
                listener: (BuildContext context, Object? state) {},
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Casts",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: ColorConstants.mandy),
                    ),
                  ],
                ),
              ),
              BlocConsumer<DetailsScreenCubit, DetailsScreenState>(
                builder: (BuildContext context, state) {
                  List<Character> movieCharacters =
                      BlocProvider.of<DetailsScreenCubit>(context).movieCharacters;
                  if(state is! AllLoadedState){
                    return const CircularProgressIndicator(color: ColorConstants.mandy,);
                  }else{
                    return SizedBox(
                      height: 250,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: movieCharacters.length,
                        itemBuilder: (BuildContext context, int index) {
                          Character movie = movieCharacters[index];
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                "${ApiConstants.baseImageUrl}${movieCharacters[index].profilePicturePath}",
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
                listener: (BuildContext context, Object? state) {},
              ),

            ],
          ),
        ),
      ),
    );
  }
}
