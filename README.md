# HandAnchorDebugging for visionOS 🥽 ✋

A utility tool for **visionOS** developers to debug and calibrate the offset (position and rotation) of 3D objects attached to hand anchors in real-time.

> **📖 Read the Article:** [Check out the full Medium article](https://www.google.com/search?q=INSERT_YOUR_MEDIUM_ARTICLE_LINK_HERE) explaining the implementation details and the specific `Info.plist` crash this project solves.

Getting the perfect alignment for held objects—like swords, tools, or sports equipment—is difficult when guessing coordinates in code. This project provides a **runtime dashboard** to adjust these values on the fly while wearing the headset.

## 🚀 Features

* **Real-Time Calibration:** Adjust X, Y, Z position and rotation (Euler angles) using a floating SwiftUI window.
* **Instant Feedback:** The 3D object (e.g., a Golf Club) updates instantly in the Immersive Space as you move the sliders.
* **Console Output:** One-click button to print the final coordinate values to the Xcode console for easy copying into your production app.
* **ARKit Hand Tracking:** Uses `HandTrackingProvider` and `AnchorEntity(.hand)` to attach objects to the user's palm.

## 🛠 Prerequisites

* **Xcode 15.2+** (with visionOS SDK installed)
* **Apple Vision Pro** (Required for Hand Tracking) or visionOS Simulator.

## ⚠️ The Info.plist Trap (Important)

If you fork this project or recreate it, be aware of a common **crash on launch**:

> `Thread 1: Fatal error: Your app was given a scene with scene session role UIWindowSceneSessionRoleVolumetricApplication but no scenes declared in your app body match this role.`

**The Fix:**
This app uses a standard 2D window (`.windowStyle(.plain)`) for the controls, but Xcode defaults new projects to expect a `Volumetric` window.
We solved this in `Info.plist` by changing the **Preferred Default Scene Session Role**:

* **From:** `UIWindowSceneSessionRoleVolumetricApplication`
* **To:** `UIWindowSceneSessionRoleApplication`

*See `Info.plist` in the source code for the correct configuration.*

## 📂 Project Structure

* **`CalibrationView.swift`**: The 2D control panel containing sliders for `GolfConfig`.
* **`GolfImmersiveView.swift`**: The immersive space that handles the ARKit session and updates the 3D entity transform.
* **`GolfConfig.swift`**: An `@Observable` data model that stores the offset values and converts them to `SIMD3` and `simd_quatf`.
* **`HandAnchorDebuggingApp.swift`**: The entry point setting up the `WindowGroup` and `ImmersiveSpace`.

## 🏃‍♂️ How to Run

1. Clone the repo:
```bash
git clone https://github.com/Lucalangella/HandAnchorDebugging.git

```


2. Open `HandAnchorDebugging.xcodeproj` in Xcode.
3. Connect your Apple Vision Pro or launch the Simulator.
4. Run the app.
5. Click **"Start Rig"** to enter the Immersive Space.
6. Look at your **Right Hand** to see the attached object.
7. Use the window to adjust the alignment until it fits perfectly in your hand.
8. Click **"Print Final Values"** to see the coordinates in the debug console.

## 📄 License

This project is licensed under the **MIT License**. See the [LICENSE](https://www.google.com/search?q=LICENSE) file for details.

---

*Created by [Lucalangella*](https://www.google.com/search?q=https://github.com/Lucalangella)
