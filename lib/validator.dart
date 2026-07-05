// lib/validator.dart

class ComValidator {
  /// Ensures the file and syntax meet Com standards
  static bool validateSyntax(String input) {
    // Rule 1: Files must end in .local or .msh
    if (!(input.contains('.local') || input.contains('.msh'))) {
      return false;
    }
    
    // Rule 2: Zetpleta commands must end in the signature '_;'
    if (input.startsWith('zetpleta') && !input.endsWith('_;')) {
      return false;
    }

    return true;
  }

  /// Checks if a # tag is recognized by the ecosystem
  static bool isValidTag(String tag) {
    const List<String> authorizedTags = [
      '#Status', '#Business', '#Hardware', '#Signal', '#Logic'
    ];
    return authorizedTags.contains(tag);
  }
}
