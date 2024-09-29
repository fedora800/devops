#!/bin/bash

# Number of days to filter images by
DAYS_OLD=0

# Get current date in seconds since epoch
current_date=$(date +%F)

# Convert current date to epoch time format
current_date_epoch=$(date -d "$current_date" +%s)
# List images and filter based on creation date
sudo docker images --format "{{.Repository}} {{.Tag}} {{.CreatedAt}}" | while read -r repo tag created_at; do
    # Extract date part from created_at and remove timezone info
    formatted_date=$(echo "$created_at" | awk '{print $1}')
    # Convert creation date to epoch time format
    created_date_epoch=$(date -d "$formatted_date" +%s 2>/dev/null)
    
    if [ -z "$created_date_epoch" ]; then
        echo "Date parsing failed for image $repo:$tag"
        continue
    fi

    # Calculate age in days
    age_days=$(( (current_date_epoch - created_date_epoch) / 86400 ))

    if [ "$age_days" -ge "$DAYS_OLD" ]; then
        echo "$repo:$tag is $age_days days old"
    fi
done

