import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';

class AlbumControlScreen extends StatelessWidget {
  const AlbumControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0,
                    color: MyColors.blackColor,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff9E2216),
                      MyColors.blackColor,
                    ],
                  ),
                ),
                child: const _UpperContainerContent(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0,
                    color: MyColors.blackColor,
                  ),
                  color: MyColors.blackColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      AlbumChip(text: "Like", image: "icon_heart.png"),
                      AlbumChip(
                          text: "View artist", image: "icon_view_artist.png"),
                      AlbumChip(text: "Share", image: "icon_share.png"),
                      AlbumChip(
                          text: "Like all songs", image: "icon_heart.png"),
                      AlbumChip(
                          text: "Add to playlist",
                          image: "icon_add_to_playlist.png"),
                      AlbumChip(
                          text: "Add to queue", image: "icon_add_to_quoue.png"),
                      AlbumChip(text: "Go to radio", image: "icon_radio.png"),
                      SizedBox(height: 35),
                      Center(
                        child: Text(
                          "Close",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 16,
                            color: MyColors.whiteColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AlbumChip extends StatelessWidget {
  const AlbumChip({super.key, required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("images/$image"),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontFamily: "AM",
              fontSize: 16,
              color: MyColors.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}

class _UpperContainerContent extends StatelessWidget {
  const _UpperContainerContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 55,
        ),
        Image.asset(
          "images/song_screen.png",
          height: 164,
          width: 164,
        ),
        const SizedBox(
          height: 66,
        ),
        const Center(
          child: Text(
            "1(Remastered)",
            style: TextStyle(
              fontFamily: "AM",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: MyColors.whiteColor,
            ),
          ),
        ),
        const Center(
          child: Text(
            "The Beatles",
            style: TextStyle(
              fontFamily: "AM",
              fontSize: 14,
              color: MyColors.lightGrey,
            ),
          ),
        ),
      ],
    );
  }
}