# Sui

Modern Superuser Interface (SUI) implementation on Android, redesigned with **Material Design 3 (Material You / M3)**.

---

## Overview

Sui provides modern Java APIs based on the [Shizuku API](https://github.com/k10halifa/Shizuku-API) architecture for root-enabled applications. It allows root apps to execute Android framework APIs directly in Java under root privileges and register their own AIDL-style Java services.

Unlike traditional root management solutions, Sui operates directly at the framework level:
- **No Binaries in `PATH`:** Does not inject standalone su binaries into system paths, significantly minimizing root detection vectors.
- **No Standalone Manager App:** All controls and permissions are deeply integrated directly into the system settings and system UI.
- **Material Design 3 (M3) UI:** Built with Google's modern Material You / M3 design language for confirmation dialogs and management interfaces.

---

## Key Highlights & What's New (v18.9.15)

* **Global Auto-Grant Toggle:** A quick-toggle action directly in the management toolbar to automatically grant root permissions to requesting applications via secure, privileged IPC without prompting each time.
* **Material Design 3 (M3) Permission Dialogs:** Complete redesign of the interactive authorization window featuring stacked dynamic actions, high-contrast denial buttons, centered adaptive badges, and immediate touch responsiveness.
* **Persistent SQLite Database:** Permissions and global preferences are securely maintained in `/data/system/sui` owned directly by `system_server`, eliminating permission resets across device reboots.
* **Instant Cold-Start & App Caching:** Integrated `AppInfoCache` alongside synchronous list rendering and `DiffUtil` for instant loading without UI freezing or blank screens.
* **Android 16 Compatibility & Diagnostics:** Enhanced internal binder probes, server identity validation, and diagnostic logging for newer Android versions.

---

## User Guide

### Requirements
- A rooted Android device running Magisk, KernelSU, or APatch (Zygisk environment supported).
- Android 8.0 (API 26) through Android 16+.

### Installation
1. Download the latest compiled release ZIP (`Sui-v18.9.15.zip`).
2. Flash the module through your root manager (Magisk / KernelSU / APatch).
3. Reboot your device.

### Accessing Management UI
- **Settings Shortcut (Android 8.0+):** Long-press the "Settings" icon from your launcher to access the Sui shortcut.
- **Developer Options:** Open Developer Options in System Settings to trigger the management shortcut prompt.
- **Dialer Code:** Dial `*#*#784784#*#*` in your default phone dialer.

### Interactive Shell (`rish`)
Sui includes an interactive root shell client. Because Sui does not place binaries in system `PATH`, configure your execution scripts using the internal environment:
- Review configuration templates inside `/data/system/sui`.
- Execute commands via `rish` as you would with standard `sh`.

---

## Application Development Guide

To integrate Sui/Shizuku API into your application:
- Repository: [Shizuku-API](https://github.com/k10halifa/Shizuku-API)

---

## Building from Source

### Prerequisites
- JDK 17
- Android SDK & NDK
- Gradle 8.0 wrapper
- SDKMAN (recommended)

Clone the repository recursively:
```bash
git clone --recurse-submodules <YOUR_REPOSITORY_URL>
cd Sui
