# Project Requirements 

__Developer__: CJ Perriello

__Description__: The core if an Arbitrage betting automation software. The core of this project is to be able to pull live betting data from differenet platforms and compare certain bets with each other to find a place where an overlapping of the odds allows you to 100% make a profit. This should notifiy you when it finds an oppertunity, it should display live odds and allow you to do things like favorite sports , types of bets, ect.


---

## AI Assistant Guardrails
AI Assistant: When reading this file to implement a step, you MUST adhere to the following architectural rules:
1. __State Management__: Use flutter_riverpod exclusively. Do not use setState for complex logic.
2. __Architecture__: Maintain strict separation of concerns:
- /models: Pure Dart data classes (use json_serializable or freezed if helpful).
- /services: Backend/API communication only. No UI code.
- /providers: Riverpod providers linking services to the UI.
- /screens & /widgets: UI only. Keep files small. Extract complex widgets into their own files.
3. __Local Storage__: Use shared_preferences for local app state (e.g., theme toggles, onboarding
status).
4. __Database__: Use Firebase Firestore for persistent cloud data.
5. __Stepwise Execution__ : Only implement the specific step requested in the prompt. Do not jump ahead.


---

## Implementation Map

### Phase 1: Project Setup and Core Infrastructure

- [x] __Step 1.1: Dependecies and Theme__

    - Add Riverpod, Firebase Core, Firebase Auth, Cloud Firestor, and Shared Preferences to pubspec.yaml

    - Create a centralized ThemeData class in lib/theme.dart (colors, typography)

- [x] __Step 1.2: Base Architecture__
    
    - Set up the folder structure (models, screens, widgets, services, providers).

    - Wrap MyApp in a ProviderScope

- [x] __Step 1.3: Security and Config__

    - Create a .env file for API keys and a Config 
    
    - Set up flutter_secure_storage for sensitive user tokens

- [x] __Step 1.4: Math Utility__

    - Create lib/core/utils/arb_engine.dart
    
    - Write a static function that impments the sum(1 / sigma_i) < 1 logic using the Decimal package

    - It should also handle Implied Probability: P = 1 / (Decimal Odds)

    - Indivdual Stakes (Si): Si = (Total Investment / (Arbitrage Percentage) * Sigma_i)

- [x] __Step 1.5: Scraper/API__
    - Create the /lib/services/odds_api_service.dart
    - This will handle all of the heavy lifitng for getting the data 
    - For testing purposes limit api use which means:
        - Use Mock data until the full integration of the math and the use of the API pulling system until really necessary 
        - Use a simple local chaching mechanism (Shared_preferences) SO that everytime you host-restart the app during UI dev, you aren't burning tokens
    - Added conversion support for American odds (`+/-`) into normalized decimal odds (`decimal_price`) in `odds_api_service.dart`

### Phase 2: The "Minimum Viable Product" (MVP)

*Goal: The The core defining feature of the app must function with mock data or local state. Note: Focus on functionality, not perfect styling yet.*

- Mock data, make sure that in /lib/core/constants/ we have a mock_data.dart file that will assit with all mocking of data for the dashboard and anything else

- Here is the list of Betting Markets I will limit for now. 
    - Head to Head (Moneyline) odds
    - Point Spreads (handicap) odds
    - total (over/under) odds
    - outrighs(futures) odds

- [x] __Step 2.1: Main Screen__
    - Develop the main screen for the application

    - We will use tradtional flutter framework to create a place that displays the following:
        - A login button for existing users
        - A sign up button for new users
    - Phase 3 will implment thesee but we need to create the screens for them 

    - [x] __Step 2.1.1: Login__
        - Using a form,  allow for a place to add in the Username
        - Using a form, allow for a place to add password
        - Then an elevated button to allow us to start the login
        - Allow for a icon button in the top left for us to go back to the main screen
    - [x] __Step 2.1.2: Sign up__
        - Using a form display,  allow for aplace to add in the Username
        - Using a form display, allow for a place to add password
        - Then an elevated button to allow us to start the login
        - Inforce the password being at least 8 charcters and need a special character
        - Allow for a icon button in the top left for us to go back to the main screen

- [x] __Step 2.2: Dashboard__
    - This is the main dashboard for the app

    - [x] __Step 2.2.1: Account Icon__
        -  Have an icon button in the top left that is a profile button
        - Once pressed have a dropdown popup with the following structure:
            - Display the Username at top
            - Then a settings icon that will go to settings
            - Then a Sign out button that will be used to sign out
        - This can use the flutter PopupMenuButton 
    
    - [x] __Step 2.2.2: Live Opportunity List__ 
        - Create a scrollable list (ListView) on the Dashboard that displays "Arb Opportunities."
        
        - Each Card should show:
            - Event Name 
            - The two sportsbooks involved 
            - The "Arb %" (Profit margin)
            - The Market (EX: Moneyline)
        - Allow for sorting: So Highest profit or soonest payout ect
        - Freshness indicator: a small timer or pulse icon showing how many seconds ago the odds were updated 
        - Remember that this is mocking so we can use mock data for now
