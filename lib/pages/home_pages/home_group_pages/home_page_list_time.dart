import 'package:flutter/material.dart';
import 'package:por_maria_app/models/media_model.dart';

class HomePageListItem extends StatelessWidget {
  final Media media;

  const HomePageListItem(this.media, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              FadeInImage.assetNetwork(
                placeholder: "assets/placeholder.jpg",
                image: media.getBackdropUrl(),
                fit: BoxFit.fill,
                width: double.infinity,
                height: 200.0,
                fadeInDuration: const Duration(milliseconds: 40),
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900]?.withOpacity(0.5),
                  ),
                  constraints: const BoxConstraints.expand(height: 55.0),
                ),
              ),
              Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          media.title,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                media.getGenres(),
                                style: const TextStyle(color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                media.releaseDate,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.right,
                              ),
                              const Icon(
                                Icons.event,
                                color: Colors.white,
                              )
                            ],
                          ))
                    ],
                  ))
            ],
          ),
        )
      ]),
    );
  }
}
