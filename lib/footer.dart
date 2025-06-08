import 'package:andrewedgar_io/utils.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    const String githubUrl = 'https://github.com/aedgar777';
    const String linkedInUrl = 'https://www.linkedin.com/in/andrewdedgar/';
    const String instagramUrl = 'https://www.instagram.com/https://www.instagram.com/andrew.d.edgar//';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
      color: Theme
          .of(context)
          .colorScheme
          .secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(width: 10),
              IconButton(
                  icon: Image.asset('assets/icons/InBug-White.png',
                      height: 24, width: 24),
                  onPressed: () => launchURL(linkedInUrl),
                  tooltip: 'LinkedIn'),
              IconButton(
                  icon: Image.asset('assets/icons/instagram.png',
                      height: 32, width: 32),
                  onPressed: () => launchURL(instagramUrl),
                  tooltip: 'Instagram'),
              IconButton(
                  icon: Image.asset('assets/icons/github-mark-white.png',
                      height: 24, width: 24),
                  onPressed: () => launchURL(githubUrl),
                  tooltip: 'GitHub'),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '© ${DateTime
                .now()
                .year} Andrew Edgar',
            style: textTheme.bodySmall
                ?.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          Text(
            'andrew@andrewedgar.io',
            style: textTheme.bodySmall
                ?.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}