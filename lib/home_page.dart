import 'package:aplikasi_daftar_film/data/movie_data.dart';
import 'package:aplikasi_daftar_film/detail.page.dart';
import 'package:aplikasi_daftar_film/favorite_page.dart';
import 'package:flutter/material.dart';
import '../models/movie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  
  List<Movie> movies = MovieData.movies;


  List<Movie> displayedMovies = [];
  Set<Movie> favoriteMovies = {};
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedMovies = movies;
  }

  void filterMovies(String query) {
    final filtered = movies.where((movie) => movie.title.toLowerCase().contains(query.toLowerCase())).toList();
    setState(() => displayedMovies = filtered);
  }

  void toggleFavorite(Movie movie) {
    setState(() {
      if (favoriteMovies.contains(movie)) {
        favoriteMovies.remove(movie);
      } else {
        favoriteMovies.add(movie);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 60, 16, 24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                  colors: [Color(0xFF2B365B), Color.fromARGB(255, 14, 68, 138), 
                  ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 4))],
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Daftar Film",
                        style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: searchController,
                      onChanged: filterMovies,
                      decoration: InputDecoration(
                        hintText: "Cari film...",
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 14),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FavoritePage())),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                    child: Icon(Icons.favorite, color: Colors.redAccent, size: 28),
                  ),
                ),
              ),
            ],
          ),
         Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: displayedMovies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                final movie = displayedMovies[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DetailPage(movie: movie)),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    clipBehavior: Clip.antiAlias, // biar borderRadius kepotong rapi
                    elevation: 4,
                    shadowColor: Colors.deepPurple.withOpacity(0.5),
                    child: Stack(
                      children: [
                        // Gambar full memenuhi card
                        Positioned.fill(
                          child: Image.asset(
                            movie.posterAsset,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Overlay gradasi bawah
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  movie.year,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        ],
      ),
    );
  }
}
