#!/bin/bash

# Function to display directory structure
display_structure() {
    local dir=${1:-.}
    local indent=${2:-0}
    local prefix=${3:-}

    local files=("$dir"/*)
    for file in "${files[@]}"; do
        if [[ -d "$file" ]]; then
            printf "%*s%s%s/\n" $indent "" "$prefix" "$(basename "$file")"
            display_structure "$file" $((indent + 4)) "├── "
        else
            printf "%*s%s%s\n" $indent "" "$prefix" "$(basename "$file")"
        fi
    done
}

# Create main project directories
mkdir -p src/{routes,models,handlers,db}
mkdir -p frontend
mkdir -p tests

# Create initial Rust files
touch src/main.rs
touch src/lib.rs

# Create initial frontend files (assuming we'll set up React later)
touch frontend/package.json

# Create project management directories
mkdir -p project/{tasks,timeline,documentation,ideas}

# Output the created structure
echo "Project structure created:"
display_structure