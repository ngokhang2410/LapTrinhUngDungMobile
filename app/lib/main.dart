import 'package:flutter/material.dart';

import 'login.dart';
import 'register_screen.dart';
import 'settings_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ứng dụng liên kết 3 màn hình',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFE0E0E0),
      ),
      home: const MobileWrapperScreen(),
    );
  }
}

/// Khung giả lập điện thoại + Navigator nội bộ nối 3 màn hình.
class MobileWrapperScreen extends StatelessWidget {
  const MobileWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 375,
          height: 700,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 16,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Navigator(
              initialRoute: '/login',
              onGenerateRoute: (RouteSettings settings) {
                final Widget page;
                switch (settings.name) {
                  case '/register':
                    page = const RegisterScreen();
                    break;
                  case '/settings':
                    page = const SettingsScreen();
                    break;
                  case '/login':
                  default:
                    page = const LoginScreen();
                    break;
                }
                return MaterialPageRoute(
                  settings: settings,
                  builder: (_) => page,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
