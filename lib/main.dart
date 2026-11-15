import 'package:flutter/material.dart';
import 'mdcat_content.dart';

void main() => runApp(const MedaceApp());

class MedaceApp extends StatelessWidget {
  const MedaceApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'MEDACE',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF536DFF)),
      scaffoldBackgroundColor: const Color(0xFFF5F7FC),
      fontFamily: 'Roboto',
    ),
    home: const HomeScreen(),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const colors = {
    'bio': Color(0xFF19A982),
    'chem': Color(0xFF8B63E6),
    'phys': Color(0xFFE59A32),
    'eng': Color(0xFF4389D8),
    'logic': Color(0xFFE16C88),
  };
  static const icons = {
    'bio': Icons.biotech_rounded,
    'chem': Icons.science_rounded,
    'phys': Icons.bolt_rounded,
    'eng': Icons.menu_book_rounded,
    'logic': Icons.psychology_alt_rounded,
  };

  @override
  Widget build(BuildContext context) {
    final totalUnits = mdcatSubjects.fold<int>(0, (n, s) => n + s.units.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MEDACE', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.4)),
        backgroundColor: const Color(0xFFF5F7FC),
        actions: const [Padding(padding: EdgeInsets.only(right: 18), child: Icon(Icons.school_rounded))],
      ),
      body: SafeArea(child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF17264B), Color(0xFF536DFF)], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(26),
              boxShadow: [BoxShadow(color: const Color(0xFF536DFF).withValues(alpha: .2), blurRadius: 22, offset: const Offset(0, 10))],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('YOUR MEDICAL JOURNEY STARTS HERE', style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.1)),
              const SizedBox(height: 12),
              const Text('Learn smarter.\nAim higher.', style: TextStyle(color: Colors.white, fontSize: 29, height: 1.12, fontWeight: FontWeight.w900)),
              const SizedBox(height: 12),
              const Text('Your offline-first MDCAT preparation space.', style: TextStyle(color: Colors.white70, fontSize: 13)),
              const SizedBox(height: 18),
              Wrap(spacing: 8, runSpacing: 8, children: [
                _StatPill(label: '${mdcatSubjects.length} subjects'),
                _StatPill(label: '${totalUnits} syllabus units'),
                _StatPill(label: '${mdcatQuestions.length} starter MCQs'),
              ]),
            ]),
          ),
          const SizedBox(height: 24),
          const Text('MDCAT subjects', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: Color(0xFF101A35))),
          const SizedBox(height: 5),
          const Text('Tap a subject to explore its complete unit checklist.', style: TextStyle(fontSize: 12, color: Color(0xFF7D879D))),
          const SizedBox(height: 13),
          ...mdcatSubjects.map((subject) {
            final color = colors[subject.id]!;
            final count = mdcatQuestions.where((q) => q.subjectId == subject.id).length;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SubjectScreen(subject: subject, color: color))),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(children: [
                      Container(width: 48, height: 48, decoration: BoxDecoration(color: color.withValues(alpha: .12), borderRadius: BorderRadius.circular(15)), child: Icon(icons[subject.id], color: color, size: 25)),
                      const SizedBox(width: 14),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(subject.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: Color(0xFF17213B))),
                        const SizedBox(height: 3),
                        Text('${subject.units.length} units  •  ${subject.weight} weightage  •  $count starter MCQs', style: const TextStyle(fontSize: 10, color: Color(0xFF7D879D))),
                      ])),
                      const Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Color(0xFF9AA4B8)),
                    ]),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 12),
          const Text('Content standard', style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF17213B))),
          const SizedBox(height: 5),
          const Text('Mapped to the PM&DC MDCAT 2025 curriculum. Question bank is being expanded in reviewed batches; the starter count is not the final 10,000+ target.', style: TextStyle(fontSize: 11, height: 1.5, color: Color(0xFF7D879D))),
        ],
      )),
    );
  }
}

class _StatPill extends StatelessWidget {
  final String label;
  const _StatPill({required this.label});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
    decoration: BoxDecoration(color: Colors.white.withValues(alpha: .14), borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.white24)),
    child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
  );
}

