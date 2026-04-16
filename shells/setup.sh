flutter clean
flutter pub get

cargo install flutter_rust_bridge_codegen
flutter_rust_bridge_codegen generate #--rust-root rust --rust-input crate::api --dart-output lib/src/rust --c-output rust/frb_generated.h
flutter run -d chrome --web-header=Cross-Origin-Opener-Policy=same-origin --web-header=Cross-Origin-Embedder-Policy=require-corp -v

#rustup component add rust-src --toolchain nightly-aarch64-apple-darwin
#rustup component add rust-src --toolchain nightly-x86_64-pc-windows-msvc  

# for web run flutter_rust_bridge_codegen build-web 