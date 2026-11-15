import 'package:flutter/material.dart';

void main() {
  runApp(const MedaceApp());
}

class MedaceApp extends StatelessWidget {
  const MedaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF101A35);
    const blue = Color(0xFF536DFF);
    return MaterialApp(
      title: 'MEDACE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        scaffoldBackgroundColor: const Color(0xFFF5F7FC),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const subjects = [
    ('Biology', 'Cells, genetics, ecology', Icons.biotech_rounded, Color(0xFF19A982)),
    ('Chemistry', 'Reactions, concepts, numericals', Icons.science_rounded, Color(0xFF8B63E6)),
    ('Physics', 'Mechanics, waves, electricity', Icons.bolt_rounded, Color(0xFFE59A32)),
    ('English', 'Grammar and vocabulary', Icons.menu_book_rounded, Color(0xFF4389D8)),
    ('Logical Reasoning', 'Patterns and problem solving', Icons.psychology_alt_rounded, Color(0xFFE16C88)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FC),
        title: const Text('MEDACE', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.4)),
        actions: [
          IconButton(
            tooltip: 'Study planner',
            onPressed: () => _showComingSoon(context, 'Study planner'),
            icon: const Icon(Icons.calendar_month_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF17264B), Color(0xFF536DFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(26),
                boxShadow: [BoxShadow(color: const Color(0xFF536DFF).withValues(alpha: .22), blurRadius: 22, offset: const Offset(0, 10))],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('YOUR MEDICAL JOURNEY STARTS HERE', style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.2)),
                  SizedBox(height: 12),
                  Text('Learn smarter.\nAim higher.', style: TextStyle(color: Colors.white, fontSize: 29, height: 1.12, fontWeight: FontWeight.w900)),
                  SizedBox(height: 12),
                  Text('Your study space for Class 12 and MDCAT preparation.', style: TextStyle(color: Colors.white70, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Continue your preparation', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: Color(0xFF101A35))),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _QuickAction(icon: Icons.quiz_rounded, title: 'Practice MCQs', subtitle: 'Topic-wise practice', onTap: () => _showComingSoon(context, 'MCQ practice'))),
                const SizedBox(width: 12),
                Expanded(child: _QuickAction(icon: Icons.style_rounded, title: 'Flashcards', subtitle: 'Revise key facts', onTap: () => _showComingSoon(context, 'Flashcards'))),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Study subjects', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: Color(0xFF101A35))),
            const SizedBox(height: 12),
            ...subjects.map((subject) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () => _showComingSoon(context, subject.$1),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(color: subject.$4.withValues(alpha: .12), borderRadius: BorderRadius.circular(15)),
                          child: Icon(subject.$3, color: subject.$4, size: 25),
                        ),
                        const SizedBox(width: 14),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(subject.$1, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: Color(0xFF17213B))),
                            const SizedBox(height: 3),
                            Text(subject.$2, style: const TextStyle(fontSize: 11, color: Color(0xFF7D879D))),
                          ],
                        )),
                        const Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Color(0xFF9AA4B8)),
                      ],
                    ),
                  ),
                ),
              ),
            )),
            const SizedBox(height: 10),
            const Center(child: Text('MEDACE  •  BUILD YOUR FUTURE', style: TextStyle(fontSize: 10, letterSpacing: 1.1, color: Color(0xFF9AA4B8), fontWeight: FontWeight.w700))),
          ],
        ),
      ),
    );
  }

  static void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature module is coming next.'), behavior: SnackBarBehavior.floating),
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.icon, required this.title, required this.subtitle, required this.onTap});
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: const Color(0xFF536DFF), size: 25),
              const SizedBox(height: 13),
              Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Color(0xFF17213B))),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(fontSize: 10, color: Color(0xFF7D879D))),
            ],
          ),
        ),
      ),
    );
  }
}
