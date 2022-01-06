use ansi_colours::*;

fn main() {
    // Colour at given index:
    println!("{:-3}: {:?}", 50, rgb_from_ansi256(50));

    // Approximate true-colour by colour in the palette:
    let rgb = (100, 200, 150);
    let index = ansi256_from_rgb(rgb);
    println!("{:?} ~ {:-3} {:?}", rgb, index, rgb_from_ansi256(index));
}
