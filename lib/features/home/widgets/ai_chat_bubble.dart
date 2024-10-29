// import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:songgpt/features/home/widgets/music_player.dart';
import 'package:songgpt/features/home/widgets/response_container.dart';

// class AIChatBubble extends StatelessWidget {
//   final String imageUrl;
//   final String songTitle;
//   final String artist;
//   final String genre;
//   final double sliderDuration;
//   final String duration;
//   final String lyrics;
//   final String response;
//   final bool isGenerating;
//   final String timeSent;
//   const AIChatBubble({
//     super.key,
//     required this.imageUrl,
//     required this.songTitle,
//     required this.artist,
//     required this.genre,
//     required this.sliderDuration,
//     required this.duration,
//     required this.lyrics,
//     required this.response,
//     required this.timeSent,
//     this.isGenerating = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: ConstrainedBox(
//         constraints: BoxConstraints(
//           maxWidth: MediaQuery.of(context).size.width - 60,
//         ),
//         child: Card(
//           elevation: 1,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           color: Colors.black,
//           margin: const EdgeInsets.symmetric(
//             horizontal: 15,
//             vertical: 5,
//           ),
//           child: Stack(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                 ).copyWith(
//                   top: 5,
//                   bottom: 20,
//                 ),
//                 child: isGenerating
//                     ? AnimatedTextKit(
//                         animatedTexts: [
//                           WavyAnimatedText(
//                             'AI is generating...',
//                             textStyle: const TextStyle(
//                               fontSize: 16,
//                               color: Colors.white,
//                             ),
//                           )
//                         ],
//                       )
//                     : Column(
//                         children: [
//                           ConstrainedBox(
//                             constraints: BoxConstraints(
//                               maxWidth: MediaQuery.of(context).size.width - 80,
//                             ),
//                             child: MusicPlayer(
//                               imageUrl: imageUrl,
//                               songTitle: songTitle,
//                               artist: artist,
//                               genre: genre,
//                               sliderDuration: sliderDuration,
//                               duration: duration,
//                             ),
//                           ),
//                           ResponseContainer(
//                             title: 'Lyrics',
//                             content: lyrics,
//                             icon: Icons.mic,
//                           ),
//                           ResponseContainer(
//                             title: 'AI Response',
//                             content: response,
//                             icon: Icons.messenger_outline,
//                           ),
//                         ],
//                       ),
//               ),
//               Positioned(
//                 bottom: 2,
//                 right: 10,
//                 child: Text(
//                   timeSent,
//                   style: const TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class AIChatBubble extends StatelessWidget {
  final String imageUrl;
  final String songTitle;
  final String artist;
  final String genre;
  final double sliderDuration;
  final String duration;
  final String lyrics;
  final String response;
  final String timeSent;
  const AIChatBubble({
    super.key,
    required this.imageUrl,
    required this.songTitle,
    required this.artist,
    required this.genre,
    required this.sliderDuration,
    required this.duration,
    required this.lyrics,
    required this.response,
    required this.timeSent,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 60,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: isDarkMode ? Colors.white : Colors.black,
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ).copyWith(
                  top: 5,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 80,
                      ),
                      child: MusicPlayer(
                        imageUrl: imageUrl,
                        songTitle: songTitle,
                        artist: artist,
                        genre: genre,
                        sliderDuration: sliderDuration,
                        duration: duration,
                      ),
                    ),
                    ResponseContainer(
                      title: 'Lyrics',
                      content: lyrics,
                      icon: Icons.mic,
                    ),
                    ResponseContainer(
                      title: 'AI Response',
                      content: response,
                      icon: Icons.messenger_outline,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 2,
                right: 10,
                child: Text(
                  timeSent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
