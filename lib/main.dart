import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'futures/pincode_lookup/provider/pincode_provider.dart';
import 'futures/pincode_lookup/screen/pincode_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PinCodeProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PIN Code Lookup',
      debugShowCheckedModeBanner: false, // Debug banner removed
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 2),
      ),
      home: const PinCodeScreen(),
    );
  }
}
