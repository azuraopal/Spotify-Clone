import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/ui/album_radio_screen.dart';
import 'package:spotify_clone/ui/listening_on_screen.dart';
import 'package:spotify_clone/ui/share_song_screen.dart';
import 'package:spotify_clone/ui/song_control_screen.dart';
import 'package:spotify_clone/widgets/stream_buttons.dart';

class TrackViewScreen extends StatelessWidget {
  const TrackViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff9E2216),
            Color.fromARGB(255, 187, 41, 27),
            MyColors.blackColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              const _Header(),
              const SongCover(),
              const SongInfo(),
              const SongActionButtons(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 23, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            barrierColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return DraggableScrollableSheet(
                                minChildSize: 0.9,
                                maxChildSize: 0.9,
                                initialChildSize: 0.9,
                                builder: (context, controller) {
                                  return ListeningOn(
                                    controller: controller,
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Image.asset('images/icon_bluetooth.png'),
                            const Text(
                              "Airpod 3",
                              style: TextStyle(
                                fontFamily: "AM",
                                fontSize: 10,
                                color: MyColors.greenColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ShareSongScreen(),
                                  ),
                                );
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AlbumRadioScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const LyricsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class SongActionButtons extends StatefulWidget {
  const SongActionButtons({super.key});

  @override
  State<SongActionButtons> createState() => _SongActionButtonsState();
}

class _SongActionButtonsState extends State<SongActionButtons> {
  bool isPaused = false;
  bool isInRepeat = true;
  bool isShuffleOn = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isShuffleOn = !isShuffleOn;
                });
              },
              child: (isShuffleOn)
                  ? Image.asset(
                      'images/icon_shuffle_on.png',
                      height: 22,
                      width: 22,
                    )
                  : Image.asset("images/icon_shuffle_off.png"),
            ),
            Image.asset("images/icon_back_song.png"),
            GestureDetector(
              onTap: () {
                setState(() {
                  isPaused = !isPaused;
                });
              },
              child: (isPaused)
                  ? const PauseButton(
                      height: 67,
                      iconHeight: 26,
                      width: 67,
                      color: MyColors.whiteColor,
                    )
                  : const PlayButton(
                      color: MyColors.whiteColor,
                      height: 67,
                      width: 67,
                    ),
            ),
            Image.asset("images/icon_next_song.png"),
            GestureDetector(
              onTap: () {
                setState(() {
                  isInRepeat = !isInRepeat;
                });
              },
              child: (isInRepeat)
                  ? Image.asset("images/icon_repeat_on.png")
                  : Image.asset(
                      'images/icon_restart_off.png',
                      height: 29,
                      width: 29,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class LyricsSection extends StatelessWidget {
  const LyricsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xffD8672A),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 33,
            left: 15,
            child: Text(
              "Lyrics",
              style: TextStyle(
                fontFamily: "AM",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: MyColors.whiteColor,
              ),
            ),
          ),
          Positioned(
            top: 33,
            right: 15,
            child: Container(
              height: 28,
              decoration: BoxDecoration(
                color: MyColors.darGreyColor.withOpacity(0.6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Text(
                        "MORE",
                        style: TextStyle(
                          fontFamily: "AM",
                          fontSize: 10,
                          color: MyColors.whiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset("images/icon_bigger_size.png"),
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

class SongInfo extends StatefulWidget {
  const SongInfo({super.key});

  @override
  State<SongInfo> createState() => _SongInfoState();
}

class _SongInfoState extends State<SongInfo> {
  double _currentNumber = 0;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 95,
                      height: 30,
                      child: Marquee(
                        text: 'From Me to You - Mono / Remastered',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "AM",
                            color: MyColors.whiteColor,
                            fontSize: 22),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        blankSpace: 25.0,
                        velocity: 60.0,
                        pauseAfterRound: const Duration(seconds: 5),
                        startPadding: 5.0,
                        accelerationDuration: const Duration(seconds: 1),
                        accelerationCurve: Curves.linear,
                        decelerationDuration: const Duration(milliseconds: 500),
                        decelerationCurve: Curves.easeOut,
                      ),
                    ),
                  ),
                  const Text(
                    "The Beatles",
                    style: TextStyle(
                      fontFamily: "AM",
                      fontSize: 16,
                      color: MyColors.lightGrey,
                    ),
                  ),
                ],
              ),
              Image.asset("images/icon_heart.png"),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SliderTheme(
            data: const SliderThemeData(
              trackHeight: 4,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Slider(
                min: 0,
                max: 100,
                activeColor: MyColors.whiteColor,
                inactiveColor: MyColors.lightGrey,
                value: _currentNumber,
                onChanged: (onChanged) {
                  setState(() {
                    _currentNumber = onChanged;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "0:38",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 10,
                    color: MyColors.lightGrey,
                  ),
                ),
                Text(
                  "-1:18",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 10,
                    color: MyColors.lightGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SongCover extends StatelessWidget {
  const SongCover({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 35),
        child: Image.asset(
          "images/song_screen_big.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("images/icon_arrow_down.png"),
            const Text(
              "1(Remastered)",
              style: TextStyle(
                fontFamily: "AM",
                fontWeight: FontWeight.w400,
                color: MyColors.whiteColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SongControlScreen(),
                  ),
                );
              },
              child: Image.asset('images/icon_more.png'),
            ),
          ],
        ),
      ),
    );
  }
}
