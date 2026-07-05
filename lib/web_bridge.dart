// lib/web_bridge.dart
import 'engine.dart'; // Your ComEngine

class WebBridge {
  // This function allows your website to trigger the Mash shell
  static Future<String> handleWebRequest(String command) async {
    // Validates and compiles before executing
    return await ComEngine.process(command);
  }
}
