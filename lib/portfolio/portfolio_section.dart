import 'package:andrewedgar_io/portfolio/portfolio_item.dart';
import 'package:flutter/material.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': 'MySynchrony Mobile App',
      'description': 'My team and I built the 4.0 version of the MySynchrony mobile app, which allows Synchrony customers with multiple branded credit cards to manage all of them in one place. This update involved a complete refactor of the app to Jetpack Compose and MVVM architecture, a variety of feature work, and a significant increase in test coverage.',
      'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/andrewedgar-io.firebasestorage.app/o/Untitled.png?alt=media&token=66f632c7-306d-4d2c-94d7-7b6e5df1cfd1',
      'tags': 'Native Android, Kotlin, Jetpack Compose, MVVM, Dagger',
      'link': 'https://play.google.com/store/apps/details?id=com.syf.mysynchrony&hl=en_US'
    },
    {
      'title': 'Spectrum News App',
      'description':
      'I worked with a team of Android engineers at Spectrum to add a variety of features to the Politics section of their news app in time for the 2022 election. By far the most sophisticated and popular app I\'d worked on at that point, this assignment demanded I gain an even deeper understanding of Android architecture and building scalable mobile apps',
      'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/andrewedgar-io.firebasestorage.app/o/unnamed.webp?alt=media&token=10adcad4-aa42-4574-a39e-ed09f1b7a415',
      'tags': 'Native Android, Kotlin, Jetpack Compose, MVVM',
      'link': 'https://play.google.com/store/apps/details?id=com.twcable.twcnews&hl=en_US&gl=US'
    },
    {
      'title': 'WeAre8',
      'description':
      'I was the lead developer for the Android client of WeAre8, a pay-per-response advertising platform that rewards users with money for themselves and nonprofits. This project was my first experience building in Jetpack Compose and MVVM, and I was able to build the 2.0 version of the app almost from the ground up.',
      'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/andrewedgar-io.firebasestorage.app/o/screenshot-www.weare8.com-2021.02.04-17_16_42.png?alt=media&token=9a743da6-be44-4f6c-9f9a-cadce9a8838b',
      'tags': 'Native Android, Kotlin',
      'link': 'https://play.google.com/store/apps/details?id=com.eight.app&hl=en_US'
    },
    {
      'title': 'MyKey TVM',
      'description':
      'My first professional project was the software for a ticket vending machine made for IndyGo, Indianapolis\'s public transportation agency. My employer, Flowbird, built an account-based ticketing solution called MyKey for Indy\'s new express bus line, of which this machine is a key part. Having to work with proprietary hardware and our custom fork of open-source Android taught me a lot about working with low-level APIs, and developing such a complex app forced me improve my coding style and learn more about proper Android architecture. Naturally, I also had to learn a lot about encryption and security to make the machine process payments and pass updated account info to the back-end.',
      'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/andrewedgar-io.firebasestorage.app/o/indygo-1024x727.png?alt=media&token=283b8ccf-50e2-476c-8b92-5953a269ed05',
      'tags': 'Native Android, Kotlin, AOSP, Embedded',
      'link': 'https://www.indygo.net/'
    },
    {
      'title': 'Theo/Maypole',
      'description':
      'The first entry in my mobile development portfolio was Theo, a location-based messaging app that anchors chat rooms to physical locations. Theo was written in Java (with some Node.js cloud functions), and was built on the Google Cloud Platform with Firebase and the Google Places API. I am currently in the process of rebuilding Theo (now Maypole) in Flutter to be cross-platform on Android, iOS, and Web. Stay tuned!',
      'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/andrewedgar-io.firebasestorage.app/o/Wordpress-1024x576.png?alt=media&token=6bb3ad84-9875-4f05-ab10-73c146093720',
      'tags': 'Flutter, Dart, Firebase, Google Places API, Android, iOS, Web',
       'link': 'https://maypole.app/'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Projects',
            style: textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'I\'m an Android Engineer by trade, currently specializing in native Android development with Kotlin and Jetpack Compose. In my free time I\'ve been buildings side projects (like this site) in Flutter and a game in Unreal Engine 5, as well as learning about Machine Learning models with TensorFlow. Here are some of the projects I\'m most proud of.',
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center
          ),
          const SizedBox(height: 36),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 1200 ? 3 :
              constraints.maxWidth > 800 ? 2 : 1;

              // Calculate the width of each item
              final itemWidth = (constraints.maxWidth - (crossAxisCount - 1) * 24) / crossAxisCount;

              // Find the longest description
              String longestDescription = '';
              for (var project in projects) {
                if ((project['description'] ?? '').length > longestDescription.length) {
                  longestDescription = project['description']!;
                }
              }

              final textPainter = TextPainter(
                text: TextSpan(
                  text: longestDescription,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black.withOpacity(0.7)
                  ),
                ),
                textDirection: TextDirection.ltr,
              )..layout(maxWidth: itemWidth - 32);

              // Calculate total height needed (image + spacing + title + description + tags)
              final totalHeight = (itemWidth / (16/9)) + // Image height (aspect ratio)
                  16 + // Space after image
                  30 + // Approximate title height
                  8 + // Space after title
                  textPainter.height + // Description height
                  12 + // Space after description
                  48 + // Approximate height for tags
                  32; // Total padding (top + bottom)

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: itemWidth / totalHeight,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return PortfolioItem(
                    title: projects[index]['title']!,
                    description: projects[index]['description']!,
                    imageUrl: projects[index]['imageUrl']!,
                    tags: projects[index]['tags']!,
                    link: projects[index]['link']!,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}