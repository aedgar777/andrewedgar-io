import 'package:andrewedgar_io/portfolio/portfolio_section.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'footer.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color violet = Color(0xFF31056e); // Violet
    const Color lightViolet = Color(0xFFE6E6FA); // Lavender
    const Color white = Color(0xFFFFFFFF); // White
    const Color darkGrey = Color(0xFF333333); // Dark Grey for contrast

    return MaterialApp(
      title: 'Andrew Edgar | Portfolio',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: white,
        scaffoldBackgroundColor: white,
        colorScheme: const ColorScheme.light(
          primary: violet,
          secondary: darkGrey,
          surface: lightViolet,
          onPrimary: white,
          onSecondary: white,
          onSurface: darkGrey,
          onError: white,
          background: white,
          onBackground: darkGrey,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 48.0,
              fontFamily: 'Lato',
              color: darkGrey.withOpacity(0.9)),
          headlineSmall: TextStyle(
              fontSize: 24.0,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600,
              color: darkGrey.withOpacity(0.9)),
          titleLarge: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w500,
              color: darkGrey.withOpacity(0.85)),
          bodyMedium: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Lato',
              color: darkGrey.withOpacity(0.75),
              height: 1.5),
          labelLarge:
          const TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w600, color: violet),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: darkGrey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: darkGrey),
        ),
        cardTheme: CardThemeData(
          color: lightViolet,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: violet,
            foregroundColor: white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: darkGrey.withOpacity(0.8),
              textStyle: const TextStyle(fontWeight: FontWeight.w600),
            )),
        iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
              foregroundColor: darkGrey.withOpacity(0.8),
            )),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

 class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  build(BuildContext context) {
    bool isNarrowScreen = MediaQuery
        .of(context)
        .size
        .width < 600;
    

    return Scaffold(
      drawer: isNarrowScreen ? _buildDrawer() : null,
      appBar: AppBar(
        toolbarHeight: 160,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/andrewedgar-io.firebasestorage.app/o/Andrew%20Edgar%20Logo%20AI.png?alt=media&token=f96d11d2-3076-449c-96e5-9a96697fb272',
              height: 80,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const SizedBox(
                  height: 80,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                debugPrint('Error loading image: $error');
                return const SizedBox(
                  height: 80,
                  child: Icon(Icons.error_outline),
                );
              },
            ),
            const SizedBox(height: 18),
            Wrap( // Changed from Row to Wrap
              alignment: WrapAlignment.center,
              spacing: 80.0,
              children: _buildAppBarActions(context),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 160,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AboutSection(key: _aboutKey),
              PortfolioSection(key: _portfolioKey),
              FooterSection(key: _contactKey),
            ],
          ),
        ),
      )
    ,
    );
  }


  List<Widget> _buildAppBarActions(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isMobile = mediaQuery.size.width < 768 || mediaQuery.devicePixelRatio > 2;

    if (isMobile) {
      return [];
    }
    return <Widget>[
      _navButton('About', _aboutKey),
      _navButton('Portfolio', _portfolioKey),
      _navButton('Contact', _contactKey),
      const SizedBox(width: 16),
    ];
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .primaryColor,
            ),
            child: Text(
              'Navigation',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.black),
            ),
          ),
          _drawerItem('About', _aboutKey),
          _drawerItem('Portfolio', _portfolioKey),
          _drawerItem('Contact', _contactKey),
        ],
      ),
    );
  }

  Widget _navButton(String title, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () => _scrollToSection(key),
        child: Text(title.toUpperCase()),
      ),
    );
  }

  Widget _drawerItem(String title, GlobalKey key) {
    return ListTile(
      title: Text(
          title, style: TextStyle(color: Colors.black.withOpacity(0.85))),
      onTap: () {
        Navigator.pop(context);
        _scrollToSection(key);
      },
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 120.0),
      color: Theme
          .of(context)
          .colorScheme
          .surface
          .withOpacity(0.3),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Hi, I\'m Andrew',
                  style: textTheme.displayLarge
                      ?.copyWith(color: Theme
                      .of(context)
                      .colorScheme
                      .primary)),

              const SizedBox(height: 24),
              Text(
                "I'm an experienced software engineer who loves to build public-facing apps and games that make people happy. Have a look at my work so far, and let me know if you think we can do something better together.",
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



