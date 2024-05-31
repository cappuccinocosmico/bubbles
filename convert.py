import os
import subprocess

def convert_tex_to_md(input_folder):
    # Get a list of all .tex files in the input folder
    tex_files = [f for f in os.listdir(input_folder) if f.endswith('.tex')]

    for tex_file in tex_files:
        # Define full file paths
        input_path = os.path.join(input_folder, tex_file)
        output_path = os.path.join(input_folder, os.path.splitext(tex_file)[0] + '.md')

        # Call pandoc to convert .tex to .md
        try:
            subprocess.run(['pandoc', '-s', input_path, '-o', output_path], check=True)
            print(f"Converted {tex_file} to {os.path.basename(output_path)}")
        except subprocess.CalledProcessError as e:
            print(f"An error occurred while converting {tex_file}: {e}")

if __name__ == "__main__":
    input_folder = '/home/nicole/Documents/math/bubbles/BubblesBook/'  # Replace with your folder path
    convert_tex_to_md(input_folder)