class SubjectScreen extends StatelessWidget {
  final MdcatSubject subject;
  final Color color;
  const SubjectScreen({super.key, required this.subject, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subject.title, style: const TextStyle(fontWeight: FontWeight.w800))),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(color: color.withValues(alpha: .10), borderRadius: BorderRadius.circular(18)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('${subject.weight} MDCAT weightage', style: TextStyle(color: color, fontWeight: FontWeight.w900)),
            const SizedBox(height: 5),
            Text('${subject.mcqCount} questions in the official 180-MCQ paper • ${subject.units.length} syllabus units', style: const TextStyle(fontSize: 12, color: Color(0xFF59647B))),
          ]),
        ),
        const SizedBox(height: 16),
        ...subject.units.asMap().entries.map((entry) {
          final index = entry.key;
          final unit = entry.value;
          final count = mdcatQuestions.where((q) => q.unitId == unit.id).length;
          return Card(
            color: Colors.white,
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 9),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ExpansionTile(
              leading: CircleAvatar(backgroundColor: color.withValues(alpha: .12), foregroundColor: color, child: Text('${index + 1}', style: const TextStyle(fontWeight: FontWeight.w800))),
              title: Text(unit.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
              subtitle: Text('${unit.topics.length} topic points • $count practice MCQs', style: const TextStyle(fontSize: 10, color: Color(0xFF7D879D))),
              childrenPadding: const EdgeInsets.fromLTRB(18, 0, 18, 14),
              children: [
                ...unit.topics.map((topic) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Icon(Icons.check_circle_outline, size: 15, color: color),
                    const SizedBox(width: 8),
                    Expanded(child: Text(topic, style: const TextStyle(fontSize: 12, height: 1.35))),
                  ]),
                )),
                const SizedBox(height: 6),
                Align(alignment: Alignment.centerRight, child: FilledButton.tonal(
                  onPressed: count == 0 ? null : () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizScreen(title: unit.title, questions: mdcatQuestions.where((q) => q.unitId == unit.id).toList()))),
                  child: Text(count == 0 ? 'Questions being added' : 'Practice $count MCQs'),
                )),
              ],
            ),
          );
        }),
      ]),
    );
  }
}

class QuizScreen extends StatefulWidget {
  final String title;
  final List<MdcatQuestion> questions;
  const QuizScreen({super.key, required this.title, required this.questions});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  int? selected;
  bool submitted = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.questions.isEmpty) {
      return Scaffold(appBar: AppBar(title: Text(widget.title)), body: const Center(child: Text('More questions for this topic are being prepared.')));
    }
    final q = widget.questions[index];
    final isLast = index == widget.questions.length - 1;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.w800))),
      body: ListView(padding: const EdgeInsets.all(18), children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('QUESTION ${index + 1} OF ${widget.questions.length}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Color(0xFF77829A))),
          Text(q.difficulty, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xFF536DFF))),
        ]),
        const SizedBox(height: 12),
        LinearProgressIndicator(value: (index + 1) / widget.questions.length, borderRadius: BorderRadius.circular(10)),
        const SizedBox(height: 24),
        Text(q.prompt, style: const TextStyle(fontSize: 19, height: 1.4, fontWeight: FontWeight.w800, color: Color(0xFF17213B))),
        const SizedBox(height: 20),
        ...List.generate(q.options.length, (i) {
          final correct = i == q.answer;
          final chosen = i == selected;
          Color? bg;
          Color? border;
          if (submitted && correct) { bg = const Color(0xFFE5F7EF); border = const Color(0xFF19A982); }
          else if (submitted && chosen && !correct) { bg = const Color(0xFFFFEEEE); border = const Color(0xFFE16C6C); }
          else if (chosen) { bg = const Color(0xFFEEF0FF); border = const Color(0xFF536DFF); }
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(color: bg ?? Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: border ?? const Color(0xFFE6EAF2))),
            child: RadioListTile<int>(
              value: i, groupValue: selected, onChanged: submitted ? null : (v) => setState(() => selected = v),
              title: Text('${String.fromCharCode(65 + i)}. ${q.options[i]}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
              activeColor: const Color(0xFF536DFF),
            ),
          );
        }),
        if (submitted) Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: const Color(0xFFEEF3FF), borderRadius: BorderRadius.circular(14)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(selected == q.answer ? 'Correct!' : 'Correct answer: ${String.fromCharCode(65 + q.answer)}', style: TextStyle(fontWeight: FontWeight.w900, color: selected == q.answer ? const Color(0xFF16845F) : const Color(0xFF344A9A))),
            const SizedBox(height: 7),
            Text(q.explanation, style: const TextStyle(fontSize: 12, height: 1.5, color: Color(0xFF3F4B66))),
          ]),
        ),
        const SizedBox(height: 18),
        if (!submitted) FilledButton(
          onPressed: selected == null ? null : () => setState(() { submitted = true; if (selected == q.answer) score++; }),
          child: const Text('Check answer'),
        ) else FilledButton(
          onPressed: () {
            if (isLast) {
              showDialog(context: context, builder: (_) => AlertDialog(
                title: const Text('Practice completed'),
                content: Text('Your score: $score / ${widget.questions.length}'),
                actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); }, child: const Text('Done'))],
              ));
            } else {
              setState(() { index++; selected = null; submitted = false; });
            }
          },
          child: Text(isLast ? 'See result' : 'Next question'),
        ),
      ]),
    );
  }
}
