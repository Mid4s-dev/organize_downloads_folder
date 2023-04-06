#!/bin/bash

# Define the path to the Downloads folder
downloads_path="$HOME/Downloads"

# Define an array of file extensions and their corresponding folder names
declare -A file_extensions=(
    ["pdf"]="PDFs"
    ["doc"]="Word_Docs"
    ["docx"]="Word_Docs"
    ["txt"]="Text_Files"
    ["png"]="Images"
    ["jpg"]="Images"
    ["otd"]="Word_docs"
    ["ppt"]="presentation_slides"
    ["pptx"]="presentation_slides"
    ["xls"]="exel_sheets"
    ["zip"]="zip_files"
    ["tar.gz"]="zip_files"
    ["rar"]="zip_files"

)

# Loop through all files in the Downloads folder
for file in "$downloads_path"/*; do
    # Check if the file is actually a file (not a directory)
    if [[ -f "$file" ]]; then
        # Extract the file extension
        extension="${file##*.}"
        
        # Check if the file extension is in our array
        if [[ ${file_extensions[$extension]+_} ]]; then
            # Get the name of the folder for this file extension
            folder_name="${file_extensions[$extension]}"
            
            # Create the folder if it doesn't already exist
            if [[ ! -d "$downloads_path/$folder_name" ]]; then
                mkdir "$downloads_path/$folder_name"
            fi
            
            # Move the file to the appropriate folder
            mv "$file" "$downloads_path/$folder_name/"
            
            # Print a message indicating which file was moved and to where
            echo "Moved file $file to $downloads_path/$folder_name/"
        fi
    fi
done
