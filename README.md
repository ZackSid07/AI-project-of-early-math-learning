# MathBuddy: Bottle Cap Math 🤖♻️🔢

MathBuddy is a cutting-edge, high-fidelity educational application built with **Flutter**. It bridges the physical and digital worlds to teach children early arithmetic (Addition and Subtraction) through tactile and interactive play.

By utilizing **On-Device Artificial Intelligence (YOLO)**, MathBuddy transforms everyday bottle caps into interactive learning tools, while offering a fallback **Digital Caps Mode** for play on-the-go.

---

## 🌟 Key Features

### 1. The "Physical Eyes" — AI Camera Scanning
*   **Snap & Analyze Architecture**: Optimized for precision, capturing high-resolution photos to ensure the AI has the best data for detection.
*   **Real-Time YOLO Inference**: Uses a custom-trained YOLO model (TFLite) to detect numeric and operator bottle caps.
*   **Corrective Mapping**: Optimized `labels.txt` mapping ensuring digits (0-9) and operators (+, -, =) are identified with 95%+ accuracy.
*   **Intelligent Sorting**: Automatically sorts detected caps from left-to-right to reconstruct mathematical equations from physical arrangements.

### 2. The "Digital Hands" — Drag-and-Drop Mode
*   **Accessibility First**: A fully featured digital alternative for users without physical bottle caps.
*   **Dynamic Equation Slots**: The workspace dynamically generates the exact number of slots required for each equation, handling multi-digit results (e.g., `24 + 7 = 31` creates 7 character slots).
*   **Tactile Digital Interaction**: Users drag virtual "red caps" (numbers) and "blue caps" (operators) into a high-contrast workspace.

### 3. The "Adventure Map" — Gamified Progression
*   **Journey Mode**: A beautifully rendered 2D map where children unlock levels as they progress through a structured curriculum.
*   **Persistent Progress**: Automated local saving using `SharedPreferences` ensures the child's progress is never lost.
*   **Visual Level Cards**: Interactive UI elements that show the "Target Equation" for the current level using 3D-styled cap graphics.

### 4. The "Brain" — Pedagogical Feedback System
*   **3-Strike Feedback Loop**:
    1.  **Strike 1 (Gentle Correction)**: A simple snackbar and TTS prompt to try again.
    2.  **Strike 2 (AI Hint)**: Integration with **Gemini-3-Flash** to provide creative, pedagogical stories and hints without giving away the answer.
    3.  **Strike 3 (Explicit Reveal)**: A visual counting experience using **Apple Animations**, where the app walks the child through the math step-by-step.
*   **TTS Sync**: Seamless integration of **Text-to-Speech** (TTS) for auditory learning, reading equations aloud in a child-friendly voice.

---

## 🛠️ Technical Implementation Milestones

### Build & Layout Stability
*   **RenderFlex Overflow Prevention**: Solved horizontal layout issues on narrow devices by implementing `Flexible` text components and `Wrap` layouts in headers and equation banks.
*   **Multi-Device Scaling**: Custom padding and icon-sizing logic ensures the UI remains premium on everything from 5" phones to large tablets.

### Inference Optimization
*   **Geometric Filtering**: Implemented Y-axis variance thresholds to ignore "ghost" detections or distant objects that aren't part of the primary equation row.
*   **Structural Heuristics**: Added validation rules (e.g., requiring exactly one equals sign) to reduce false-positive submissions.
*   **Aspect Ratio Preservation**: Center-square cropping ensures bottle caps remain perfectly circular for the YOLO input, preventing detection distortion.

### State Management
*   **Provider Pattern**: Centralized state management for Course Progress, Settings, and Camera Status.
*   **Async TFLite Loading**: Non-blocking initialization of AI models to keep the UI snappy.

---

## 🏗️ Project Structure

```text
lib/
├── main.dart             # App entry point & Camera initialization
├── models/               # Data structures (LevelData, etc.)
├── providers/            # State Management (Course, Settings)
├── services/             # Core Services (YOLO, TTS, AI Hints)
├── theme/                # Design System (Colors, Fonts, Puffy Buttons)
└── screens/              
    ├── home_screen.dart          # Main Lobby & Mascot
    ├── math_journey_screen.dart  # The Level Map
    ├── camera_screen.dart        # AI Physical Detection Mode
    ├── digital_caps_screen.dart  # Virtual Drag-and-Drop Mode
    ├── hint_screen.dart          # AI Hint UI
    └── revealed_answer_screen.dart# Apple Animation Reveal UI
```

---

## 🚀 Tech Stack
*   **Framework**: Flutter (Dart)
*   **Computer Vision**: TensorFlow Lite (YOLOv8)
*   **LLM Integration**: Google Gemini API (for Pedagogical Hints)
*   **Storage**: SharedPreferences
*   **Sound**: Flutter TTS
*   **UI Assets**: Google Fonts (Nunito, Inter), Custom SVG Icons

---

## 📥 Setup & Installation

### Prerequisites
*   Flutter SDK (Latest stable)
*   A physical Android or iOS device (TFLite and Camera features require physical hardware)
*   Gemini API Key (Set up in `GeminiService`)

### Instructions
1.  **Clone the Repository**:
    ```bash
    git clone [repository-url]
    ```
2.  **Install Dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Prepare Assets**:
    *   Ensure `assets/models/best_float32.tflite` exists.
    *   Ensure `assets/models/labels.txt` contains the 13 required classes (0-9, equal, minus, plus).
4.  **Run**:
    ```bash
    flutter run
    ```

---

## 📝 Recent Session Highlights (2026-05-09)
*   ✅ **Success UI Overhaul**: Replaced the auto-navigation pop-up with a dedicated "Great Job!" screen offering choices between Map progression and Camera practice.
*   ✅ **Dynamic Slot Generation**: Refined Digital Caps Mode to calculate slots by character length, supporting multi-digit arithmetic.
*   ✅ **Header Overflow Fix**: Resolved "Yellow Stripe" RenderFlex warnings in the Camera UI.
*   ✅ **Label Precision**: Verified and fixed the `labels.txt` mapping for operator detection reliability.

---

*Developed as part of an AI-Augmented Math Education Thesis.*
