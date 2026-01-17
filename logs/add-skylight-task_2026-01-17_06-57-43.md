# Skill Creation Log: add-skylight-task

**Created**: 2026-01-17 06:57:43
**Skill**: add-skylight-task
**Description**: Add tasks to Skylight family calendar using browser automation

## Initial Prompt

User asked to create a skill for adding tasks to Skylight family calendar (ourskylight.com/calendar/4479924/tasks). The goal was to be able to say things like:
- "Add a Skylight task to <x>"
- "Add a recurring Skylight task for Clark every Saturday to work out for 1 star"
- "Turn this into Skylight tasks"

The user wanted:
- Default tasks for Nick unless specified
- Default no date (shows as "Any day")
- Not save to task box
- Set to 1 star
- Pick relevant emoji

## Context

- Skylight doesn't have an official API
- Browser automation via Claude in Chrome is required
- The UI requires multiple clicks and sometimes scrolling
- Calendar ID is 4479924 for Nick's family

## Exploration Process

1. Navigated to https://ourskylight.com/calendar/4479924/tasks
2. Clicked the + button to open the add task form
3. Mapped out all form fields:
   - Title
   - Emoji (optional)
   - Profiles (Birthdays, Chloe, Clark, Max, Nick, Ruby)
   - Chore/Routine toggle
   - Date toggle
   - Time field
   - Repeats toggle with day selection
   - Stars field
   - Save to task box checkbox
   - Add button

4. Successfully added test tasks:
   - "Change humidifier filters" with water emoji, Nick, 1 star, no date
   - "Adjust groceries" recurring Saturday, Nick, 1 star

## Network API Discovery

The Skylight app uses an API at `https://app.ourskylight.com/api/frames/4479924/...` but we weren't able to capture the exact POST request for creating tasks. The skill uses browser automation instead.

## Changes Made

- Created add-skylight-task/SKILL.md with complete instructions
- Documented all form fields and their options
- Provided examples for common use cases
- Included troubleshooting tips

## Future Improvements

- Could investigate the API further to enable direct API calls
- Could integrate with the queue_coding_task system for remote invocation
- Could add MCP tool for direct invocation without full skill instructions
