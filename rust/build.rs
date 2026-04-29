fn main() {
    let target_os = std::env::var("CARGO_CFG_TARGET_OS").unwrap_or_default();
    
    // For macOS targets, tell the linker to use an @rpath-based install_name
    // instead of the absolute file path.
    if target_os == "macos" {
        println!("cargo:rustc-cdylib-link-arg=-Wl,-install_name,@rpath/libarb_stealth_engine.dylib");
    }
}
