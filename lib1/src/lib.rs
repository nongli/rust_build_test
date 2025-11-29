use std::collections::HashMap;

#[unsafe(no_mangle)]
pub extern "C" fn rust_function_2() {
    let mut m = HashMap::new();
    m.insert(1, "a");
    println!("FN1 {}", m.len());
}
