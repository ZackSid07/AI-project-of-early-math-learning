import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';
import '../theme/app_theme.dart';
import 'hint_screen.dart';
import 'revealed_answer_screen.dart';
import 'camera_screen.dart';
import 'math_journey_screen.dart';
import '../main.dart' as main;
import 'package:math_buddy/l10n/app_localizations.dart';

class DigitalCapsScreen extends StatefulWidget {
  final LevelData? targetLevel;
  final bool isPracticeMode;

  const DigitalCapsScreen({
    Key? key,
    this.targetLevel,
    this.isPracticeMode = false,
  }) : super(key: key);

  @override
  State<DigitalCapsScreen> createState() => _DigitalCapsScreenState();
}

class _DigitalCapsScreenState extends State<DigitalCapsScreen> {
  late FlutterTts _flutterTts;
  int consecutiveMistakes = 0;
  bool _isSuccess = false;
  
  // The equation slots state
  late List<String?> _slots;
  late int _requiredSlots;

  // Available caps
  final List<String> _numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  final List<String> _operators = ['+', '-', '='];

  @override
  void initState() {
    super.initState();
    _initTts();
    _setupSlots();
  }

  void _setupSlots() {
    if (widget.targetLevel != null) {
      // Strip all whitespace to get the raw character count.
      // e.g., "24 + 7 = 31" -> "24+7=31" -> 7 slots
      final stripped = widget.targetLevel!.expectedEquation.replaceAll(' ', '');
      _requiredSlots = stripped.length;
    } else {
      _requiredSlots = 5; // Default for practice mode
    }
    _slots = List.filled(_requiredSlots, null);
  }

  Future<void> _initTts() async {
    _flutterTts = FlutterTts();
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setPitch(1.0);
  }