- [x] __Step 2.3: Manual Arb Calculator__
    - *Input*: Tow or three text fields for "Odds" from different books
    - Odds mode toggle: user can switch between Decimal and American odds entry
    - In American mode each odds line uses a `+/-` dropdown and a numeric field (no sign parsing from text)
    - Field for "Total Investment": Allow the user to input $100, $300, ect.
    - *Output*: Use the engine to display the "Arbitrage %" and the "Required Stakes" to break even/profit based on a total $ amount
    - Also display:
        - Stake breakdown: "Bet $X on Bookie A, $Y on Bookie B."
        - Net Profit
            
- [x] __Step 2.4: Watchlist or Favorites__
    - Allow the user to pin a game they are looking at so they do not lose it if the screen updates 
    - This should use the shared prefrence to save the users favorited sports/games so they do not refilter when the dashboard refreshes
    - Implemented local pinned-watchlist persistence with `shared_preferences` and favorites-first ordering on dashboard cards
    - Implemented pinned sport preferences with persisted `shared_preferences` keys and dashboard filtering by selected sports
- [x] __Step 2.5: Search__
    - Allow for a mag-glass icon to pull up a blurred text box (SearchDelegate) to search for games in the list of all games that are displayed
    - Added app bar search icon and `SearchDelegate` flow that searches displayed games by event, market, sportsbook, and sport

- [x] __Step 2.6: Sports Card__:
    - You should be able to press on a card and see 
        - the two teams or players or opponents
        - what time the game starts and then 
        - Should be able to select from the given markets and get every odds from every book 
    - Implemented tap-through detail screen with market selector and full bookmaker odds display per selected market
    
### Phase 3: App Functionality and Intergration

*Goal: Complete major functionality and replace mock data with live cloud and authentication.*

- [x] __Step 3.1: Main Screen__
    - Intergrate the main screen for the application


    - [x] __Step 3.1.1: Login__
        - This will use Firebase Auth to check if the login is valid
        - If an error occurs then add a bottom popup (Toast) to say something like "Invalid Username and/or password, if first time pleas go to sign up"
        - If valid login and bring them to the main dashboard
        - Also start the load of any data from the cloud or local data needed to represent that specific user
        - Implemented Firebase email/password sign-in with bottom `SnackBar` error feedback and success routing to dashboard
    - [x] __Step 3.1.2: Sign up__
        - This will use Firebase Auth to check if the sign up is valid
        - If an error occurs then add a bottom popup (Toast) to say something like "Invalid Username and/or password"
        - Inforce the password being at least 8 charcters and need a special character
        - If valid login and bring them to the main dashboard
        - Also start the load of any data from the cloud or local data needed to represent that specific user
        - Implemented Firebase email/password account creation with bottom `SnackBar` error feedback and success routing to dashboard
    - [x] __Step 3.1.3: Google__
        - Alternativley have the sign up page have a google sign up button that uses the firebase Auth google plugin to create or sign up for an account
        - Implemented Google sign-in button on Sign Up screen and Firebase credential-based sign-in flow
    - [x] __Step 3.1.4: Username__
        - IF it is the first time that this has been logged in then we need to allow the person to select a Username and store it in the database for display reasons 
        - Create a new screen called UsernameScreen widget class that is a new screen that allows the person to enter in text that will be their username, then store it to the firebase database

- [x] __Step 3.2: The Auth Gate__
    - Create an AuthGate widget that listens to the firebase auth state stream
    - if user == null, show LoginScreen. Else, show MVP screen.
    - Logout Lofic: Implement the functionality for the "Sign out" button defined in Phase 2.2.1


- [x] __Step 3.3: Cloud Database Integration__
    
    - [x] __Step 3.3.1: Live odds integration__
        - Replace mock_data.dart with API-backed local odds storage/cache in OddsApiService
        - Keep live odds local on-device and refresh them from the API on an interval
        - Connect the Live opportunity list (2.2.2) to the refreshed local/API stream provider

    - [x] __Step 3.3.2: Sorting and Filtering Logic__:

        - Implement the functional logic for the "Highest Profit" and "Soonest Payout" sorting ehaders creaded in Phase 2

    - [x] __Step 3.3.3: Favorites Cloud Sync__:
        - Upgrade Phase 2.4 (Watchlist). Instead of only shared_preferences, sync favorited games to the users firestore document so they persist across devices

- [x] __Step 3.4: Manuel Arb Calculator Logic__
    - Connect the ArbEngine (Phae 1.4) to the UI fields from Phase 2.3
    - Ensure the "Total Investment" field updates teh "Required Stakes" dynamically as the user tpyes (using a StateProvider)



### Phase 4: Polish and persistence

