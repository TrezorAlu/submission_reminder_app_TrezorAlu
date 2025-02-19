# Submission Reminder System for Shell Navigation 

A practical shell scripting project that creates a submission tracking system for ALU students. This project is part of the Shell Navigation course and demonstrates the implementation of shell scripting concepts.

## Project Overview

Created by: AluTrezor
GitHub Repository: submission_reminder_app_AluTrezor

This system helps track and remind students about their Shell Navigation assignment submissions. It's built using bash scripting and follows a modular directory structure for better organization and maintenance.

## Quick Start

1. Clone the repository:
   
   git clone https://github.com/AluTrezor/submission_reminder_app_AluTrezor.git
 

2. Go to the project folder:
 
   cd submission_reminder_app_AluTrezor
  

3. Make the setup script executable:
   
   chmod +x create_environment.sh
   

4. Run it:
   
   ./create_environment.sh
   

5. Enter your name when prompted and let the script set up your environment.

## How It Works

The system will:
- Track Shell Navigation assignment submissions
- Show the remaining days for submission
- Display reminders for students who haven't submitted yet

## Directory Structure


submission_reminder_[yourname]/
├── app/
│   └── reminder.sh        # The main reminder script
├── config/
│   └── config.env        # Configuration settings
├── modules/
│   └── functions.sh      # Helper functions
├── assets/
│   └── submissions.txt   # Student records
└── startup.sh           # Starts the application


## Running the App

1. Go to your directory:
   
   cd submission_reminder_[yourname]
   

2. Start the app:
   
   ./startup.sh
   

## Student Records

The system tracks these students:
- Chinemerem
- Chiagoziem
- Divine
- Anissa
- Trezor
- Elyse
- Uwase
- Lysa
- Pati
- Kayiranga
- Karenzi

To add more students, edit `assets/submissions.txt` following this format:

student, assignment, submission status
[name], Shell Navigation, not submitted


## Common Issues & Fixes

If scripts won't run:

chmod +x startup.sh
chmod +x app/reminder.sh
chmod +x modules/functions.sh


If you see "already running":

pkill -f "app/reminder.sh"


## About This Project

This project is part of the Shell Navigation course at ALU. It demonstrates:
- Creating and running shell scripts
- Working with directories and files
- Managing file permissions
- Processing CSV files
- Basic process management

## Created By
AluTrezor  
African Leadership University  
Introduction to Linux and IT tools
