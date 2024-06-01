
# TODO Task Manager Script

This is a simple bash script to manage your TODO tasks. The tasks are stored in a text file located at `/home/todo/todo.txt`.

## Prerequisites

- Bash shell

## Usage

To use the script, you need to call it from the command line with the appropriate command. The available commands are: `create`, `update`, `delete`, `show`, `list`, `search`, and `help`.

```bash
./todo.sh [command]
```

## Commands

### `create`

Create a new task.

```bash
./todo.sh create
```

You will be prompted to enter the following details:
- Title
- Description (optional)
- Location (optional)
- Due date (format: YYYY-MM-DD HH:MM)
- Completion marker (yes/no)

### `update`

Update an existing task.

```bash
./todo.sh update
```

You will be prompted to enter the task ID and new values for the task fields (leave blank to keep the current value).

### `delete`

Delete a task by its ID.

```bash
./todo.sh delete
```

You will be prompted to enter the task ID to delete.

### `show`

Show information about a specific task by its ID.

```bash
./todo.sh show
```

You will be prompted to enter the task ID.

### `list`

List tasks for a specific date.

```bash
./todo.sh list
```

You will be prompted to enter the date (format: YYYY-MM-DD). The script will display completed and uncompleted tasks for that date.

### `search`

Search for a task by its title.

```bash
./todo.sh search
```

You will be prompted to enter the task title.

### `help`

Display the help message.

```bash
./todo.sh help
```

### Default Behavior

If the script is run without any arguments, it will display tasks for the current day.

```bash
./todo.sh
```

## Example

Creating a new task:

```bash
./todo.sh create
```

Updating a task:

```bash
./todo.sh update
```

Deleting a task:

```bash
./todo.sh delete
```

Showing a task:

```bash
./todo.sh show
```

Listing tasks for a specific date:

```bash
./todo.sh list
```

Searching for a task:

```bash
./todo.sh search
```

Displaying the help message:

```bash
./todo.sh help
```

## Notes

- The tasks are stored in `/home/todo/todo.txt` in the following format:

  ```
  id|title|description|location|due_date|completion
  ```

- Ensure the file `/home/todo/todo.txt` exists and has the appropriate permissions for the script to read and write.

- Task IDs are generated using the current timestamp.
