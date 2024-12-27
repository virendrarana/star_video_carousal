import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/review_provider.dart';

class AverageRatingDisplay extends StatelessWidget {
  const AverageRatingDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewProvider>(
      builder: (context, provider, child) {
        return Center(
          child: Column(
            children: [
              const Text(
                'Average Rating',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Icon(
                    index < provider.averageRating.ceil()
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.orange,
                    size: 30,
                  );
                }),
              ),
              Text(
                provider.totalReviews == 0
                    ? 'No ratings yet'
                    : '${provider.averageRating.toStringAsFixed(1)} / 5.0 (${provider.totalReviews} reviews)',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        );
      },
    );
  }
}
