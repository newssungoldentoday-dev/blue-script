import 'package:flutter/material.dart';

void main() {
  runApp(const BlueScriptApp());
}

class BlueScriptApp extends StatelessWidget {
  const BlueScriptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BlueScript',
      theme: ThemeData.dark(),
      home: const TerminalInterface(),
    );
  }
}

class TerminalInterface extends StatefulWidget {
  const TerminalInterface({super.key});

  @override
  State<TerminalInterface> createState() => _TerminalInterfaceState();
}

class _TerminalInterfaceState extends State<TerminalInterface> {
  final List<String> _history = ["Com-Runtime v1.0 [Mash Shell] loaded.", "Type 'help-ra' for commands."];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _executeCommand(String input) {
    setState(() {
      _history.add("mash > $input");

      final parts = input.trim().split(' ');
      final command = parts[0];

      // --- COM ARCHITECTURE LOGIC ---
      if (command == 'help-ra') {
        _history.add("--- [Mash] Available Packages ---");
        _history.add("Install: NumBra, Labera, MushCrap, Mushroom Soup, Dug, Echo");
        _history.add("Syntax: zetpleta\"file.msh\"_; | mashroom install <pkg>");
        _history.add("----------------------------------");
      } 
      
      else if (command == 'zetpleta' && input.contains('"')) {
        _history.add("[Zetpleta.cm]: Loading module...");
        _history.add("[Zetpleta.cm]: Execution started.");
      } 
      
      else if (input.startsWith('"*')) {
        String message = input.substring(2);
        _history.add(message);
        _history.add("[Zetpleta.cm]: end.");
      } 
      
      else if (command == 'mashroom') {
        if (parts.length >= 3) {
          String action = parts[1]; // install/remove
          String pkg = parts.sublist(2).join(' ');
          
          if (action == 'install') {
            _history.add("[Mashroom]: Sprouting package '$pkg'...");
            _history.add("[Zetpleta.cm]: Dependencies resolved.");
            _history.add("[Mashroom]: '$pkg' is ready. end.");
          } else if (action == 'remove') {
            _history.add("[Mashroom]: Purging '$pkg' from root...");
            _history.add("[Zetpleta.cm]: Sector cleared.");
            _history.add("[Mashroom]: '$pkg' has been removed. end.");
          }
        }
      } 
      
      else if (command == 'repo' && parts.length > 2 && parts[1] == 'clone') {
        _history.add("[Zetpleta.cm]: Cloning ${parts[2]} with recursive submodule support...");
      } 
      
      else {
        _history.add("Mash Error: '$command' not recognized. Type 'help-ra'.");
      }
    });

    _controller.clear();
    // Auto-scroll to bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _history.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: Text(_history[index], style: const TextStyle(fontFamily: 'Courier', fontSize: 14)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              onSubmitted: _executeCommand,
              decoration: const InputDecoration(
                hintText: "Enter mash command...",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