  void _submitEquation() {
    if (_slots.contains(null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.fillAllSlotsFirst)),
      );
      return;
    }

    String equation = _slots.join("");
    _validateEquation(equation);
  }

  void _validateEquation(String equation) {
    // Basic parsing logic similar to camera_screen.dart
    if (!equation.contains('=')) {
      _handleIncorrectFormat("No equals sign found.");
      return;
    }

    List<String> parts = equation.split('=');
    String leftSide = parts[0];
    String rightSide = parts.length > 1 ? parts[1] : "";

    String? op;
    if (leftSide.contains('+')) op = '+';
    else if (leftSide.contains('-')) op = '-';

    if (op == null || rightSide.isEmpty) {
      _handleIncorrectFormat("Incomplete equation.");
      return;
    }

    try {
      List<String> operands = leftSide.split(op);
      if (operands.length < 2) throw Exception();
      
      int num1 = int.parse(operands[0]);
      int num2 = int.parse(operands[1]);
      int detectedAnswer = int.parse(rightSide);

      int calculatedResult = (op == '+') ? num1 + num2 : num1 - num2;

      if (widget.isPracticeMode) {
        if (calculatedResult == detectedAnswer) {
          _handleSuccess("$num1 $op $num2 = $calculatedResult");
        } else {
          _handleIncorrectAnswer(num1, op, num2, detectedAnswer, calculatedResult);
        }
      } else if (widget.targetLevel != null) {
        String expectedEq = widget.targetLevel!.expectedEquation;
        String fullDetectedStr = "$num1 $op $num2 = $detectedAnswer";

        if (fullDetectedStr == expectedEq) {
          _handleSuccess(fullDetectedStr);
        } else {
          _handleIncorrectAnswer(num1, op, num2, detectedAnswer, calculatedResult, expectedEquation: expectedEq);
        }
      }
    } catch (e) {
      _handleIncorrectFormat("Could not read numbers.");
    }
  }

  void _handleSuccess(String equationStr) {
    setState(() {
      _isSuccess = true;
      consecutiveMistakes = 0;
    });
    _flutterTts.speak("Correct! Well done!");
    
    if (!widget.isPracticeMode && widget.targetLevel != null) {
      Provider.of<CourseProvider>(context, listen: false)
          .completeCurrentLevel(widget.targetLevel!.levelNumber);
    }
  }

  void _handleIncorrectFormat(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: Colors.orange,
    ));
  }

  void _handleIncorrectAnswer(int num1, String op, int num2, int detectedAnswer, int calculatedResult, {String? expectedEquation}) {
    String currentWrongEq = "$num1 $op $num2 = $detectedAnswer";
    String actualCorrectEq = expectedEquation ?? "$num1 $op $num2 = $calculatedResult";

    consecutiveMistakes++;

    if (consecutiveMistakes == 1) {
      _flutterTts.speak("Not quite! Try one more time.");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Not quite! Try one more time.", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
      ));
    } else if (consecutiveMistakes == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HintScreen(
            childsEquation: currentWrongEq,
            correctEquation: actualCorrectEq,
          ),
        ),
      );
    } else {
      consecutiveMistakes = 0;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RevealedAnswerScreen(
            childsEquation: currentWrongEq,
            correctEquation: actualCorrectEq,
          ),
        ),
      );
    }
  }

  /// Build the dynamic instruction showing the target equation
  String _getDynamicEquation() {
    if (widget.targetLevel != null) {
      final eq = widget.targetLevel!.expectedEquation;
      final parts = eq.split('=');
      if (parts.length == 2) {
        return "${parts[0].trim()} = ?";
      }
    }
    return "Free Play!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F2FE), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new, color: AppTheme.primaryBlue),
                            onPressed: () => Navigator.pop(context),
                          ),
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.digitalCapsMode,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: AppTheme.primaryBlue,
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const SizedBox(width: 48), // Spacer for balance
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Dynamic Instruction: "Solve: 1 + 4 = ?"
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 6),
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: widget.isPracticeMode
                            ? Text(
                                AppLocalizations.of(context)!.practiceModeFreePlay,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E293B),
                                ),
                              )
                            : RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: AppLocalizations.of(context)!.solve,
                                      style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xFF1E293B),
                                      ),
                                    ),
                                    TextSpan(
                                      text: _getDynamicEquation(),
                                      style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w900,
                                        color: AppTheme.primaryBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),

                    if (!_isSuccess) ...[
                      const Spacer(),

                      // Equation Slots — using Wrap to prevent overflow
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))
                          ],
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: List.generate(_requiredSlots, (index) {
                            return _buildDragTarget(index);
                          }),
                        ),
                      ),

                      const Spacer(),

                      // Bank of Caps (Draggable items)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -5))
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
                              const SizedBox(height: 16),
                              // Numbers — Wrap so they flow on small screens
                              Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: _numbers.map((n) =>
                                  _buildDraggableCap(n, CapType.number),
                                ).toList(),
                              ),
                              const SizedBox(height: 16),
                              // Operators
                              Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 10.0,
                                runSpacing: 8.0,
                                children: _operators.map((op) =>
                                  _buildDraggableCap(op, op == '=' ? CapType.equals : CapType.operator),
                                ).toList(),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ),

                      // Submit Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ToyButton(
                            text: AppLocalizations.of(context)!.submit,
                            onPressed: _submitEquation,
                            color: AppTheme.successGreen,
                          ),
                        ),
                      ),
                    ] else ...[
                      // SUCCESS UI
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.greatJob,
                              style: const TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w900,
                                color: AppTheme.successGreen,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              AppLocalizations.of(context)!.solvedDigitally,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                            const SizedBox(height: 48),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 20,
                              runSpacing: 20,
                              children: [
                                ToyButton(
                                  text: AppLocalizations.of(context)!.next,
                                  icon: const Icon(Icons.map_rounded, color: Colors.white),
                                  color: AppTheme.primaryBlue,
                                  onPressed: () {
                                    // Go back to the journey/map
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => const MathJourneyScreen()),
                                      (route) => route.isFirst,
                                    );
                                  },
                                ),
                                ToyButton(
                                  text: AppLocalizations.of(context)!.camera,
                                  icon: const Icon(Icons.camera_alt_rounded, color: Colors.white),
                                  color: Colors.orange,
                                  onPressed: () {
                                    // Go to camera with same level
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CameraScreen(
                                          cameras: main.cameras,
                                          targetLevel: widget.targetLevel,
                                          isPracticeMode: widget.isPracticeMode,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDraggableCap(String text, CapType type) {
    return Draggable<String>(
      data: text,
      feedback: Opacity(
        opacity: 0.8,
        child: _DigitalCap(text: text, type: type, size: 56),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: _DigitalCap(text: text, type: type, size: 52),
      ),
      child: _DigitalCap(text: text, type: type, size: 52),
    );
  }

  Widget _buildDragTarget(int index) {
    return DragTarget<String>(
      onAccept: (data) {
        setState(() {
          _slots[index] = data;
        });
      },
      builder: (context, candidateData, rejectedData) {
        final val = _slots[index];
        if (val != null) {
          CapType type;
          if (val == '=') type = CapType.equals;
          else if (val == '+' || val == '-') type = CapType.operator;
          else type = CapType.number;

          return GestureDetector(
            onTap: () => setState(() => _slots[index] = null),
            child: _DigitalCap(text: val, type: type, size: 48),
          );
        }

        return Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[300]!, width: 2, style: BorderStyle.solid),
          ),
          child: const Center(child: Icon(Icons.add, color: Colors.grey, size: 20)),
        );
      },
    );
  }
}

class _DigitalCap extends StatelessWidget {
  final String text;
  final CapType type;
  final double size;

  const _DigitalCap({required this.text, required this.type, required this.size});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor = Colors.white;

    switch (type) {
      case CapType.number:
        backgroundColor = Colors.red;
        break;
      case CapType.operator:
        backgroundColor = AppTheme.primaryBlue;
        break;
      case CapType.equals:
        backgroundColor = Colors.white;
        textColor = Colors.black87;
        break;
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
        gradient: RadialGradient(
          colors: [
            Colors.white.withOpacity(0.5),
            backgroundColor,
            Colors.black.withOpacity(0.3),
          ],
          center: Alignment.topLeft,
          radius: 1.2,
        ),
      ),
      alignment: Alignment.center,
      child: text == '-'
          ? Center(
              child: Container(
                width: size * 0.45, // Wider minus
                height: size * 0.1,  // Proportionate height
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(size * 0.05),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, size * 0.02),
                      blurRadius: 1,
                    )
                  ],
                ),
              ),
            )
          : Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: size * 0.5,
                fontWeight: FontWeight.w900,
                // Add a subtle shadow to the text for "authenticity"
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    offset: Offset(0, size * 0.04),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
    );
  }
}
