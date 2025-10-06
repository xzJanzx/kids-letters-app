import 'package:flutter/material.dart';

void main() {
  runApp(const KidsApp());
}

class KidsApp extends StatelessWidget {
  const KidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids Letters',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ChildInfoPage(),
    );
  }
}

class ChildInfoPage extends StatefulWidget {
  const ChildInfoPage({super.key});
  @override
  State<ChildInfoPage> createState() => _ChildInfoPageState();
}

class _ChildInfoPageState extends State<ChildInfoPage> {
  final _nameController = TextEditingController();
  String? _gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل بيانات الطفل')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'اسم الطفل', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _gender,
            decoration: const InputDecoration(labelText: 'النوع', border: OutlineInputBorder()),
            items: const [
              DropdownMenuItem(value: 'ولد', child: Text('ولد')),
              DropdownMenuItem(value: 'بنت', child: Text('بنت')),
            ],
            onChanged: (v) => setState(() => _gender = v),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              if (_nameController.text.isEmpty || _gender == null) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ادخل الاسم والنوع')));
                return;
              }
              Navigator.push(context, MaterialPageRoute(builder: (_) => const LanguagePage()));
            },
            child: const Text('التالي'),
          )
        ]),
      ),
    );
  }
}

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اختر اللغة')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ModePage(language: 'ar'))), child: const Text('العربية')),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ModePage(language: 'en'))), child: const Text('English')),
        ]),
      ),
    );
  }
}

class ModePage extends StatelessWidget {
  final String language;
  const ModePage({super.key, required this.language});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اختر نوع التدريب')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: () {}, child: const Text('التدريب على الحروف')),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: () {}, child: const Text('التدريب على الكلمات')),
        ]),
      ),
    );
  }
}
