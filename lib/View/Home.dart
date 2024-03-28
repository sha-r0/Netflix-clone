import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Network/api.dart';
import 'package:netflix/View/details_screen.dart';

import '../Models/Movie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topratedmovie;
  late Future<List<Movie>> upcomingmovie;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topratedmovie = Api().getTopratedMovies();
    upcomingmovie = Api().getupcomingMovies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Netflix',style: TextStyle(color: Colors.red),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ///////////////////////////////////////////////
            SizedBox(height: 30,),
            SizedBox(
              child: FutureBuilder<List<Movie>>(
                  future: trendingMovies,
                  builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot){
                    if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }else if(snapshot.hasData){
                      return SizedBox(
                          width: double.infinity,
                          child: CarouselSlider.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context , itemIndex, pageViewIndex){
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=>DetailsScreen(
                                            movie: snapshot.data![itemIndex])));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: SizedBox(
                                      height: 300,
                                      width: 200,
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500${snapshot.data![itemIndex].posterpath}',
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                height: 300,
                                autoPlay: true,
                                pageSnapping: true,
                                enlargeCenterPage: true,
                                viewportFraction: 0.55,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                autoPlayAnimationDuration: Duration(seconds: 1),
                              )
                          )
                      );
                    }else{
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                  }),
            ),
            ///////////////////////////////////////////////

            ///////////////////////////////////////////////
            SizedBox(height: 35,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Top rated movies',style:
              TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            SizedBox(height: 20,),
            SizedBox(
              child: FutureBuilder<List<Movie>>(
                  future: topratedmovie,
                  builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot){
                    if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }else if(snapshot.hasData){
                      return SizedBox(
                          width: double.infinity,
                          child: SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context ,index){
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context)=>DetailsScreen(
                                                movie: snapshot.data![index])));
                                      },
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: SizedBox(
                                            height: 300,
                                            width: 150,
                                            child: Image.network(
                                              'https://image.tmdb.org/t/p/w500${snapshot.data![index].posterpath}',
                                              filterQuality: FilterQuality.high,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                      ),
                                    ),
                                  );
                                }),
                          ),
                      );
                    }else{
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                  }),
            ),
            ///////////////////////////////////////////////

            //////////////////////////////////////////////
            SizedBox(height: 35,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Upcoming movies',style:
              TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            SizedBox(height: 20,),
            SizedBox(
              child: FutureBuilder<List<Movie>>(
                  future: upcomingmovie,
                  builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot){
                    if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }else if(snapshot.hasData){
                      return SizedBox(
                        width: double.infinity,
                        child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context ,index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context)=>DetailsScreen(
                                              movie: snapshot.data![index])));
                                    },
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: SizedBox(
                                          height: 300,
                                          width: 150,
                                          child: Image.network(
                                            'https://image.tmdb.org/t/p/w500${snapshot.data![index].posterpath}',
                                            filterQuality: FilterQuality.high,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                    ),
                                  ),
                                );
                              }),
                        ),
                      );
                    }else{
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                  }),
            ),
            ///////////////////////////////////////////////

            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}



