#!/bin/bash

#By Saad Benmoussa & Fadi Bahtat


#"EX5:"
#"1-Create a Task."
#"2-Update a Task."
#"3-Delete a Task."
#"4-Show information about a Task."
#"5-List tasks of a given day."
#"6-Search for a task by title."
#"7-Mark a Task as Done."

file="todo_tasks.txt"

help(){
    printf "
Usage: todo [OPTION] [ITEM]

todo manages todo lists in an easy to use way.

Options:
    todo.sh                        # It gives a list of todo tasks
    todo.sh create                 # Create a new task
    todo.sh create n               # Create a n number of new tasks
    todo.sh update                 # It gives the list of Tasks That can be updated
    todo.sh update n               # Update the information given in the ID numbered n
    todo.sh update n m             # Update the information given in the ID n and in a given type m(1-3)
    todo.sh delete                 # It gives the list of Tasks That can be deleted
    todo.sh delete n               # delete the task that in the ID numbered n
    todo.sh delete n m             # delete the information given in the ID n and in a given type m
    todo.sh list                   # It gives a list of all the todo tasks
    todo.sh list n                 # It gives a task with the id n from the list of todo tasks
    todo.sh list date n            # It gives a task with the given date n
    todo.sh list day n             # It gives a task with the given day n
    todo.sh list done              # It gives a list of all done todo tasks
    todo.sh list notdone           # It gives a list of all not done todo tasks
    todo.sh done                   # It gives a list of the not done listes
    todo.sh done n                 # Mark a task as done by its ID
    todo.sh search n               # It gives a the tasks with the given title n
    todo.sh help                   # Show this help output
    todo.sh help ex                # Show the help example output

See 'todo.sh help ex' for usage examples.
"
}

helpex(){
    printf "
todo usage examples:
    todo.sh                        # Lists all items in all todo lists
    todo.sh create                 # Create a new task
    todo.sh create 2               # Create 2 new tasks task
    todo.sh update                 # It gives the list of Tasks That can be updated
    todo.sh update 2               # Update the information of the second task
    todo.sh update 2 1             # Update the title of the second task
    todo.sh update 2 2             # Update the description of the second task
    todo.sh update 2 3             # Update the date of the second task
    todo.sh delete                 # It gives the list of Tasks That can be deleted
    todo.sh delete 2               # delete the second task
    todo.sh delete 2 3             # delete the date of the second task
    todo.sh list                   # It gives a list of all the todo tasks
    todo.sh list 2                 # It gives the information about the second task
    todo.sh list date 25-03-2024   # It gives a task with the given date (dd-mm-yy)
    todo.sh list day 25            # It gives a task with the given day
    todo.sh list done              # It gives a list of all done todo tasks
    todo.sh list notdone           # It gives a list of all not done todo tasks
    todo.sh done                   # It gives a list of the not done listes
    todo.sh done 2                 # Mark the second task as done
    todo.sh search ant             # It gives a the tasks with the given title
    todo.sh help                   # Show the help output
    todo.sh help ex                # Show this help example output
    
"
}

idgen() {
    if [ ! -f "$file" ]; then
        echo "1"
        return
    fi
    id=$(grep -o '^[^|]*' "$file" | sort -n | tail -n 1)
    if [ -z "$id" ]; then
        echo "1"
    else
        nid=$((id + 1))
        echo "$nid"
    fi
}


create_task() {
    if [ -z "$times" ]; then
        times="1"
    fi
    
    figlet "           ToDo"
    echo "Create a task :"

    for ((i = 1; i <= times; i++)); do
        title=""
        date=""
        while [ -z "$title" ]; do
            echo "1-The task title (required): "
            read -r title
            if [ -z "$title" ]; then
                echo "Title is required. Please try again."
            fi
        done

        echo "2-The Task description:"
        read -r description

        while [ -z "$date" ]; do
            echo "3- The Task date (dd-mm-yyyy) (required): "
            read -r date

            if [ -z "$date" ]; then
                echo "Date is required. Please try again."
            elif ! echo "$date" | grep -qE '^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-[0-9]{4}$'; then
                echo "Invalid date format. Please use the format dd-mm-yyyy. Please try again."
                date=""
            fi
        done

        creation_date=$(date '+%d-%m-%Y')
        id=$(idgen)
        status="not done"
        echo "$id|$title|$description|$date|$creation_date|$status" >> todo_tasks.txt
        echo "Task created with ID: $id"
    done
}

