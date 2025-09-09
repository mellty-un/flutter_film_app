import 'package:aplikasi_daftar_film/detail.page.dart';
import 'package:aplikasi_daftar_film/favorite_page.dart';
import 'package:flutter/material.dart';
import '../models/movie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movies = [
    Movie(
      title: "Agak Laen",
      year: "2024", 
      genre: "Komedi", 
      synopsis: "Empat sahabat mengelola rumah hantu, tapi setelah seorang pengunjung meninggal,rumah itu benar-benar menjadi berhantu dan memicu kekacauan.",
      posterAsset: "assets/images/al.jpg"),
     Movie(
    title: "Sekawan Limo",
    year: "2024",
    genre: "Komedi",
    synopsis: "Lima pendaki terjebak di gunung, salah satu kemungkinan hantu.",
    posterAsset: "assets/images/sekawan.jpeg",
  ),
  Movie(
    title: "Komang",
    year: "2022",
    genre: "Romantis",
    synopsis: "Seorang pencuri memasuki mimpi orang untuk mencuri rahasia.",
    posterAsset: "assets/images/f.jpg",
  ),
  Movie(
    title: "Rahasia Rasa",
    year: "2025",
    genre: "Romantis",
    synopsis: "Chef berusaha menemukan kembali rasa dalam hidup dan masakannya.",
    posterAsset: "assets/images/n.jpeg",
  ),
  Movie(
    title: "Transformers",
    year: "2008",
    genre: "Action",
    synopsis: "Autobots dan Decepticons berperang di Bumi, kunci ada pada remaja.",
    posterAsset: "assets/images/r.jpeg",
  ),
];

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
                  childAspectRatio: MediaQuery.of(context).size.width > 600 ? 0.65 : 0.6,
                ),
                itemBuilder: (context, index) {
                  final movie = displayedMovies[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(movie: movie))),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      shadowColor: Colors.deepPurple.withOpacity(0.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                            child: Image.asset(movie.posterAsset, height: 200, fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(movie.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), maxLines: 2, overflow: TextOverflow.ellipsis),
                                SizedBox(height: 4),
                                Text(movie.year, style: TextStyle(color: Colors.grey[600], fontSize: 16)),
                              ],
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
