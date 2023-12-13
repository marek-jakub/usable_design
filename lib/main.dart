import 'package:flutter/material.dart';

import '../router/route_generator.dart';

void main() {
  runApp(const UsabilityDesign());
}

class UsabilityDesign extends StatefulWidget {
  const UsabilityDesign({super.key});

  @override
  State<UsabilityDesign> createState() => _UsabilityDesignState();
}

class _UsabilityDesignState extends State<UsabilityDesign> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Usability design questions',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