update_task() {
    if [ -z "$2" ]; then
        echo "Available tasks for update:"
        cat -n "$file"
        echo "Enter the ID of the task you want to update: "
        read -r task_id
    else
        task_id="$2"
    fi

    if grep -q "^$task_id|" "$file"; then
        if [ -z "$3" ]; then
            echo "What do you want to update?"
            echo "1. Title"
            echo "2. Description"
            echo "3. Date"
            read -r field_option
        else
            field_option="$3"
        fi

        case "$field_option" in
            1) field="title"; field_number=2 ;;
            2) field="description"; field_number=3 ;;
            3) field="date"; field_number=4 ;;
            *) echo "Invalid field number. Use 1 for title, 2 for description, 3 for date."; return ;;
        esac

        echo "Enter new $field: "
        read -r new_value

        if [ "$field" == "date" ]; then
            if ! echo "$new_value" | grep -qE '^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-[0-9]{4}$'; then
                echo "Invalid date format. Please use the format dd-mm-yyyy."
                return
            fi
        fi

        if awk -F '|' -v id="$task_id" -v field_number="$field_number" -v new_value="$new_value" '
            BEGIN { OFS="|"; found=0; }
            {
                if ($1 == id) {
                    found=1;
                    $field_number = new_value;
                }
                print;
            }
            END { exit !found; }
            ' "$file" > temp && mv temp "$file"
        then
            echo "Task $task_id updated."
        else
            echo "Task ID $task_id not found."
        fi
    else
        echo "Task ID $task_id not found."
    fi
}

delete_task() {
    if [ -z "$2" ]; then
        echo "Available tasks for deletion:"
        cat -n "$file"
        echo "Enter the ID of the task you want to delete: "
        read -r task_id
    else
        task_id="$2"
    fi

    if grep -q "^$task_id|" "$file"; then
        if sed -i "" "/^$task_id|/d" "$file"; then
            echo "Task $task_id deleted."
        else
            echo "Error: Task $task_id could not be deleted."
        fi
    else
        echo "Task ID $task_id not found."
    fi
}

list_task() {
    printf "%-10s | %-20s | %-30s | %-12s | %-12s | %-8s\n" "ID" "Title" "Description" "Date" "Creation Date" "Status"
    while IFS='|' read -r id title description date creation_date status; do
        printf "%-10s | %-20s | %-30s | %-12s | %-12s | %-8s\n" "$id" "$title" "$description" "$date" "$creation_date" "$status"
    done < "$file"
}

list_tasks_date() {
    if [ -z "$3" ]; then
        echo "Please provide a date in the format dd-mm-yyyy."
    else
        date="$3"
        if grep -q "|$date|" "$file"; then
            grep "|$date|" "$file" | while IFS='|' read -r id title description task_date creation_date status; do
                printf "%-10s | %-20s | %-30s | %-12s | %-12s | %-8s\n" "$id" "$title" "$description" "$task_date" "$creation_date" "$status"
            done
        else
            echo "No tasks found for date $date."
        fi
    fi
}

list_tasks_day() {
    if [ -z "$3" ]; then
        echo "Please provide a day."
    else
        day="$3"
        if grep -q "|$day-" "$file"; then
            grep "|$day-" "$file" | while IFS='|' read -r id title description task_date creation_date status; do
                printf "%-10s | %-20s | %-30s | %-12s | %-12s | %-8s\n" "$id" "$title" "$description" "$task_date" "$creation_date" "$status"
            done
        else
            echo "No tasks found for day $day."
        fi
    fi
}

