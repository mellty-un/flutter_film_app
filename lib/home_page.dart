import 'package:aplikasi_daftar_film/detail.page.dart';
import 'package:flutter/material.dart';
import '../models/movie.dart';

class HomePage extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: "Agak Laen",
      year: "2024",
      genre: "Komedi",
      synopsis: "Film komedi tentang sekelompok sahabat dengan cerita kocak.",
      posterAsset: "assets/images/al.jpg",
    ),
    Movie(
      title: "Sekawan Limo",
      year: "2024",
      genre: "Komedi",
      synopsis: "Kisah persahabatan penuh kelucuan dan kejutan.",
      posterAsset: "assets/images/sekawan.jpeg",
    ),
    Movie(
      title: "Komang",
      year: "2022",
      genre: "Sci-Fi",
      synopsis: "Seorang pencuri memasuki mimpi orang untuk mencuri rahasia.",
      posterAsset: "assets/images/f.jpg",
    ),
    Movie(
      title: "Rahasia Rasa",
      year: "2025",
      genre: "Action",
      synopsis: "Batman melawan Joker yang mengancam Gotham City.",
      posterAsset: "assets/images/n.jpeg",
    ),
    Movie(
      title: "Transformers",
      year: "2008",
      genre: "Action",
      synopsis: "Batman melawan Joker yang mengancam Gotham City.",
      posterAsset: "assets/images/r.jpeg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Film"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: movies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // tampil 2 kolom
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(movie: movie),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 6,
                shadowColor: Colors.deepPurple.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        movie.posterAsset,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            movie.year,
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 12),
                          ),
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
    );
  }
}
