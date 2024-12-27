import 'package:dummy_poc/features/reviews/widgets/video_carousal.dart';
import 'package:flutter/material.dart';
import '../widgets/average_rating_display.dart';
import '../widgets/star_selector.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> videoUrls = [
      'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
      'https://samplelib.com/lib/preview/mp4/sample-10s.mp4',
      'https://samplelib.com/lib/preview/mp4/sample-10s.mp4',
      'https://samplelib.com/lib/preview/mp4/sample-10s.mp4',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Star Review System')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the average rating
              const AverageRatingDisplay(),
              const SizedBox(height: 32),

              // Video Carousel
              Text(
                'Watch Product Videos:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              VideoCarousel(videoUrls: videoUrls),
              const SizedBox(height: 32),

              // Star selector for overall rating
              Text(
                'Rate the Product Overall:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              const StarSelector(),

              const SizedBox(height: 20),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Thank you for your review!')),
                    );
                  },
                  child: const Text('Submit Review'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
