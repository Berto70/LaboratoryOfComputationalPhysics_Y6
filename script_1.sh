#!/bin/bash

# 1.a
mkdir -p bash/students

if [ ! -f ./bash/students/LCP_22-23_students.csv ]; then

    # Download the CSV file from Dropbox.
    wget https://www.dropbox.com/s/867rtx3az6e9gm8/LCP_22-23_students.csv -O ./bash/students/LCP_22-23_students.csv

    # Check if the download was successful.
    if [ $? -eq 0 ]; then
        echo "1.a) CSV file downloaded successfully."
    else
        echo "Error downloading CSV file."
        exit 1
    fi
else
    echo "1.a) CSV file already exists."
fi

# 1.b
cd ./bash/students

# Get the list of students from the CSV file.
students=$(cat LCP_22-23_students.csv)

# Create two new files, one for PoD students and one for Physics students.
touch ./pod_students.csv
touch ./physics_students.csv

# Split the list of students into two lists, one for PoD students and one for Physics students.
pod_students=$(grep "PoD" <<< "$students")
physics_students=$(grep "Physics" <<< "$students")

# Write the PoD students to the "pod_students.csv" file.
echo "$pod_students" > ./pod_students.csv

# Write the Physics students to the "physics_students.csv" file.
echo "$physics_students" > ./physics_students.csv

# Print a message to the user.
echo "1.b) Two new files have been created."

# 1.c
echo "1.c) First letter count:"
for letter in {A..Z}; do
    echo "$letter: $(grep -i "^$letter" LCP_22-23_students.csv | wc -l)"
done

# 1.d
echo "1.d) Letter with most counts:"
for letter in {A..Z}; do
    echo "$letter: $(grep -i "^$letter" LCP_22-23_students.csv | wc -l)"
done | sort -t: -k2 -n | tail -1

# 1.e
awk -F, 'BEGIN{group=1} {print > "group_"group".csv"; if(NR%18==0){group++}}' LCP_22-23_students.csv
echo "1.e) Files created"
