import 'exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MatrimonyApp());
}

class MatrimonyApp extends StatelessWidget {
  const MatrimonyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => _buildTransitionPage(const LoginScreen(), context),
        ),
        GoRoute(
          path: '/verify',
          pageBuilder: (context, state) => _buildTransitionPage(const OTPVerifyScreen(), context),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Matrimony App',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
        colorScheme:lightColorScheme
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        colorScheme: darkColorScheme
      ),
    );
  }

//   CustomTransitionPage _buildTransitionPage(Widget child, BuildContext context) {
//     return CustomTransitionPage(
//       child: child,
//       key: ValueKey(child.runtimeType),
//       transitionDuration: const Duration(milliseconds: 400),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(
//           opacity: animation,
//           child: SlideTransition(
//             position: Tween<Offset>(
//               begin: const Offset(1, 0),
//               end: Offset.zero,
//             ).animate(animation),
//             child: child,
//           ),
//         );
//       },
//     );
//   }
 }
CustomTransitionPage _buildTransitionPage(
  Widget child,
  BuildContext context, {
  Offset beginOffset = const Offset(1, 0), // Slide from right
}) {
  return CustomTransitionPage(
    child: child,
    key: ValueKey(child.runtimeType),
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final offsetAnimation = Tween<Offset>(
        begin: beginOffset,
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      ));

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFD946EF),       // LGBTQ+ vibrant pink
  onPrimary: Colors.white,
  secondary: Color(0xFF6366F1),     // Trustworthy indigo
  onSecondary: Colors.white,
  tertiary: Color(0xFF10B981),      // Calming teal
  onTertiary: Colors.white,
  background: Color(0xFFFDF2F8),    // Soft inclusive background
  onBackground: Color(0xFF111827),  // High-contrast text
  surface: Color(0xFFFFF1F2),       // Light subtle card background
  onSurface: Color(0xFF1F2937),
  error: Color(0xFFEF4444),
  onError: Colors.white,
);

const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFF0ABFC),        // Light pink for visibility
  onPrimary: Colors.black,
  secondary: Color(0xFFA5B4FC),      // Light indigo
  onSecondary: Colors.black,
  tertiary: Color(0xFF6EE7B7),       // Soft teal
  onTertiary: Colors.black,
  background: Color(0xFF1F1F1F),     // Deep background
  onBackground: Color(0xFFF9FAFB),   // Light readable text
  surface: Color(0xFF2A2A2A),
  onSurface: Color(0xFFF3F4F6),
  error: Color(0xFFF87171),
  onError: Colors.black,
);
