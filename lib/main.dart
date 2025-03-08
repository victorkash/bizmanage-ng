// Add Firebase configuration import
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Generated by flutterfire configure

// Updated main() with error handling
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, // Platform-specific config
    );
    runApp(MyApp());
  } catch (e) {
    print("Firebase initialization failed: $e");
    runApp(const ErrorApp());
  }
}

// Simple error screen (new addition)
class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Firebase Initialization Failed')),
    );
  }
}

// Your original MyApp and screen classes below
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardScreen(),
    FinancialManagementScreen(),
    InventoryScreen(),
    CustomerScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Finances'),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory),
              label: 'Inventory',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Customers',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue, // Added for better UX
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}

// Your existing screen classes
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Dashboard'));
  }
}

class FinancialManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Finances'));
  }
}

class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Inventory'));
  }
}

class CustomerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Customers'));
  }
}