- [x] __Step 4.1: Local State (Shared Preferences)__
    - Implemet a feature that saves to the local device (e.g., a "Dark Mode" toggle or a "Don't show
    this again" intro screen)


- [ ] __Step 4.2: Error Handling and Loading State__
    - Ensure all asynchronous Riverpod provider correctly handle loading and error states in the UI using AsyncValue.when()

- [x] __Step 4.3: Final Theming and Cleanup__
    - Apply Consistent PAdding, colors, and typography
    - Refacto any files that have grown too large 
    

- [ ] __Step 5: Market__(As of March 26, skip might come back):
    - This is if there is anytime left at all

    - Add different plug ins for different APIs that pull from markets and get JSON formatted data. This will allow users to put in their own api keys for services if they have them


### Phase 5: Addtion 

This section should be dated and also numbered for prioty (number removed once completed)

- [x] __5.1 Book filter__:
    *Goal: Give users the power to filter their "Live Opportunity List" based on the specific books they actually have accounts with, ensuring every displayed "Arb" is actionable.*

    - [x] __5.1.1: Favorite Sportsbooks (Logic & Filtering)__
        - **The Filtering Engine**: Enhance the `opportunitiesProvider` to accept a second list of filters: `activeBookmakers`.
        - **Logic Proximity**: Co-locate the methods for filtering books in the same Service/Provider as the sport-category filtering to ensure a dual-pass check:
            1. *Is the sport category currently active?*
            2. *Are BOTH bookmakers involved in this specific Arb currently active?*
        - **The Arb-Validity Rule**: Strictly exclude any opportunity from the dashboard if one or more of the books involved are not in the user's "Favorites" list.
        - Implemented provider-layer dual-pass filtering (`sport` then `bookmakers`) with `activeBookmakerKeysProvider`; empty bookmaker selection defaults to no bookmaker constraint.

    - [x] __5.1.2: Saving (Dual-Layer Persistence)__
        - **Local-First Strategy**: Store favorite sportsbook IDs in `shared_preferences` to allow the UI to render filters instantly upon app launch, even before the Firebase handshake.
        - **Cloud-Sync Strategy**: Trigger an asynchronous update to the user's Firestore document (e.g., `users/{userId}/preferences/bookmakers`) whenever a toggle occurs.
        - **Conflict Resolution**: Implement a sync check on app initialization that compares local timestamps against Firestore to ensure the user's latest preferences are reflected across all devices.
        - Implemented `favoriteBookmakerKeysProvider` + `WatchlistService` persistence with local timestamped `shared_preferences`, Firestore sync at `users/{uid}/preferences/bookmakers`, and latest-write conflict resolution on initialization.

    - [x] __5.1.3: UI Implementation (The Filter Stack)__
        - **The Filter Bar Hierarchy**: Place a horizontal scrollable row of `FilterChip` widgets directly beneath the "Favorite Sports" row to create a logical "Filter Stack."
        - **Component Design**: 
            - Use sportsbook branding/logos within the chips for quick recognition.
            - Utilize high-contrast "Active" states (defined in `theme.dart`) to show which books are currently filtering the list.
            - Integrate a "Select All" toggle at the start of the row to prevent "Filter Fatigue" when managing multiple books.
        - **Reactivity**: Ensure the Dashboard `ListView` reactively updates via Riverpod as soon as a chip is toggled.
        - Added a dashboard sportsbook chip row beneath pinned sports with a leading "Select All" toggle, high-contrast active chip styling from `QuantTheme`, and reactive Riverpod-driven updates tied to persisted bookmaker preferences.

        
- [x] __5.2: Settings expanded__
    *Goal: Transform the basic settings into a granular control center for user preferences and app aesthetics, utilizing a tabbed layout for improved navigation.*

    - [x] __5.2.1: Settings Tabbed Layout (Favorites Hub)__
        - **Navigation Architecture**: Implement a `DefaultTabController` at the top of the Settings screen with a `TabBar` containing "Favorites" and "Theme" tabs.
        - **The Favorites Tab**: Organize this view into two distinct, vertically scrollable sections: "Favorite Sports" and "Favorite Books."
        - **Section Layout**: Each section will feature a header with a "Plus" (+) action button to trigger the addition workflow.
        - Implemented `DefaultTabController` settings shell with Favorites/Theme tabs, vertically scrollable favorites sections, and section header add actions.
        - [x] __5.2.1.1: Setting Favorite Card Component__
            - **Visual Design**: A streamlined, low-profile `Card` widget displaying the name of the entity (Sport or Bookmaker).
            - **Interaction**: Include a trailing "Minus" (-) or "Trash" icon button. When pressed, it triggers the removal logic from both `shared_preferences` and `Firestore`.
            - Implemented `_SettingFavoriteCard` low-profile cards with trailing remove buttons wired to the existing Riverpod favorite toggles (local + Firestore sync path).
        - [x] __5.2.1.2: Add-Favorite Modal (The Discovery Overlay)__
            - **UI/UX**: Implement a `showDialog` or `showModalBottomSheet` with a `BackdropFilter` to create a professional blurred-background effect. 
            - **Dynamic Loading**: The modal will populate cards based on the API's full list of supported sports or bookmakers.

            - **Add Logic**: Each card in the modal features a "Plus" (+) button. Once pressed, the item is added to the user's active list, and the UI reactively updates the background Settings page via Riverpod.
            - Added a blurred `showDialog` add-favorite overlay for sports/books with provider-backed dynamic lists and per-item add actions that update favorites immediately.


    - [x] __5.2.2: Universal Theme Engine & Refactor__
        - **Theme Centralization**: Refactor `lib/theme.dart` into a "Theme Registry." Instead of simple variables, create a class that defines distinct `ThemeData` objects for each mode:
            - **Dark Mode**: High-contrast blacks/greys for night betting.
            - **Quant Mode**: A clean, data-heavy "Bloomberg-style" aesthetic.
            - **Cyber Mode**: Neon accents and dark backgrounds for a high-tech automation feel.
        - **Dynamic Theme Switcher**: 
            - **UI**: In the "Theme" tab of Settings, implement a `DropdownButtonFormField` or a series of `RadioListTile` widgets displaying the available theme names.
            - **State Management**: Connect the selection to a `ThemeNotifier` (Riverpod) that wraps the `MaterialApp`'s `theme` property.
            - **Persistence**: Ensure the selected theme ID is saved to `shared_preferences` so the user's aesthetic preference persists across app restarts.
        - Implemented `AppThemeRegistry` + `AppThemeId` in `lib/theme.dart`, `appThemeSelectionProvider` persistence in Riverpod, `MaterialApp` theme wiring in `main.dart`, and Theme tab `RadioListTile` selector persistence in Settings.
        
           





  

- [x] __5.3: Anti-Limitation Caught System__
    **Goal**: Implement "Stealth Mode" rails to guide users in avoiding detection by sportsbook algorithms, effectively mimicking recreational betting behavior to prevent account limiting. Risk scoring is handled by a Rust native library (`bijec_bet_engine`) exposed to Flutter via `flutter_rust_bridge`. Flutter owns stake calculation and UI rendering; Rust returns risk outputs only.

    **Architecture**:
    - A Rust crate lives at `rust/` in the project root. It exposes a public risk entry point: `compute_risk(RiskInput) -> RiskOutput`.
    - `flutter_rust_bridge` (v2) generates type-safe Dart bindings from annotated Rust `pub fn` signatures. No manual FFI glue.
    - Dart computes stake distribution from total investment and odds (existing arb engine/UI flow), then sends risk inputs to Rust and maps the returned risk level to bars/colors.

    - [x] __5.3.0: Rust Bridge Setup__
        - Add `flutter_rust_bridge` and `flutter_rust_bridge_codegen` to the project.
        - Initialize the Rust crate at `rust/` with `cargo init --lib` and set `crate-type = ["cdylib", "staticlib"]` in `Cargo.toml`.
        - Add `flutter_rust_bridge = "2"` as a Rust dependency.
        - Run the codegen step to produce the `lib/src/rust/` bindings directory. Add this directory to `.gitignore` and document the regeneration command in `README.md`.
        - Set up the folder structure inside the Rust crate:
            - `rust/src/lib.rs` — bridge entry point
            - `rust/src/api.rs` — FRB-exposed bridge functions
            - `rust/src/risk.rs` — all scoring: A, N, M, G, and level mapping
        - Verify the bridge is live with a trivial `pub fn ping() -> String` smoke test before proceeding to any other 5.3 steps.
        - Implemented `rust/` crate scaffolding with `api.rs` FRB entrypoints (`ping`, `compute_risk`), generated bindings under `lib/src/rust/`, and added a Rust unit smoke test asserting `ping() == "pong"`.

    - [x] __5.3.1: Settings__
        - Add a new **"Anti-Limitation"** tab to the existing `DefaultTabController` in Settings (alongside Favorites and Theme).
        - Implement a master "Stealth Mode" `Switch` tile at the top of the tab.
        - Include a descriptive subtitle: *"Monitors Account Heat using risk scoring to extend your account longevity."*
        - The config fields in 5.3.1.2 are gated behind this switch and should be disabled when Stealth Mode is off.

        - [x] __5.3.1.1: Stealth Stake & Risk Monitor (Detail Screen)__
            - When Stealth Mode is active, the `SportsEventDetailScreen` must include a field for "Total Investment".
            - Upon inputting an investment, the UI must dynamically calculate and display recommended stakes for each outcome using the Dart arb engine.
            - If Stealth Mode is active, these suggested stakes must be rounded to the nearest configured increment (5 or 10) as defined in Stealth Settings.
            - **Calculation Note**: Payout and Profit must be recalculated using the *rounded* stakes. The "Guaranteed Payout" displayed should be the minimum of the possible outcomes based on these discrete bets.
            - After rounding, the UI must send the updated stake context and user settings to the Rust engine (`bijecBetBridge.computeRisk`) to get a real-time risk level.
            - Integrate the **Risk Monitor** widget (pulsing health bars) into the detail screen. It should update its level and color mapping (1–10) dynamically as the user changes their investment or switches between different market lines.
            - The `OpportunityCard` on the dashboard should be stripped of stealth stake text and health bars, focusing instead on the top arbitrage return percentage and market metadata.

    - [x] __5.3.1.2: Config__
        - Create the following input fields, enabled only when Stealth Mode is on:
            - **Average (arbitrage) bets per day** (integer)
            - **Number of books being used** (integer)
            - **Number of sports usually bet** (integer)
            - **Stake rounding increment** (dropdown: 5 or 10)
        - **Data Persistence**: These configurations must be saved to both `shared_preferences` and Firebase Firestore (under `users/{uid}/preferences/stealth`).
        - Implement a "Save" button to commit changes.
        - Ensure fields auto-populate with the last saved values even if the mode is toggled off and back on.
    - [x] __5.3.2: Risk Calculation (Rust Crate — `rust/src/risk.rs`)__
        - Implement a standardized risk-scoring system in Rust that translates live data into a **Global Risk Score (G)** from 0 to 100 and a discrete **level** from 1–10.
        - The single public entry point exposed to Dart is `compute_risk(input: RiskInput) -> RiskOutput`. Mark it `#[flutter_rust_bridge::frb(sync)]` since it is pure math with no I/O — this avoids a `FutureProvider` on the Dart side and keeps live updates instantaneous.
        - Input and output types:
            ```rust
            pub struct RiskInput {
                pub arb_percent: f64,
                pub total_investment: f64,
                pub stake_distribution: Vec<f64>,
                pub bets_per_day: u32,
                pub books_count: u32,
                pub sports_count: u32,
                pub market_types: Vec<MarketType>,
            }

            pub struct RiskOutput {
                pub score_a: f64,
                pub score_n: f64,
                pub score_m: f64,
                pub global_score: f64,
                pub level: u32,
            }

            pub enum MarketType {
                Moneyline,
                MainTotalHandicapSpread,
                SmallMarketTotalHandicap,
            }
            ```

        - [x] __5.3.2.1: Factor Mapping__
            - **Arb Score (A)** — step function on `arb_percent`:
                - $\le 2\% \rightarrow 10$ | $3\% \rightarrow 30$ | $4$–$5\% \rightarrow 50$ | $6\% \rightarrow 80$ | $> 6\% \rightarrow 100$
            - **Sports Count Score (N)** — step function on `sports_count`:
                - $\le 2 \rightarrow 10$ | $3 \rightarrow 20$ | $4 \rightarrow 40$ | $5 \rightarrow 60$ | $6 \rightarrow 70$ | $> 6 \rightarrow 100$

        - [x] __5.3.2.2: Market Risk Average (M)__
            - Calculate the weighted arithmetic mean over the provided `market_types`:
            - $$M = \frac{\sum (m_i \cdot w_i)}{\sum w_i}$$
            - **Constants (Risk $m$, Weight $w$)**:
                - **Moneyline**: $10, 1$
                - **Main Totals / Handicaps / Spread**: $30, 2$
                - **Small Market Totals / Handicaps**: $80, 4$ (Small market = anything outside major leagues like NBA, NFL, MLB, etc.)
            - If `market_types` is empty, return `M = 0.0`.

        - [x] __5.3.2.3: Global Score to Level Mapping__
            - Calculate Global Score: $$G = \frac{A + N + M}{3}$$
            - **1/10 Level Mapping**:
                - $0$–$10 \rightarrow 1$ | $11$–$20 \rightarrow 2$ | $21$–$30 \rightarrow 3$ | $31$–$40 \rightarrow 4$
                - $41$–$50 \rightarrow 5$ | $51$–$60 \rightarrow 6$ | $61$–$70 \rightarrow 7$ | $71$–$80 \rightarrow 8$
                - $81$–$90 \rightarrow 9$ | $91$–$100 \rightarrow 10$
            - Write unit tests for `compute_risk` directly in the Rust crate using `cargo test` covering boundary values for each step function.

    - [x] __5.3.3: UI & Dash Integration__
        - The Dart layer calculates stake distribution first from total investment + odds, then calls `bijecBetBridge.computeRisk(input)` and passes the returned `RiskOutput` struct into pure display widgets.

        - **Live Updates**: Wire the "Total Investment" `TextEditingController` on each Arb card to a `StateProvider<double>`. A `ref.watch` on that provider triggers UI stake recomputation and then a re-call to `computeRisk`. Because the Rust function is sync, updates are instantaneous with no loading state.
        - **Dashboard Health Gauge**: Add a "Daily Risk Health" widget to the main dashboard header showing the average `globalScore` across all opportunities viewed that session. Session scores are accumulated in a `StateNotifierProvider<List<double>>` and averaged in Dart — no Rust call required for this aggregation.
        - **Animations**: Use an `AnimationController` per Risk Monitor widget (disposed in `State.dispose`).
            - Active bars pulse via a `TweenSequence` on opacity: `1.0 → 0.6 → 1.0`.
            - Pulse duration scales with level: `baseDuration = 1200ms - (level * 80ms)`, so level 10 pulses roughly 3× faster than level 1.
            - Use a `ColorTween` between the bar's assigned color and its 30%-lightened variant for the glow effect.




- [ ] __5.4: API Key Management & Integration__
    **Goal**: Provide a secure, user-facing interface to manage external API credentials, allowing for dynamic key updates without requiring a full app rebuild.

    - [x] __5.4.1: Settings - API Keys Tab__
        - Add a third tab to the `DefaultTabController` in the Settings screen titled **API Keys** using the `Icons.vpn_key` icon.
        - Implement a specialized **OddsAPI** configuration section.
        - [x] __5.4.1.1: Secure Input Field__
            - Create a `TextField` for the OddsAPI key with a "Privacy Toggle."
            - **Functionality**: Use `obscureText: true` by default. Add a `suffixIcon` with an "eye" (IconButton) that toggles the visibility of the key.
            - **Validation**: Implement a basic check to ensure the key string is not empty and matches the expected length/format of an OddsAPI key before allowing a save.
        - [x] __5.4.1.2: Save & Sync Action__
            - Add an "Update Key" button that triggers the following logic:
                - **Primary Storage**: Save the key to `flutter_secure_storage` (per Requirement 1.3) to ensure sensitive credentials are encrypted on the device hardware.
                - **Dynamic Environment Update**: Update the in-memory `Config` class so that the `OddsApiService` immediately begins using the new key without requiring a restart.
                - **Feedback**: Show a "Success" `SnackBar` once the key is successfully verified and stored.
        - Added a third Settings tab (`API Keys`, `Icons.vpn_key`) with an OddsAPI section, obscured key input + eye toggle, 32-character format validation, secure-device persistence via `flutter_secure_storage`, runtime `AppConfig` key override for immediate OddsApiService usage, and success/error `SnackBar` feedback.

    - [x] __5.4.2: Infrastructure Integration__
        - **Refactor Config Service**: Modify the current configuration logic to prioritize the user-entered key from secure storage.
        - **Hierarchy of Credentials**:
            1. Check `flutter_secure_storage` for a user-provided key.
            2. If empty, fallback to the hardcoded key in `./assets/.env`.
        - **File Management (Dev Only)**: While assets are read-only in production, ensure the local development environment includes a script or utility to sync these values to the `.env` file for local testing consistency.
        - `AppConfig.load(...)` now accepts a secure-storage key and prioritizes it over `.env` with strict format validation; `main.dart` initializes config using secure-storage first; and a dev utility (`tool/sync_odds_api_key.dart`) plus README commands now support syncing local OddsAPI keys into `.env`.

    - [x] __5.4.3: API Health & Quota Monitor (Expanded)__
        - **Key Validation**: Upon saving, perform a "handshake" call to the OddsAPI (e.g., a simple `/sports` request). If the API returns a `401 Unauthorized`, notify the user immediately and do not save the key.
        - **Quota Display**: Beneath the text field, add a small text indicator showing the "Remaining Requests" returned by the API's header (e.g., `x-requests-remaining`).
        - **Service Injection**: Update the `oddsApiServiceProvider` (Riverpod) to listen to the secure storage provider, ensuring the service is always "watching" for key changes.
        - Added save-time OddsAPI handshake validation with explicit 401 rejection, displayed `Remaining Requests` from response headers in the API key settings card, and introduced `oddsApiKeyProvider` so `oddsApiServiceProvider` reactively rebuilds from secure-storage-backed key changes.



- [ ] __5.5: Manual Arb Calc Explainer__
    **Goal**: Add an educational instructional section directly beneath the Manual Arb Calculator to guide users through the process of manual entry and opportunity identification.

    - [x] __5.5.1: "How to Use This" Section__
        - **Placement**: Positioned immediately below the `ManualArbCalculatorCard` on the Calculator screen.
        - **Toggle Interaction**: Feature a small, floating card or `SegmentedButton` in the top-right of this section that allows users to switch between **American** and **Decimal** explanation modes.
        - **Format**: Use a `TabBarView` or conditional rendering to switch the text/examples based on the selected format.
        - Added a new instructional section directly beneath the calculator card with a top-right `SegmentedButton` (American/Decimal) and conditional, mode-specific step guidance.

    - [x] __5.5.2: 2-Way Market Example (H2H/Moneyline)__
        - **Scenario**: NFL - Kansas City Chiefs vs. Buffalo Bills.
        - [x] __American Explanation__:
            - **Setup**: Bookie A has Chiefs at `+110`. Bookie B has Bills at `+105`.
            - **Step-by-Step**:
                1. Set Bookie A sign to `+` and enter `110`.
                2. Set Bookie B sign to `+` and enter `105`.
                3. Enter `$100` in Total Investment.
            - **The Result**: App shows an Arb % of ~97.5% (Profitable). It instructs you to bet ~$48.78 on Chiefs and ~$51.22 on Bills for a guaranteed profit regardless of who wins.
        - [x] __Decimal Explanation__:
            - **Setup**: Bookie A has Chiefs at `2.10`. Bookie B has Bills at `2.05`.
            - **Step-by-Step**: Follow the same input steps using the decimal fields to achieve a sub-100% total implied probability.
        - Added mode-specific 2-way NFL examples in the Calculator explainer section with the exact American and Decimal setups, step-by-step inputs, and expected profitable outcome messaging.

    - [x] __5.5.3: 3-Way Market Example (1X2/Soccer)__
        - **Scenario**: Premier League - Liverpool vs. Arsenal (including Draw).
        - [x] __American Explanation__:
            - **Setup**: Bookie A (Liverpool) at `+150`. Bookie B (Draw) at `+250`. Bookie C (Arsenal) at `+280`.
            - **Step-by-Step**:
                1. Enter Bookie A: `+150`.
                2. Enter Bookie B: `+250`.
                3. Enter Bookie C: `+280`.
            - **The Result**: Logic calculates the sum of reciprocal odds. If the sum is < 1.0, the app highlights "Profitable Opportunity" and provides the 3-way stake breakdown to cover all three outcomes.
        - [x] __Decimal Explanation__:
            - **Setup**: Bookie A: `2.50`. Bookie B: `3.50`. Bookie C: `3.80`.
            - **Calculation**: $1/2.5 + 1/3.5 + 1/3.8 = 0.40 + 0.28 + 0.26 = 0.94$ (6% Profit Margin).
        - Added full 3-way soccer examples in both American and Decimal explainer modes, including setup values, ordered steps, and outcome/calculation guidance.

    - [x] __5.5.4: UI Components & Styling__
        - **Visual Hierarchy**: Use how we use themes before for the background and `*.action` for step headers (1, 2, 3).
        - **Step Cards**: Use a `Stepper` widget or a vertical list of custom cards to make the "Step-by-Step" instructions scannable.
        - **Mathematical Callouts**: Include a "Pro Tip" box explaining the core logic: *“If the total implied probability is less than 100%, you have found an arbitrage.”*
        - Refactored the Calculator explainer into themed custom step cards with `QuantTheme.action` step-number headers, preserved themed panel hierarchy, and added a dedicated Pro Tip callout box with the implied-probability rule.




- [ ] __5.6: API limitation calling__
    Purpose: If we are filtering based on sports books and classes
    - We want api calls to only call sports that are saved as favorites, so only lines for NBA if that is the only favorite
    - WE want api call to only call for the books that the filter has as filtered books

- [x] __5.7: UI toggle__
   Purpose: add a toggle that toggles ("Games already started") as off or on and  it filters if the game has already started, this is best for now as we are only polling data very 5 min and  when the game is currently live you can hit like 40 - 70% roi and  then A get limited or B jsut have the line move so fast its gone
 - Add the State
 - Ask for the toggle variable first.
 - Add a React useState hook called hideStarted (implemented as hideStartedGamesProvider in Riverpod). Also, add a useMemo block to filter the games array so it only includes games where the commence_time is in the future (implemented in arbOpportunitiesProvider).
 - Add the UI Toggle
 - Ask for the visual checkbox.
 - Add a UI toggle (Switch) above the list that controls the hideStarted state.

- [x] __5.8: Arb detection logic__

 - Update the arbitrage detection logic to support 3-way (1X2) markets. It should check if there are 3 outcomes and apply the formula: (1/O1) + (1/OX) + (1/O2) < 1.

 - Modify the BetCard UI component to handle a third betting option. If the market is a 3-way market, display the Home, Draw, and Away odds and calculate the required stakes for all three to guarantee the same profit.

- [x] __5.8b: Mock Data__

 - In mock_data.dart, generate 8 new mock ArbOpportunity objects using the List<ArbOutcome> format. Provide:Two 3-way Soccer Arbs (1X2) where $(1/O1 + 1/OX + 1/O2) < 1$ (ROI > 3%).Two 2-way Tennis Arbs where $(1/O1 + 1/O2) < 1$ (ROI > 2%).Four Non-Arbs (two 2-way, two 3-way) where the math results in a loss (ROI < 0%).
 
 - Ensure commence_time varies: some should be in the past (to test our new 'Hide Started' filter) and some in the future. Use realistic bookmaker names like DraftKings, FanDuel, and Bet365."

 - [x] __5.9: Secure API Key Deletion (The "Wipe" System)__
 Goal: Implement a failsafe "Wipe" mechanism for the API key to ensure user security and allow for clean credential resets without app reinstallation.

 [x] **5.9.1: Storage Logic (Hardware Wipe)**

 -Service Method: Update SecureStorageService to include an async function deleteApiKey().

 -Execution: This must call _storage.delete(key: 'odds_api_key') to remove the entry from the device's encrypted keychain/keystore.

 -Verification: The function should return a boolean to confirm the key no longer exists in storage.

 [x] **5.9.2: State Management (Riverpod Reset)**

 -Provider Invalidation: In the oddsApiKeyProvider, add a method to trigger the hardware wipe.

 -Reactivity: Once the key is deleted, the provider must notify all listeners (like the oddsApiServiceProvider) by setting the state to null.

 -Immediate Effect: This should immediately stop any ongoing "Live Opportunity" polling to avoid 401 errors.

 [x] **5.9.3: UI Implementation (Settings Button)**

 -Placement: Add a TextButton or ListTile at the bottom of the API Keys settings tab (Step 5.4.1).

 -Styling: Use QuantTheme.error (Red) for the text and use Icons.delete_forever to signal a destructive action.

 -Label: "Clear Stored API Key"

 [x] **5.9.4: UX Guardrails (Confirmation & Routing)**

 -Confirmation Dialog: Pressing the button must trigger a showDialog.

 -Content: "Wipe API Key? This will stop all live data syncing until a new key is provided."

 -Actions: "Cancel" (close) and "Wipe" (execute).

 -Post-Wipe Feedback: Show a SnackBar confirming the wipe.

 -Navigation: Automatically pop the user back to the Dashboard or a "Setup Required" state to ensure the UI reflects the missing credentials.

[x] **5.10.1: Fixing Mock Data**

- Update lib/core/constants/mock_data.dart. Generate 6 realistic ArbOpportunity objects using the List<ArbOutcome> format.

- Three 3-way Soccer arbs (1X2) with ROIs between 2% and 5%. (Example math: Odds 2.1, 3.4, 4.2).

- Three 2-way Tennis arbs with ROIs between 1% and 4%.

- Ensure commenceTime is varied (some in the future, some in the past).

- Constraint: All odds must be realistic for major bookmakers (e.g., no 10.0 odds for a heavy favorite).

[x] **5.10.2: Refactoring Calculation Logic**

- Refactor the staking logic in lib/core/utils/arb_engine.dart (and the associated Riverpod providers) to be market-agnostic.

- Instead of assuming two outcomes, the function should accept a List<ArbOutcome>.

- Implement the universal staking formula: Stake_i = TotalInvestment / (ArbPercentage * Odds_i).

- Ensure the sum of all calculated stakes perfectly matches the totalInvestment input to avoid rounding errors.

[x] **5.10.3Fixing UI Error**

- Locate the ArbDetailScreen (or the widget handling the Investment Input).

- Remove the hardcoded error message that says 'pick one with only two-way'.

- Update the UI to dynamically build the 'Required Stakes' display using a ListView.builder or Column based on the length of opportunity.outcomes.

- If there are 3 outcomes, it should show 3 rows (Home, Draw, Away) with their respective stakes and bookmakers.

- Ensure the 'Total Profit' calculation updates in real-time as the user types the investment amount.




### Phase 6: Local File Parsing & Mocking (Version 0.8.0)

*Goal: Implement a robust "Local File" architecture to allow the application to run completely offline. This ensures UI/UX development, engine testing, and debugging can continue without burning through external Odds API tokens, seamlessly parsing local machine data as if it were a live network response.*

- [ ] __Step 6.1: Settings UI (Data Source Config)__
    - **UI Integration**: Add a new "Data Source Configuration" section directly beneath the Odds API card within the existing **API Keys** tab (`_ApiKeysSettingsTab`) in `SettingsScreen`.
    - **Path Inputs**: Create two `TextField` inputs (or utilize a file picker integration) for the user to specify local machine file paths:
        - `Odds Data Path`: The absolute path to the JSON file containing raw betting lines.
        - `Sports Catalog Path`: The absolute path to the JSON file detailing active sports and books.
    - **The Data Toggle**: Implement a master `SegmentedButton` that acts as the source-of-truth toggle, allowing the user to switch the app's data source between "Live Odds API" and "Local Files."

- [ ] __Step 6.1.2: Local Betting Data Integration & Explainer__
    - **Logic Refactor**: Modify the `OddsApiService` (injected via `oddsApiServiceProvider`) so that when the "Local File" mode is active, `fetchOdds` and `watchOdds` (which feeds `rawOddsProvider`) read from the provided local JSON path using `dart:io`.
    - **Parsing**: The data must be deserialized using the exact same standard Odds API models, allowing the rest of the application (including the Rust risk engine) to function without knowing the data is mocked.
    - **UI Explainer**: Beneath the `Odds Data Path` input field, add an `ExpansionTile` or an "Info" icon that opens a modal. This must show the user the strict JSON schema required for the file parser to work correctly:
        > **Required Odds JSON Format:**
        > ```json
        > [
        >     {
        >         "id": "bda33adca828c09dc3cac3a856aef176",
        >         "sport_key": "americanfootball_nfl",
        >         "commence_time": "2021-09-10T00:20:00Z",
        >         "home_team": "Tampa Bay Buccaneers",
        >         "away_team": "Dallas Cowboys",
        >         "bookmakers": [
        >             {
        >                 "key": "unibet",
        >                 "title": "Unibet",
        >                 "last_update": "2021-06-10T13:33:18Z",
        >                 "markets": [
        >                     {
        >                         "key": "h2h",
        >                         "outcomes": [
        >                             { "name": "Dallas Cowboys", "price": 240 },
        >                             { "name": "Tampa Bay Buccaneers", "price": -303 }
        >                         ]
        >                     },
        >                     {
        >                         "key": "spreads",
        >                         "outcomes": [
        >                             { "name": "Dallas Cowboys", "price": -109, "point": 6.5 },
        >                             { "name": "Tampa Bay Buccaneers", "price": -111, "point": -6.5 }
        >                         ]
        >                     }
        >                 ]
        >             }
        >         ]
        >     }
        > ]
        > ```

- [ ] __Step 6.1.3: Local Sports Catalog Integration & Explainer__
    - **Logic Refactor**: Mirror the logic from 6.1.2 for `fetchSports`. Any query for `availableSportsByKeyProvider` or `availableBookmakersByKeyProvider` must read from the provided local sports catalog path when the "Local File" mode is active.
    - **UI Explainer**: Add a corresponding `ExpansionTile` or modal beneath the `Sports Catalog Path` input showing the required array format:
        > **Required Sports Catalog JSON Format:**
        > ```json
        > [
        >     {
        >         "key": "americanfootball_ncaaf",
        >         "group": "American Football",
        >         "title": "NCAAF",
        >         "description": "US College Football",
        >         "active": true,
        >         "has_outrights": false
        >     },
        >     {
        >         "key": "americanfootball_nfl",
        >         "group": "American Football",
        >         "title": "NFL",
        >         "description": "US Football",
        >         "active": true,
        >         "has_outrights": false
        >     }
        > ]
        > ```

- [ ] __Step 6.1.4: Local Persistence & Reactivity__
    - **The Action**: Add an "Apply Local Config" save button at the bottom of the configuration section.
    - **Hardware-Only Storage**: Persist the chosen file paths and the data source mode strictly to `SharedPreferences`.
    - **Cloud Blacklist**: Explicitly **DO NOT** sync these local machine paths to the user's Firestore document (`users/{uid}/preferences`), as directory structures are unique to the hardware and non-portable.
    - **Reactivity**: Ensure saving updates `AppConfig` immediately and invalidates the `rawOddsProvider` and `availableSportsByKeyProvider` to trigger an instant UI refresh with the newly selected local data.