#!/bin/bash

TODO_FILE="/home/todo/todo.txt"

function create_task() {
    echo "Enter title:"
    read title
    echo "Enter description (optional):"
    read description
    echo "Enter location (optional):"
    read location
    echo "Enter due date (YYYY-MM-DD HH:MM):"
    read due_date
    echo "Enter completion marker (yes/no):"
    read completion

    id=$(date +%s)
    echo "$id|$title|$description|$location|$due_date|$completion" >> $TODO_FILE
    echo "Task created with ID $id."
}

function update_task() {
    echo "Enter task ID to update:"
    read id
    task=$(grep "^$id|" $TODO_FILE)
    if [ -z "$task" ]; then
        echo "Task not found."
        exit 1
    fi

    IFS='|' read -r task_id title description location due_date completion <<< "$task"

    echo "Enter new title (current: $title):"
    read new_title
    new_title=${new_title:-$title}
    
    echo "Enter new description (current: $description):"
    read new_description
    new_description=${new_description:-$description}

    echo "Enter new location (current: $location):"
    read new_location
    new_location=${new_location:-$location}

    echo "Enter new due date (current: $due_date):"
    read new_due_date
    new_due_date=${new_due_date:-$due_date}

    echo "Enter new completion marker (current: $completion):"
    read new_completion
    new_completion=${new_completion:-$completion}

    sed -i "/^$id|/d" $TODO_FILE
    echo "$id|$new_title|$new_description|$new_location|$new_due_date|$new_completion" >> $TODO_FILE
    echo "Task updated."
}

function delete_task() {
    echo "Enter task ID to delete:"
    read id
    sed -i "/^$id|/d" $TODO_FILE
    echo "Task deleted."
}

function show_task() {
    echo "Enter task ID to show:"
    read id
    grep "^$id|" $TODO_FILE || echo "Task not found."
}

function list_tasks() {
    echo "Enter date to list tasks (YYYY-MM-DD):"
    read date
    echo "Completed tasks:"
    grep "|$date" $TODO_FILE | grep "|yes$" || echo "No completed tasks."
    echo "Uncompleted tasks:"
    grep "|$date" $TODO_FILE | grep "|no$" || echo "No uncompleted tasks."
}

function search_task() {
    echo "Enter task title to search:"
    read title
    grep "|$title|" $TODO_FILE || echo "Task not found."
}

function display_tasks_today() {
    date=$(date +%Y-%m-%d)
    echo "Tasks for today ($date):"
    grep "|$date" $TODO_FILE || echo "No tasks for today."
}

function show_help() {
    echo "Usage: ./todo.sh [command]"
    echo ""
    echo "Commands:"
    echo "  create      Create a new task"
    echo "  update      Update an existing task"
    echo "  delete      Delete a task"
    echo "  show        Show information about a task"
    echo "  list        List tasks for a given date"
    echo "  search      Search for a task by title"
    echo "  help        Display this help message"
    echo ""
    echo "When invoked without arguments, the script displays tasks for the current day."
}

if [ $# -eq 0 ]; then
    display_tasks_today
    exit 0
fi

case $1 in
    create) create_task ;;
    update) update_task ;;
    delete) delete_task ;;
    show) show_task ;;
    list) list_tasks ;;
    search) search_task ;;
    help) show_help ;;
    *) echo "Invalid command. Use create, update, delete, show, list, or search." ;;
esac
