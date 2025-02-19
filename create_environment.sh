#!/bin/bash

# Validating the username
validate_name() {
    if [[ ! $1 =~ ^[a-zA-Z0-9_-]+$ ]]; then
        echo "Error: Name must contain only letters, numbers, underscores, or hyphens."
        exit 1
    fi
}

# Name prompting
read -p "Enter your name: " user_name
validate_name "$user_name"

# Defining base directory
base_dir="submission_reminder_${user_name}"

# Creating directory structure
mkdir -p "$base_dir/app"
mkdir -p "$base_dir/config"
mkdir -p "$base_dir/modules"
mkdir -p "$base_dir/assets"

# Creating config.env
cat > "$base_dir/config/config.env" << 'EOL'
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

# Creating reminder.sh
cat > "$base_dir/app/reminder.sh" << 'EOL'
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions "$submissions_file"
EOL
chmod +x "$base_dir/app/reminder.sh"

# Creating functions.sh
cat > "$base_dir/modules/functions.sh" << 'EOL'
#!/bin/bash

function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"
    
    while IFS=, read -r student assignment status; do
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)
        
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted $ASSIGNMENT!"
        fi
    done < <(tail -n +2 "$submissions_file")
}
EOL
chmod +x "$base_dir/modules/functions.sh"

# Create submissions.txt
cat > "$base_dir/assets/submissions.txt" << 'EOL'
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Trezor, Shell Navigation, not submitted
Elyse, Shell Navigation, not submitted
Uwase, Shell Navigation, not submitted
Lysa, Shell Navigation, not submitted
Pati, Shell Navigation, not submitted
Kayiranga, Shell Navigation, not submitted
Karenzi, Shell Navigation, not submitted
EOL

# Create startup.sh
cat > "$base_dir/startup.sh" << 'EOL'
#!/bin/bash

if pgrep -f "app/reminder.sh" > /dev/null; then
    echo "Submission Reminder is already running!"
    exit 1
fi

cd "$(dirname "$0")"
./app/reminder.sh

echo "Submission check completed!"
EOL
chmod +x "$base_dir/startup.sh"

echo "Setup complete. Navigate to '$base_dir' and run ./startup.sh to start the application."