search_task_by_title() {
    if [ -z "$2" ]; then
        echo "Please provide a title to search for."
    else
        title="$2"
        matching_tasks=$(grep -i "|$title|" "$file")
        if [ -n "$matching_tasks" ]; then
            echo "Tasks found with title containing '$title':"
            printf "%-10s | %-20s | %-30s | %-12s | %-12s | %-8s\n" "ID" "Title" "Description" "Date" "Creation Date" "Status"
            echo "$matching_tasks" | while IFS='|' read -r id task_title description task_date creation_date status; do
                printf "%-10s | %-20s | %-30s | %-12s | %-12s | %-8s\n" "$id" "$task_title" "$description" "$task_date" "$creation_date" "$status"
            done
        else
            matching_tasks=$(grep -i "|$title" "$file")
            if [ -n "$matching_tasks" ]; then
                echo "Tasks found with approximate title '$title':"
                printf "%-10s | %-20s | %-30s | %-12s | %-12s | %-8s\n" "ID" "Title" "Description" "Date" "Creation Date" "Status"
                echo "$matching_tasks" | while IFS='|' read -r id task_title description task_date creation_date status; do
                    printf "%-10s | %-20s | %-30s | %-12s | %-12s | %-8s\n" "$id" "$task_title" "$description" "$task_date" "$creation_date" "$status"
                done
            else
                echo "No tasks found with title containing '$title'."
            fi
        fi
    fi
}

mark_task_done() {
    if [ -z "$2" ]; then
    list_task_notdone
    else
        task_id="$2"
        echo "Task ID: $task_id"
        while IFS='|' read -r id title description date creation_date status; do
            if [ "$id" == "$task_id" ]; then
                echo "$id|$title|$description|$date|$creation_date|done" >> temp_file.txt
            else
                echo "$id|$title|$description|$date|$creation_date|$status" >> temp_file.txt
            fi
        done < "$file"
        mv temp_file.txt "$file"
        echo "Task $task_id marked as done."
    fi
}

list_task_done() {
    printf "%-10s | %-20s | %-30s | %-12s | %-12s | %-8s\n" "ID" "Title" "Description" "Date" "Creation Date" "Status"
    while IFS='|' read -r id title description date creation_date status; do
        if [ "$status" == "done" ]; then
            printf "%-10s | %-20s | %-30s | %-12s | %-12s | %-8s\n" "$id" "$title" "$description" "$date" "$creation_date" "$status"
        fi
    done < "$file"
}
list_task_notdone() {
    printf "%-10s | %-20s | %-30s | %-12s | %-12s | %-8s\n" "ID" "Title" "Description" "Date" "Creation Date" "Status"
    while IFS='|' read -r id title description date creation_date status; do
        if [ "$status" == "notdone" ]; then
            printf "%-10s | %-20s | %-30s | %-12s | %-12s | %-8s\n" "$id" "$title" "$description" "$date" "$creation_date" "$status"
        fi
    done < "$file"
}




if [ $# -eq 0 ]; then
    list_task
else
    case $1 in
        "create")
            if [[ -z "$2" ]]; then
                create_task
            elif [[ "$2" =~ ^[0-9]+$ ]]; then
                times="$2"
                create_task
            else
                echo "Use a number instead"
            fi
            ;;
        "update")
            update_task "$@"
            ;;
        "delete")
            delete_task "$@"
            ;;
        "list")
            case $2 in
                "")
                    list_task
                    ;;
                "date")
                    list_tasks_date "$@"
                    ;;
                "day")
                    list_tasks_day "$@"
                    ;;
                "done")
                    list_tasks_done "$@"
                    ;;
                "notdone")
                    list_tasks_notdone "$@"
                    ;;
                *)
                    list_task
                    ;;
            esac
            ;;
        "done")
            mark_task_done "$@"
            ;;
        "search")
            search_task_by_title "$@"
            ;;
        "help")
            case $2 in
                "")
                    help
                    ;;
                "ex")
                    helpex
                    ;;
                *)
                    echo "Usage: todo [ex]"
                    ;;
            esac
            ;;
        *)
            echo "Usage: todo [create|update|delete|list|done|search|help|help ex]"
            ;;
    esac
fi


