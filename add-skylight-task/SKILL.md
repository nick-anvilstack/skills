---
name: add-skylight-task
description: Add tasks to Skylight family calendar using browser automation. Use when the user wants to add tasks, chores, or reminders to their Skylight calendar. Supports recurring tasks, different family members, stars, and emojis.
---

# Add Skylight Task

Add tasks to the Skylight family calendar at ourskylight.com using browser automation.

## Prerequisites

- Authenticated browser session with ourskylight.com (user must be logged in)
- Claude browser automation tools (mcp__claude-in-chrome__*) available
- Calendar ID: 4479924 (Nick's family calendar)

## Family Members (Profiles)

Available profiles to assign tasks to:
- **Nick** - Default for tasks unless specified
- **Chloe** - Mom
- **Clark** - Son
- **Max** - Son
- **Ruby** - Daughter
- **Birthdays** - For birthday-related tasks

## Step 1: Navigate to Add Task Page

Navigate to the Skylight tasks page and click the + button, or go directly to:
```
https://ourskylight.com/calendar/4479924/tasks/add
```

## Step 2: Fill in the Task Form

The form has these fields in order:

### Title (Required)
Type the task name in the Title field.

### Emoji (Optional)
Click "Emoji (optional)" to open the emoji picker. Search for a relevant emoji or browse categories. Good defaults:
- Water/cleaning: 💧
- Food/groceries: 🛒 or 🍎
- Exercise: 💪 or 🏃
- House: 🏠
- Kids: 👦 or 👧
- Pets: 🐕

### Profile (Required)
Click on the profile icon to assign the task:
- **Nick** (red N) - Default
- **Chloe** (photo)
- **Clark** (raccoon icon)
- **Max** (blue M)
- **Ruby** (photo)

### Task Type
- **Chore** (default) - One-time or recurring task
- **Routine** - Part of a daily routine

### Date
- Toggle ON to set a specific date
- Toggle OFF for "Any day" tasks (no specific due date)
- **Default: OFF** (no date) unless user specifies

### Time (Optional)
If Date is ON, optionally set a specific time.

### Repeats (Optional)
Toggle ON for recurring tasks. Configure:
- **Every**: 1, 2, 3...
- **Period**: Day, Week, Month, Year
- **On** (for weekly): Select days (Su, Mo, Tu, We, Th, Fr, Sa)
- **Repeats until**: Toggle ON to set end date, OFF for forever

### Stars (Default: 1)
Click on Stars and enter a number (1-10). Stars are reward points.
- **1 star** - Default for most tasks
- Higher stars for harder/more important tasks

### Save to Task Box
Leave unchecked unless saving as a template.

## Step 3: Submit

Click the blue "Add" button at the bottom to create the task.

## Default Settings

Unless specified by user:
- **Profile**: Nick
- **Date**: OFF (no specific date - shows as "Any day")
- **Stars**: 1
- **Save to task box**: OFF
- **Emoji**: Pick something relevant to the task

## Examples

### Simple task for Nick (default)
```
User: "Add a Skylight task to change humidifier filters"

1. Navigate to add task page
2. Title: "Change humidifier filters"
3. Emoji: 💧 (water drop)
4. Profile: Nick (click red N)
5. Date: OFF
6. Stars: 1
7. Click Add
```

### Recurring task for Nick every Saturday
```
User: "Add a Skylight task to adjust groceries recurring on Saturday"

1. Navigate to add task page
2. Title: "Adjust groceries"
3. Emoji: 🛒 (shopping cart)
4. Profile: Nick
5. Date: ON (set to next Saturday)
6. Repeats: ON
   - Every: 1 Week
   - On: Sa (Saturday selected)
7. Stars: 1
8. Click Add
```

### Task for a specific family member
```
User: "Add a Skylight task for Clark to go to karate"

1. Navigate to add task page
2. Title: "Karate"
3. Emoji: 🥋 (martial arts)
4. Profile: Clark (click raccoon icon)
5. Date: Set to karate day
6. Stars: 1
7. Click Add
```

### Recurring task on multiple days
```
User: "Add a Skylight task for K&DT recurring on Saturday and Sunday"

1. Navigate to add task page
2. Title: "K&DT"
3. Profile: Nick
4. Date: ON
5. Repeats: ON
   - Every: 1 Week
   - On: Sa AND Su (both selected)
6. Stars: 1
7. Click Add
```

## Batch Adding Tasks

When adding multiple tasks, use efficient workflow:
1. Add first task
2. After submission, click + button again
3. Repeat for each task

## Important Notes

- The Skylight UI requires scrolling on the add form - the Add button is at the bottom
- Profile icons: Nick=red N, Max=blue M, Clark=raccoon, Chloe/Ruby=photos
- "Any day" tasks (Date OFF) appear in the Chores section
- Dated tasks appear in Morning/Afternoon/Evening sections
- Repeating tasks show their schedule (e.g., "Weekly" or "Every 2 days")

## URL Reference

- Tasks page: `https://ourskylight.com/calendar/4479924/tasks`
- Add task: `https://ourskylight.com/calendar/4479924/tasks/add`
- Add task with date: `https://ourskylight.com/calendar/4479924/tasks/add?dateISO=YYYY-MM-DD`

## Troubleshooting

- If the Add button doesn't work, scroll down to ensure it's fully visible
- If profile selection doesn't stick, click directly on the profile icon (not the name)
- Browser extension connection issues: refresh the page and try again
