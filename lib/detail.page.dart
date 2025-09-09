import 'package:aplikasi_daftar_film/models/favorite_manger.dart';
import 'package:flutter/material.dart';
import 'models/movie.dart';

class DetailPage extends StatefulWidget {
  final Movie movie;

  const DetailPage({super.key, required this.movie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final isFav = FavoriteManager.isFavorite(widget.movie);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset(
              widget.movie.posterAsset,
              fit: BoxFit.cover,
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.movie.title,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(Icons.star, color: Color.fromARGB(255, 222, 8, 58), size: 20),
                              SizedBox(width: 4),
                              Text(
                                "6.2",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 22, 55, 125),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        children: widget.movie.genre
                            .split(',')
                            .map(
                              (g) => Chip(
                                label: Text(
                                  g.trim(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Color.fromARGB(255, 22, 55, 125),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.movie.synopsis,
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.4,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                  _circleButton(
                    icon: isFav ? Icons.favorite : Icons.favorite_border,
                    onTap: () {
                      setState(() {
                        FavoriteManager.toggleFavorite(widget.movie);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black54,
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}