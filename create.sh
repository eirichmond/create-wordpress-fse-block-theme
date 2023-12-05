#!/bin/bash

# Function to convert a string to lowercase and replace spaces with hyphens
normalize_string() {
    local result="$1"
    result=$(echo "$result" | tr '[:upper:]' '[:lower:]')  # Convert to lowercase
    result=$(echo "$result" | tr ' ' '-')                  # Replace spaces with hyphens
    echo "$result"
}

# Prompt the user for a name
echo "Enter a themename:"
read themename
echo "Enter a themeuri:"
read themeuri
echo "Enter a themeauthor:"
read themeauthor
echo "Enter a authoruri:"
read authoruri

# Normalize the name using the function
theme_slug=$(normalize_string "$themename")


# Get the current directory
current_directory=$(pwd)

# Specify the directory where you want to create a new directory
target_directory="wp-content/themes"

# Concatenate the current directory and target directory
concatenated_directory="$current_directory/$target_directory"

# Change into the target directory
cd "$concatenated_directory" || { echo "Error: Unable to change into the target directory."; exit 1; }

# Create a directory with the entered name
mkdir "$theme_slug"

# Check if the directory was created successfully
if [ $? -eq 0 ]; then
    echo "Directory '$themename' created successfully in '$target_directory'."
else
    echo "Error creating directory '$themename' in '$target_directory'."
fi

# Set variables for relative paths
theme_dir="$concatenated_directory/$theme_slug"
templates_dir="$concatenated_directory/$theme_slug/templates"
parts_dir="$concatenated_directory/$theme_slug/parts"

# Change into theme directory
cd "$theme_dir"

# Create diretories
mkdir "templates"
mkdir "parts"

# Create index.php file with content
echo "<?php // silence is golden" > index.php

# Echo content into styles.css
echo "/*" >> style.css
echo "Theme Name: $themename" >> style.css
echo "Theme URI: https://$themeuri" >> style.css
echo "Author: $themeauthor" >> style.css
echo "Author URI: https://$authoruri" >> style.css
echo "Text Domain: $theme_slug" >> style.css
echo "*/" >> style.css


# Echo content into theme.json
echo '{
    "$schema": "https://schemas.wp.org/trunk/theme.json",
    "version": 2,
    "settings": {
    },
    "styles": {
    }
}' > theme.json

# Change into templates directory
cd $templates_dir

# Echo content into index.html
echo '' > index.html

# Change into parts directory
cd $parts_dir

# Echo content into header.html and footer.html
echo '' > header.html
echo '' > footer.html
