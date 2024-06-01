#!/bin/bash

# Directory containing the .tex files
input_dir="./BubblesBook/"
# Directory to store the .md files
output_dir="./Bubbles"

# Create the output directory if it does not exist
mkdir -p "$output_dir"

# Loop through each .tex file in the input directory
for tex_file in "$input_dir"/*.tex; do
	# Get the base name of the file (without path and extension)
	base_name=$(basename "$tex_file" .tex)
	# Define the output file path
	md_file="$output_dir/$base_name.md"

	# Convert the .tex file to .md
	pandoc "$tex_file" -o "$md_file"

	echo "Converted $tex_file to $md_file"
done
