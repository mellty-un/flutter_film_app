import 'package:aplikasi_daftar_film/models/movie.dart';


class MovieData {
  static List<Movie> movies = [
    Movie(
      title: "Agak Laen",
      year: "2024",
      genre: "Komedi",
      synopsis: "Empat sahabat mengelola rumah hantu, tapi setelah seorang pengunjung meninggal, rumah itu benar-benar menjadi berhantu dan memicu kekacauan.",
      posterAsset: "assets/images/al.jpg",
    ),
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
}
