import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:video_player/video_player.dart';

class VideoCarousel extends StatefulWidget {
  final List<String> videoUrls;

  const VideoCarousel({Key? key, required this.videoUrls}) : super(key: key);

  @override
  _VideoCarouselState createState() => _VideoCarouselState();
}

class _VideoCarouselState extends State<VideoCarousel> {
  late List<VideoPlayerController> _videoControllers;
  late int _currentPlayingIndex;

  @override
  void initState() {
    super.initState();
    _currentPlayingIndex = 0;
    _initializeControllers();
  }

  void _initializeControllers() {
    _videoControllers = widget.videoUrls
        .map((url) => VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {}); // Update UI after initialization
      }))
        .toList();

    // Auto-play the first video
    if (_videoControllers.isNotEmpty) {
      _videoControllers[0].play();
    }
  }

  void _onPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      // Pause the current playing video
      _videoControllers[_currentPlayingIndex].pause();

      // Update current playing index
      _currentPlayingIndex = index;

      // Play the new video
      _videoControllers[_currentPlayingIndex].play();
    });
  }

  @override
  void dispose() {
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.videoUrls.length,
      itemBuilder: (context, index, realIndex) {
        final controller = _videoControllers[index];

        return GestureDetector(
          onTap: () {
            setState(() {
              if (controller.value.isPlaying) {
                controller.pause();
              } else {
                controller.play();
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // Black border color
                width: 2.0, // Border width
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Video Player
                AspectRatio(
                  aspectRatio: controller.value.isInitialized
                      ? controller.value.aspectRatio
                      : 16 / 9, // Default aspect ratio
                  child: controller.value.isInitialized
                      ? VideoPlayer(controller)
                      : const Center(child: CircularProgressIndicator()),
                ),
                // Play/Pause Button Overlay
                if (!controller.value.isPlaying)
                  Icon(
                    Icons.play_circle_outline,
                    size: 64,
                    color: Colors.white,
                  ),
              ],
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 300, // Adjust the height for the video container
        autoPlay: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        viewportFraction: 1,
        onPageChanged: _onPageChanged,
      ),
    );

  }
}
