# 🎯 BijecBet | Real-Time Arbitrage Intelligence

<p align="center">
  <img src="assets/icon.png" alt="BijecBet logo" width="120" />
</p>

<p align="center">
  <img src="https://bijecbet.app/brand/banner.webp" alt="BijecBet banner" width="100%" />
</p>

**BijecBet** is a high-performance, cross-platform arbitrage intelligence suite. It leverages a native Rust risk engine and a reactive Flutter UI to surface and validate betting opportunities with mathematical certainty.

> **Stop betting. Start arbitraging.**

---

## 🚀 Key Features

### 📡 Multi-Source Data Agnostic
*   **Live Odds API:** Real-time integration with **The Odds API** for global market coverage.
*   **BijecCache Mode:** Zero-config mode utilizing a self-hosted VPS caching layer for optimized throughput and cost-efficiency.
*   **Local File Mode:** Full offline capabilities for engine testing and UI development without API consumption.

### 🛡️ Stealth Mode & Risk Intelligence
*   **Rust Risk Engine:** High-performance scoring using a native Rust library (`bijec_bet_engine`) for near-zero latency.
*   **Account Longevity:** Pulsing health bars and risk scores (1-10) help you mimic recreational behavior and avoid sportsbook limitation algorithms.
*   **Discrete Staking:** Automatically rounds stakes to increments of 5 or 10 to reduce detection risk while recalculating guaranteed profit in real-time.

### 🧮 Precision Math Core
*   **Arbitrary Precision:** Built on `decimal` and `rational` packages to eliminate floating-point rounding errors in high-stakes calculations.
*   **Market Agnostic:** Native support for 2-way (H2H, Spreads) and 3-way (1X2, Soccer) arbitrage detection.
*   **ROI Focusing:** Logic centered on Return on Investment (ROI) rather than simple margin tracking.

### 🎨 Quant-Grade UI/UX
*   **Theme Registry:** Switch between **Quant** (Bloomberg-style), **Cyber** (Neon automation), and standard **Dark/Light** modes.
*   **Reactive Dashboard:** Instantly filter by sport, bookmaker, or start time. Pinned favorites are always prioritized and synced to the cloud.

---

## 🧠 The "Math Behind the Magic"

BijecBet implements a rigorous N-outcome mathematical validation:

1.  **Implied Probability Check:** $P = \sum_{i=1}^{n} \frac{1}{O_i}$ (where $O_i$ is Decimal Odds).
2.  **Detection:** If $P < 1.0$, a profitable arbitrage opportunity exists.
3.  **Optimal Stake $S_i$:** $S_i = \frac{T}{P \times O_i}$ (where $T$ is Total Investment).
4.  **ROI Calculation:** $ROI = (\frac{1}{P} - 1) \times 100$.

---

## 🛠️ Technical Stack

*   **Frontend:** Flutter (Mobile/Web/Desktop) + Material 3.
*   **State Management:** **Riverpod 3.0** (AsyncNotifier pattern).
*   **Native Engine:** **Rust** via `flutter_rust_bridge` (Risk scoring).
*   **Backend:** **Firebase Auth** & **Cloud Firestore** (Real-time preference syncing).
*   **Math:** `decimal` + `rational` (Scale 12 precision).

---

## 🛤️ Project Status

- [x] **Phase 1-4:** Core Infrastructure, MVP Dashboard, Calculator, and Persistence.
- [x] **Phase 5:** Stealth Mode, Rust Bridge, and API Management.
- [x] **Phase 6:** Local File Parsing (Offline Mode).
- [x] **Phase 7:** BijecCache (Self-hosted beta infrastructure).
- [ ] **Phase 8:** Push Notification Service & Direct Bookie Deep-linking.

---

## 🏁 Development & Build

### Prerequisites
- Flutter SDK (Stable)
- Rust Toolchain (`cargo`)
- Firebase CLI (`flutterfire`)

### Local Setup
1.  **Dependencies:** `flutter pub get`
2.  **Environment:** Create a `.env` in the root with `ODDS_API_KEY=your_key`.
3.  **Rust Bridge:** 
    ```bash
    cargo install flutter_rust_bridge_codegen
    flutter_rust_bridge_codegen generate
    ```
4.  **Firebase:** `flutterfire configure`

### Platform-Specific Release Notes

#### macOS (Sandboxed Release)
To fix Keychain errors in Release mode, ensure the app is signed with a valid Apple Development identity:
```bash
codesign --deep --force --options runtime \
  --sign "Apple Development: Your Name (TEAMID)" \
  build/macos/Build/Products/Release/BijecBet.app
```

#### Windows
Ensure `msix_config` capabilities (`internetClient`, `runFullTrust`) are registered in `pubspec.yaml` for network access.

---

## ⚖️ Legal & Risk
BijecBet is an analytics tool. Users are responsible for compliance with local gambling laws and sportsbook TOS. Arbitrage betting involves execution risk (lines moving before both bets are placed); BijecBet provides data, but the user manages the execution.

---
*Developed by CJ Perriello*
